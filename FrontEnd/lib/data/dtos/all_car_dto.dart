import 'package:const_date_time/const_date_time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_car_dto.freezed.dart';
part 'all_car_dto.g.dart';

@freezed
class AllCarDTO with _$AllCarDTO {
  const factory AllCarDTO({
    @Default('') String idCar,
    @Default('') String imagesCar,
    @Default('') String nameCar,
    @Default(0) double priceCar,
    @Default(0) double latCar,
    @Default(0) double longCar,
    @Default(0) double distanceCar,
    @Default(0) double starCar,
    @Default(0) int countReviewCar,
    @Default(ConstDateTime(2024)) DateTime createAt,
  }) = _AllCarDTO;

  factory AllCarDTO.fromJson(Map<String, dynamic> json) => _$AllCarDTOFromJson(json);
}
