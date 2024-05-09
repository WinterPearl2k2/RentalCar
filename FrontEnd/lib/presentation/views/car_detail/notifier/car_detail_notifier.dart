import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/car_detail/state/car_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_detail_notifier.g.dart';

@riverpod
class CarDetailNotifier extends _$CarDetailNotifier{
  @override
  CarDetailState build() => const CarDetailState();

  Future<void> getCarById({required String idCar}) async {
    try {
      final car = await  injection.getIt<ICarService>().getCarById(idCar: idCar);
      state = state.copyWith(car: car);
      LogUtils.i("get Car oke");
    } catch (e) {
      LogUtils.i(e.toString());
    }
  }

  void rentingCar(context) {
    Routes.goToRentalCarView(context, state.car);
  }
}