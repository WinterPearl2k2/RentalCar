import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/home/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() => const HomeState();

  Future<void> getListCars() async {
    try {
      final listTopCar = await injection.getIt<ICarService>().getAllTopCar();
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

  Future<void> getLocationUser() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      state = state.copyWith(position: position);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      state = state.copyWith(placemarks: placemarks);
    }
  }
}
