import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/dtos/all_car_dto.dart';
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
      if (listTopCar.isEmpty) {
        state = state.copyWith(
          status: Status.success,
          listTopCar: [],
        );
      } else {
        state = state.copyWith(
          status: Status.success,
          listTopCar: listTopCar,
        );
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
    }
  }

  Future<void> getListSearchCars({required String nameCar}) async {
    try {
      state = state.copyWith(
        statusSearch: Status.loading,
        listSearchCar: [],
      );
      final listSearchCar =
          await injection.getIt<ICarService>().getSearchCar(nameCar: nameCar);
      if (listSearchCar.isEmpty) {
        state = state.copyWith(
          statusSearch: Status.success,
          listSearchCar: [],
        );
      } else {
        state = state.copyWith(
          statusSearch: Status.success,
          listSearchCar: listSearchCar,
        );
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
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
    if (searchController.isEmpty) {
      state = state.copyWith(isCheckSearch: false);
    } else {
      state = state.copyWith(isCheckSearch: true, statusSearch: Status.loading);
    }
  }

  int currentPage = 1;
  final int pageSize = 2;
  bool isLoadingMore = false;

  Future<void> getListAllCars() async {
    try {
      if (isLoadingMore) return;
      isLoadingMore = true;

      final listAllCar = await injection.getIt<ICarService>().getAllCar(
            page: currentPage,
            pageSize: pageSize,
          );
      if (listAllCar.isNotEmpty) {
        double currentLatitude = PreferenceService.getLocation().latitude;
        double currentLongitude = PreferenceService.getLocation().longitude;

        List<AllCarDTO> updatedListAllCar = listAllCar.map((car) {
          double distance = Geolocator.distanceBetween(
            currentLatitude,
            currentLongitude,
            car.latCar,
            car.longCar,
          );
          return car.copyWith(distanceCar: distance);
        }).toList();

        updatedListAllCar.sort((a, b) {
          int dateComparison = b.createAt.compareTo(a.createAt);
          if (dateComparison != 0) {
            return dateComparison;
          } else {
            double distanceA = a.distanceCar;
            double distanceB = b.distanceCar;
            return distanceA.compareTo(distanceB);
          }
        });

        state = state.copyWith(
          status: Status.success,
          listAllCar: [...state.listAllCar, ...updatedListAllCar],
        );

        currentPage++;
      }

      isLoadingMore = false;
      LogUtils.i("get list car near you oke");
    } catch (e) {
      isLoadingMore = false;
      LogUtils.i(e.toString());
    }
  }

  Future<void> getLocationUser() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      state = state.copyWith(position: position);
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      state = state.copyWith(placeMarks: placeMarks);
      PreferenceService.setLocation(
          latCar: position.latitude, longCar: position.longitude);
    }
  }
}
