import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_contract_dto.freezed.dart';

@freezed
class RentalContractDto with _$RentalContractDto {
  const factory RentalContractDto({
    @Default('') String nameOwner,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String transaction,
    @Default(0) int statusCar,
    @Default(0) double rentalPrice,
    @Default(0) int rentalDays,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String imgCar,
    @Default('') String nameCar,
    @Default('') String idCar,
  }) = _RentalContractDto;

  factory RentalContractDto.fromJson(Map<String, dynamic> json) {
    return RentalContractDto(
      nameOwner: json['NameOwner'] ?? '',
      nameCar: json['NameCar'] ?? '',
      phone: json['Phone'] ?? '',
      email: json['Email'] ?? '',
      statusCar: json['StatusCar'] ?? 0,
      transaction: json['Transaction'] ?? '',
      rentalPrice: (json['RentalPrice'] ?? 0).toDouble(),
      rentalDays: json['RentalDays'] ?? 0,
      startDate: json['StartDate'] ?? '',
      endDate: json['EndDate'] ?? '',
      imgCar: json['ImagesCar'] ?? '',
      idCar: json['IdCar'] ?? '',
    );
  }
}
