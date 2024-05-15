import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/car_review_dto.dart';
import '../../../common/enum/status.dart';
part 'car_review_state.freezed.dart';

@freezed
class CarReviewState with _$CarReviewState {
  const factory CarReviewState({
    @Default(CarReviewDTO()) CarReviewDTO carReview,
    @Default(Status.loading) Status status,
  }) = _CarReviewState;
}
