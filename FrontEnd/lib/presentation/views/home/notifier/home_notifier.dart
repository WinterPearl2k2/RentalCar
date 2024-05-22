import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/contract_service.dart';
import 'package:rental_car/application/services/firebase_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/views/home/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() => const HomeState();

  Future<void> getListTopCars() async {
    try {
      final listTopCar = await injection.getIt<ICarService>().getTopCar();
      state = state.copyWith(
        listTopCar: listTopCar,
        statusTopCar: Status.success,
      );
      LogUtils.i("get list top car successfully");
    } catch (e) {
      LogUtils.e("get list top car fail $e");
      state = state.copyWith(statusTopCar: Status.error);
    }
  }

  Future<void> getListSearchCars({required String nameCar}) async {
    try {
      state = state.copyWith(
        listSearchCar: [],
      );
      final listSearchCar =
          await injection.getIt<ICarService>().getSearchCar(nameCar: nameCar);
      state = state.copyWith(
        listSearchCar: listSearchCar,
        statusSearch: Status.success,
      );
      LogUtils.i("get list search car successfully");
    } catch (e) {
      LogUtils.e("get list search car fail $e");
      state = state.copyWith(statusSearch: Status.error);
    }
  }

  Future<void> clearSearch() async {
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    state = state.copyWith(
      isCheckSearch: false,
      listSearchCar: [],
    );
  }

  void isCheckSearch({required String searchController}) {
    final isCheckSearch = searchController.isEmpty ? false : true;
    state = state.copyWith(
      isCheckSearch: isCheckSearch,
      statusSearch: Status.loading,
    );
  }

  Future<void> getListAllCars() async {
    try {
      final listAllCar = await injection.getIt<ICarService>().getAllCar();
      state = state.copyWith(
        listAllCar: listAllCar,
        statusNearCar: Status.success,
      );
      LogUtils.i("get list car near you successfully");
    } catch (e) {
      LogUtils.e("get list car near you fail $e");
      state = state.copyWith(statusNearCar: Status.error);
    }
  }

  Future<void> getLocationUser() async {
    double currentLatitude = PreferenceService.getLocation().latitude;
    double currentLongitude = PreferenceService.getLocation().longitude;
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(currentLatitude, currentLongitude);
    setNameLocation(
        nameLocation: placeMarks.isNotEmpty
            ? "${placeMarks[0].subAdministrativeArea}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].country}"
            : "Loading...");
  }

  Future<void> _handleOpenAppMessage(RemoteMessage msg) async {
    await getNumberNotification();
  }

  Future<void> getNumberNotification() async {
    try {
      final count = await injection.getIt<IContractService>().getNotification();
      state = state.copyWith(numberNewNotification: count);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
    }
  }

  Future<void> _handleMessage(RemoteMessage msg) async {
    await getNumberNotification();
  }

  Future<void> setListenMessage() async {
    injection.getIt<FirebaseService>().handleMessage(
          onChangedMessage: _handleMessage,
          onMessageOpenApp: _handleOpenAppMessage,
        );
  }

  void resetNumberNotification() {
    state = state.copyWith(numberNewNotification: 0);
  }

  void setNameLocation({required String nameLocation}) =>
      state = state.copyWith(nameLocation: nameLocation);
}
