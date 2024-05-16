import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/dtos/car_review_dto.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/views/car_review/state/car_review_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_review_notifier.g.dart';

@riverpod
class CarReviewNotifier extends _$CarReviewNotifier {
  @override
  CarReviewState build() => const CarReviewState();

  Future<void> createCarReview({required CarReviewDTO carReviewDTO}) async {
    try {
      state = state.copyWith(status: Status.loading);
      await injection
          .getIt<ICarService>()
          .createCarReview(carReviewDTO: carReviewDTO);
      LogUtils.i("review oke");
      Fluttertoast.showToast(msg: "Review successful");
      state = state.copyWith(status: Status.success);
    } catch (e) {
      LogUtils.i("review fail $e");
      state = state.copyWith(status: Status.success);
    }
  }

  Future<void> getCarReview({required String idCar}) async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 1),
      );
      state = state.copyWith(status: Status.loading);
      final carReview =
          await injection.getIt<ICarService>().getReviewCar(idCar: idCar);
      state = state.copyWith(carReview: carReview);
      LogUtils.i("review oke");
      state = state.copyWith(status: Status.success);
    } catch (e) {
      LogUtils.i("review fail $e");
      state = state.copyWith(status: Status.success);
    }
  }
}
