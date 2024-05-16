import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/dtos/user_car_rental_dto.dart';

part 'car_rental_management_state.freezed.dart';

@freezed
class CarRentalManagementState with _$CarRentalManagementState {
  const factory CarRentalManagementState({
    @Default([]) List<UserCarRentalDto> user,
    @Default(false) bool wait,
  }) = _CarRentalManagementState;
}
