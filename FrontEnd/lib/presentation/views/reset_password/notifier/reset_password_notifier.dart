import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/data/dtos/reset_password_dto.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/utils/log_utils.dart';
import '../../../../application/utils/regex_check_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../../../common/widgets/success_notify_widget.dart';
import '../state/reset_password_state.dart';

part 'reset_password_notifier.g.dart';

@riverpod
class ResetPasswordNotifier extends _$ResetPasswordNotifier {
  @override
  ResetPasswordState build() => const ResetPasswordState();

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
    required email,
    required context,
  }) async {
    state = state.copyWith(wait: true);
    if (_checkValid(
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
        email: email,
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
        (value) => Navigator.popUntil(
          context,
          ModalRoute.withName('/auth'),
        ),
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  bool _checkValid(
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
}
