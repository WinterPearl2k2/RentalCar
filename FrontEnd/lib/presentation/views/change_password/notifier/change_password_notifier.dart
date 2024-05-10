import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/data/dtos/password_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../application/services/auth_service.dart';
import '../../../../application/utils/log_utils.dart';
import '../../../../application/utils/regex_check_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../../../../main.dart';
import '../state/change_password_state.dart';

part 'change_password_notifier.g.dart';

@riverpod
class ChangePasswordNotifier extends _$ChangePasswordNotifier {
  @override
  ChangePasswordState build() => const ChangePasswordState();

  Future<void> updateProfile({
    required oldPassword,
    required newPassword,
    required confirmPassword,
  }) async {
    state = state.copyWith(wait: true);
    if (_checkValid(
      oldPassword.text.trim(),
      newPassword.text.trim(),
      confirmPassword.text.trim(),
    )) {
      Fluttertoast.showToast(msg: 'Invalid information!');
      state = state.copyWith(wait: false);
      return;
    }
    try {
      final passwordDto = PasswordDto(
        oldPassword: oldPassword.text.trim(),
        newPassword: confirmPassword.text.trim(),
      );
      await injection.getIt<IAuthService>().changePassword(
            passwordDto: passwordDto,
          );
      oldPassword.clear();
      newPassword.clear();
      confirmPassword.clear();
      Fluttertoast.showToast(
        msg: 'Password changed successfully.',
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  void checkPassword({
    required String value,
    required ChangePassword type,
  }) {
    if (state.errorOldPassword && ChangePassword.oldPassword == type) {
      state = state.copyWith(
        errorOldPassword: value.trim().isEmpty,
      );
    }
    if (state.errorNewPassword && ChangePassword.newPassword == type) {
      state = state.copyWith(
        errorNewPassword: !RegexCheckUtils.passwordRegex.hasMatch(value.trim()),
      );
    }
    if (state.errorConfirmPassword && ChangePassword.confirmPassword == type) {
      state = state.copyWith(
        errorConfirmPassword: value.trim().isEmpty,
      );
    }
  }

  void showPassword({required ChangePassword type}) {
    switch (type) {
      case ChangePassword.oldPassword:
        state = state.copyWith(
          showOldPassword: !state.showOldPassword,
        );
      case ChangePassword.newPassword:
        state = state.copyWith(
          showNewPassword: !state.showNewPassword,
        );
      case ChangePassword.confirmPassword:
        state = state.copyWith(
          showConfirmPassword: !state.showConfirmPassword,
        );
    }
  }

  bool _checkValid(
    String oldPassword,
    String newPassword,
    String confirmPassword,
  ) {
    bool check = false;
    if (oldPassword.trim().isEmpty) {
      state = state.copyWith(errorOldPassword: true);
      check = true;
    }
    if (!RegexCheckUtils.passwordRegex.hasMatch(newPassword.trim())) {
      state = state.copyWith(errorNewPassword: true);
      check = true;
    }
    if (newPassword != confirmPassword) {
      state = state.copyWith(errorConfirmPassword: true);
      check = true;
    }
    return check;
  }
}
