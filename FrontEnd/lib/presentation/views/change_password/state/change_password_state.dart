import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(false) wait,
    @Default(false) showOldPassword,
    @Default(false) showNewPassword,
    @Default(false) showConfirmPassword,
    @Default(false) errorOldPassword,
    @Default(false) errorNewPassword,
    @Default(false) errorConfirmPassword,
  }) = _ChangePasswordState;
}

enum ChangePassword{
  oldPassword,
  newPassword,
  confirmPassword
}
