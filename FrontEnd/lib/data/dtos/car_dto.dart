import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_dto.freezed.dart';
part 'car_dto.g.dart';

@freezed
class CarDTO with _$CarDTO {
  const factory CarDTO({
    @Default('') String nameCar,
    @Default(0) double priceCar,
    @Default("") String brandCar,
    @Default("") String fuelTypeCar,
    @Default('') String colorCar,
    @Default('') String descriptionCar,
    @Default(0) double kilometersCar,
    @Default(0) int seatsCar,
    @Default("") String addressOwner,
    @Default("") String transmissionCar,
    @Default("") String imagesCar,
    @Default("") String statusCar,
  }) = _CarDTO;

  factory CarDTO.fromJson(Map<String, dynamic> json) => _$CarDTOFromJson(json);
}
