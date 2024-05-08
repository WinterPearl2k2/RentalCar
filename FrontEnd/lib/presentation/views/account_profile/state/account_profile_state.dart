import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';

part 'account_profile_state.freezed.dart';

@freezed
class AccountProfileState with _$AccountProfileState {
  const factory AccountProfileState({
    @Default(false) bool wait,
    @Default(false) bool errorName,
    @Default(false) bool errorEmail,
    @Default(false) bool errorPhone,
    @Default(UserProfileDTO()) UserProfileDTO user,
    @Default(false) blockButton,
}) = _AccountProfileState;
}
