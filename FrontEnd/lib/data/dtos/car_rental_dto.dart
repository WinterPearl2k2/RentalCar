import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_rental_dto.freezed.dart';
part 'car_rental_dto.g.dart';

@freezed
class CarRentalDto with _$CarRentalDto {
  const factory CarRentalDto({
    @Default('') String idCar,
    @Default(0) double rentalPrice,
    @Default(0) int rentalDays,
    @Default('') String startDate,
    @Default('') String endDate,
  }) = _CarRentalDto;

  factory CarRentalDto.fromJson(Map<String, dynamic> json) => _$CarRentalDtoFromJson(json);
}
