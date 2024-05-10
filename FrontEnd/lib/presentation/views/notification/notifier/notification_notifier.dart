import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/utils/log_utils.dart';
import '../state/notification_state.dart';

part 'notification_notifier.g.dart';

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  @override
  NotificationState build() => const NotificationState();

  Future<void> getRentalCar() async {
    try {
      final userCarRentalDto =
          await injection.getIt<ICarService>().getRentalCars();
      state = state.copyWith(
        user: userCarRentalDto,
      );
      LogUtils.i(userCarRentalDto.toString());
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(
      wait: true,
    );
  }
}
