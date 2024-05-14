import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';

import '../../../../data/dtos/car_detail_dto.dart';
import '../../../../data/dtos/date_time_dto.dart';

part 'rental_car_state.freezed.dart';

@freezed
class RentalCarState with _$RentalCarState {
  const factory RentalCarState({
    @Default(false) loading,
    @Default(UserProfileDTO()) UserProfileDTO user,
    @Default(CarDetailDTO()) CarDetailDTO car,
    @Default([]) List<DateTimeDto> dates,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default(0) int numberDays,
    @Default(0) double total,
    @Default(false) bool isSelectRental,
    @Default(RentalCarStatus.rentalCar) RentalCarStatus statusView,
  }) = _RentalCarState;
}

enum RentalCarStatus {
  rentalCar,
  rentalSuccess
}
