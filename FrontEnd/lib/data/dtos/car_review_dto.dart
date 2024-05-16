import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_review_dto.freezed.dart';
part 'car_review_dto.g.dart';

@freezed
class CarReviewDTO with _$CarReviewDTO {
  const factory CarReviewDTO({
    @Default('') String idCar,
    @Default(3.0) double rateReview,
    @Default('') String commentReview,
  }) = _CarReviewDTO;

  factory CarReviewDTO.fromJson(Map<String, dynamic> json) => _$CarReviewDTOFromJson(json);
}
