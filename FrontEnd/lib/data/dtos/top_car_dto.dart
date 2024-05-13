import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_car_dto.freezed.dart';
part 'top_car_dto.g.dart';

@freezed
class TopCarDTO with _$TopCarDTO {
  const factory TopCarDTO({
    @Default('') String idCar,
    @Default('') String imagesCar,
    @Default('') String nameCar,
    @Default(0) double priceCar,
    @Default(0) double starCar,
    @Default(0) int countReviewCar,
  }) = _TopCarDTO;

  factory TopCarDTO.fromJson(Map<String, dynamic> json) => _$TopCarDTOFromJson(json);
}
