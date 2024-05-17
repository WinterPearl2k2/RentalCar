import 'package:geolocator/geolocator.dart';
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
          listTopCar: [],
          statusTopCar: Status.success,
        );
      } else {
        state = state.copyWith(
          listTopCar: listTopCar,
          statusTopCar: Status.success,
        );
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
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
      if (listSearchCar.isEmpty) {
        state = state.copyWith(
          listSearchCar: [],
          statusSearch: Status.success,
        );
      } else {
        state = state.copyWith(
          listSearchCar: listSearchCar,
          statusSearch: Status.success,
        );
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
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
    if (searchController.isEmpty) {
      state = state.copyWith(isCheckSearch: false);
    } else {
      state = state.copyWith(isCheckSearch: true, statusSearch: Status.loading);
    }
  }

  int currentPage = 1;
  final int pageSize = 10;
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
          int distanceComparison = a.distanceCar.compareTo(b.distanceCar);
          if (distanceComparison != 0) {
            return distanceComparison;
          } else {
            return b.createAt.compareTo(a.createAt);
          }
        });

        state = state.copyWith(
          listAllCar: [...state.listAllCar, ...updatedListAllCar],
          statusNearCar: Status.success,
        );
        currentPage++;
      }
      isLoadingMore = false;
      LogUtils.i("get list car near you oke");
    } catch (e) {
      isLoadingMore = false;
      LogUtils.i(e.toString());
      state = state.copyWith(statusNearCar: Status.error);
    }
  }

  Future<void> getLocationUser() async {
    double currentLatitude = PreferenceService.getLocation().latitude;
    double currentLongitude = PreferenceService.getLocation().longitude;
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(currentLatitude, currentLongitude);
    state = state.copyWith(placeMarks: placeMarks);
  }
}
