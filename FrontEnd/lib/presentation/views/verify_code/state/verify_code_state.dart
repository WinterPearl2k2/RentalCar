import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_state.freezed.dart';

@freezed
class VerifyCodeState with _$VerifyCodeState {
  const factory VerifyCodeState({
    @Default(false) bool errorEmail,
    @Default(false) bool wait,
    @Default(false) bool isResend,
    @Default('') String code,
    @Default(false) bool clearText,
  }) = _VerifyCodeState;
}
