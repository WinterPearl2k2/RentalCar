import 'package:freezed_annotation/freezed_annotation.dart';
part 'car_review.freezed.dart';
part 'car_review.g.dart';

@freezed
class CarReview with _$CarReview {
  const factory CarReview({
    @Default('') String idReview,
    @Default(0) int rateReview,
    @Default('') String commentReview,
    @Default('') String createAt,
  }) = _CarReview;

  factory CarReview.fromJson(Map<String, dynamic> json) => _$CarReviewFromJson(json);
}
