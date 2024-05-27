import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/routes/routes_name.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../../../application/utils/log_utils.dart';
import '../../../../application/utils/regex_check_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../../../../data/dtos/reset_password_dto.dart';
import '../../../../data/dtos/verify_code_dto.dart';
import '../../../common/widgets/success_notify_widget.dart';
import '../state/forgot_password_state.dart';

part 'forgot_password_notifier.g.dart';

@riverpod
class ForgotPasswordNotifier extends _$ForgotPasswordNotifier {
  @override
  ForgotPasswordState build() => const ForgotPasswordState();

  Future<void> forgotPassword({
    required email,
    required context,
  }) async {
    state = state.copyWith(wait: true);
    if (_checkValidEmail(email.text)) {
      Fluttertoast.showToast(msg: 'Invalid information!');
      state = state.copyWith(wait: false);
      return;
    }
    try {
      await injection.getIt<IAuthService>().forgotPassword(
            email: email.text,
          );
      state = state.copyWith(
        emailString: email.text,
        status: ForgotPasswordStatus.verifyCode,
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  bool _checkValidEmail(String email) {
    if (!RegexCheckUtils.emailRegex.hasMatch(email)) {
      state = state.copyWith(errorEmail: true);
      return true;
    }
    return false;
  }

  void checkEmail(String value) {
    if (state.errorEmail) {
      state = state.copyWith(
        errorEmail: !RegexCheckUtils.emailRegex.hasMatch(value),
      );
    }
  }

  void checkNewPassword(String value) {
    if (state.errNewPassword) {
      state = state.copyWith(
        errNewPassword: !RegexCheckUtils.passwordRegex.hasMatch(value),
      );
    }
  }

  void checkConfirmPassword(String value) {
    if (state.errConfirmPassword) {
      state = state.copyWith(
        errConfirmPassword: !RegexCheckUtils.passwordRegex.hasMatch(value),
      );
    }
  }

  void showNewPassword() {
    state = state.copyWith(
      showNewPassword: !state.showNewPassword,
    );
  }

  void showConfirmPassword() {
    state = state.copyWith(
      showConfirmPassword: !state.showConfirmPassword,
    );
  }

  Future<void> changePassword({
    required newPassword,
    required confirmPassword,
    required context,
  }) async {
    state = state.copyWith(wait: true);
    if (_checkValidPassword(
      newPassword.text,
      confirmPassword.text,
    )) {
      Fluttertoast.showToast(msg: 'Invalid information!');
      state = state.copyWith(wait: false);
      return;
    }
    if (newPassword.text != confirmPassword.text) {
      Fluttertoast.showToast(
          msg:
              'Passwords do not match. Please make sure your passwords match.');
      state = state.copyWith(wait: false);
      return;
    }

    try {
      final resetPassword = ResetPasswordDto(
        email: state.emailString,
        password: confirmPassword.text,
      );
      await injection
          .getIt<IAuthService>()
          .resetPassword(resetPassword: resetPassword);
      LogUtils.i('Reset success');
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: SuccessNotifyWidget(
              title: 'Password Change Successful',
              label:
                  'Your RentalCar account password has been successfully changed. You can now access your account with the new password.',
            ),
          );
        },
      ).then(
        (value) => Navigator.pop(
          context,
        ),
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  bool _checkValidPassword(
    String newPassword,
    String confirmPassword,
  ) {
    bool check = false;
    if (!RegexCheckUtils.passwordRegex.hasMatch(newPassword)) {
      state = state.copyWith(errNewPassword: true);
      check = true;
    }
    if (!RegexCheckUtils.passwordRegex.hasMatch(confirmPassword)) {
      state = state.copyWith(errConfirmPassword: true);
      check = true;
    }
    return check;
  }

  Future<void> sendCode({
    required context,
  }) async {
    if (state.code.isEmpty) return;
    state = state.copyWith(clearText: true);
    try {
      final codeDto = VerifyCodeDto(
        email: state.emailString,
        code: state.code,
      );
      await injection.getIt<IAuthService>().verifyCode(codeDto: codeDto);
      state = state.copyWith(
        status: ForgotPasswordStatus.resetPassword,
      );
      LogUtils.i('verify success');
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(clearText: false, code: '');
  }

  void countDownFinished() {
    state = state.copyWith(isResend: true);
  }

  Future<void> resendOTP(CountdownController countdownController) async {
    state = state.copyWith(isResend: false);
    try {
      await injection.getIt<IAuthService>().forgotPassword(
            email: state.emailString,
          );
      countdownController.restart();
      state = state.copyWith(isResend: false);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
      state = state.copyWith(isResend: true);
    }
  }

  void saveOTP(String value) {
    state = state.copyWith(code: value);
  }
}
