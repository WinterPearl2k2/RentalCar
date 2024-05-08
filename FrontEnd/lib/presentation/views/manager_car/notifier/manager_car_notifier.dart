import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/manager_car/state/manager_car_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manager_car_notifier.g.dart';

@riverpod
class ManagerCarNotifier extends _$ManagerCarNotifier {
  @override
  ManagerCarState build() => const ManagerCarState();

  Future<void> getListCarByIdUser() async {
    try {
      final listCarUser =
          await injection.getIt<ICarService>().getAllCarByIdUser(
                idUser: PreferenceService.getUUID(),
              );
      state = state.copyWith(status: Status.success);
      if (listCarUser.isNotEmpty) {
        state = state.copyWith(listCarUser: listCarUser);
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
    }
  }
}
