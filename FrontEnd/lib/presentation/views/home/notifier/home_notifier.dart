import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/dtos/all_car_dto.dart';
import 'package:rental_car/main.dart';
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
        state = state.copyWith(status: Status.success);
        state = state.copyWith(listTopCar: []);
      } else {
        state = state.copyWith(status: Status.success);
        state = state.copyWith(listTopCar: listTopCar);
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
    }
  }

  Future<void> getListAllCars() async {
    try {
      final listAllCar = await injection.getIt<ICarService>().getAllCar();
      if (listAllCar.isEmpty) {
        state = state.copyWith(status: Status.success, listTopCar: []);
      } else {
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
            double distanceA = a.distanceCar ;
            double distanceB = b.distanceCar;
            return distanceA.compareTo(distanceB);
          }
        });
        state = state.copyWith(status: Status.success, listAllCar: updatedListAllCar);
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
    }
  }

  Future<void> getLocationUser() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      state = state.copyWith(position: position);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      state = state.copyWith(placemarks: placemarks);
      PreferenceService.setLocation(latCar: position.latitude, longCar: position.longitude);
    }
  }
}
