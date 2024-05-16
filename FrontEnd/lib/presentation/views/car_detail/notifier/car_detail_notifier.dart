import 'package:map_launcher/map_launcher.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/car_detail/state/car_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_detail_notifier.g.dart';

@riverpod
class CarDetailNotifier extends _$CarDetailNotifier {
  @override
  CarDetailState build() => const CarDetailState();

  Future<void> getCarById({required String idCar}) async {
    try {
      final carDetail =
          await injection.getIt<ICarService>().getCarById(idCar: idCar);
      state = state.copyWith(carDetail: carDetail, status: Status.success);
      LogUtils.i("get Car oke");
    } catch (e) {
      LogUtils.i(e.toString());
      state = state.copyWith(
          carDetail: const CarDetailDTO(), status: Status.success);
    }
  }

  void rentingCar(context) {
    Routes.goToRentalCarView(context, state.carDetail);
  }

  Future<void> launchMap(
      {required double latCar, required double longCar}) async {
    double currentLatitude = PreferenceService.getLocation().latitude;
    double currentLongitude = PreferenceService.getLocation().longitude;
    MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(latCar, longCar),
        origin: Coords(currentLatitude, currentLongitude));
  }
}
