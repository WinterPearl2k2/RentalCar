import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(false) bool errorEmail,
    @Default(false) bool wait,
    @Default(false) bool showNewPassword,
    @Default(false) bool showConfirmPassword,
    @Default(false) bool errNewPassword,
    @Default(false) bool errConfirmPassword,
    @Default(false) bool isResend,
    @Default('') String code,
    @Default('') String emailString,
    @Default(false) bool clearText,
    @Default(ForgotPasswordStatus.senEmail) ForgotPasswordStatus status,
  }) = _ForgotPasswordState;
}

enum ForgotPasswordStatus {
  senEmail,
  verifyCode,
  resetPassword,
}
