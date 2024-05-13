import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/car_detail/state/car_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> launchMap({required double latCar, longCar}) async {
  double currentLatitude = PreferenceService.getLocation().latitude;
  double currentLongitude = PreferenceService.getLocation().longitude;
    String url = "${EndPoint.restUrlGGMap}?api=1&origin=$currentLatitude,$currentLongitude&destination=$latCar,$longCar";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
