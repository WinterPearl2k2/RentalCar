import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../state/room_call_state.dart';


part 'room_call_notifier.g.dart';

@riverpod
class RoomCallNotifier extends _$RoomCallNotifier {
  @override
  RoomCallState build() => const RoomCallState();

  Future<void> callToUser() async {
    try{
      await injection.getIt<ICarService>().getAllCar();
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}
