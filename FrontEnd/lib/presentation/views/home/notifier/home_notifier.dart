import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/home/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() => const HomeState();

  Future<void> getListCars() async {
    try {
      final listCar = await  injection.getIt<ICarService>().getAllCar();
      state = state.copyWith(listCar: listCar);
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
    }
  }
}