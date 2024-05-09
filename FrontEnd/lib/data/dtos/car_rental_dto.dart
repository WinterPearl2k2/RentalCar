import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_rental_dto.freezed.dart';
part 'car_rental_dto.g.dart';

@freezed
class CarRentalDto with _$CarRentalDto {
  const factory CarRentalDto({
    @Default('') String idCar,
    @Default(0) double rentalPrice,
    @Default(0) int rentalDays,
  }) = _CarRentalDto;

  factory CarRentalDto.fromJson(Map<String, dynamic> json) => _$CarRentalDtoFromJson(json);
}
