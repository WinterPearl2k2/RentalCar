import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_detail_dto.freezed.dart';
part 'car_detail_dto.g.dart';

@freezed
class CarDetailDTO with _$CarDetailDTO {
  const factory CarDetailDTO({
    @Default('') String idCar,
    @Default('') String idUser,
    @Default("") String imagesCar,
    @Default('') String nameCar,
    @Default('') String descriptionCar,
    @Default("") String fuelTypeCar,
    @Default('') String colorCar,
    @Default(0) double kilometersCar,
    @Default(0) int seatsCar,
    @Default("") String transmissionCar,
    @Default("") String userName,
    @Default(0) double starCar,
    @Default(0) double countReviewCar,
    @Default(0) double priceCar
  }) = _CarDetailDTO;

  factory CarDetailDTO.fromJson(Map<String, dynamic> json) => _$CarDetailDTOFromJson(json);
}
