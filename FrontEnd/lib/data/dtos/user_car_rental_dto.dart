import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_car_rental_dto.freezed.dart';

@freezed
class UserCarRentalDto with _$UserCarRentalDto {
  const factory UserCarRentalDto({
    @Default(0) double rentalPrice,
    @Default(0) int rentalDays,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String createAt,
    @Default('') String nameUser,
    @Default('') String phoneUser,
  }) = _UserCarRentalDto;

  factory UserCarRentalDto.fromJson(Map<String, dynamic> json) {
    return UserCarRentalDto(
      rentalPrice: (json['RentalPrice'] ?? 0).toDouble(),
      rentalDays: json['RentalDays'] ?? 0,
      createAt: json['CreatedAt'] ?? '0',
      nameUser: json['NameUser'] ?? '',
      phoneUser: json['PhoneUser'] ?? '',
      startDate: json['StartDate'] ?? '',
      endDate: json['EndDate'] ?? '',
    );
  }

}
