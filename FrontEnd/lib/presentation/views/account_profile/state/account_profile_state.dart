import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_profile_state.freezed.dart';

@freezed
class AccountProfileState with _$AccountProfileState {
  const factory AccountProfileState({
    @Default(false) bool wait,
    @Default(false) bool errorName,
    @Default(false) bool errorEmail,
    @Default(false) bool errorPhone,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String name,
    @Default(false) blockButton,
}) = _AccountProfileState;
}
