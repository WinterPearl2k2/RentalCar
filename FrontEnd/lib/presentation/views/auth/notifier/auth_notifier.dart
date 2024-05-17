import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/dtos/login_dto.dart';
import 'package:rental_car/data/dtos/user_dto.dart';
import 'package:rental_car/main.dart';

import '../../../../application/routes/routes.dart';
import '../../../../application/utils/log_utils.dart';
import '../../../../application/utils/regex_check_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/widgets/success_notify_widget.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState();

  void changeView() {
    if (state.stateView == StateView.signIn) {
      state = state.copyWith(stateView: StateView.signUp);
    } else {
      state = state.copyWith(stateView: StateView.signIn);
    }
    state = state.copyWith(
      errorName: false,
      errorPhone: false,
      errorEmail: false,
      errorPassword: false,
      showPassword: false,
    );
  }

  void showPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void setDefault() {
    state = state.copyWith(
      showPassword: true,
    );
  }

  Future<void> loginUser({
    required email,
    required password,
  }) async {
    await login(email.text.trim(), password.text.trim());
  }

  Future<void> loginBegin({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    final user = PreferenceService.getUser();
    if (user.emailUser.isEmpty || user.passwordUser.isEmpty) return;
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    emailController.text = user.emailUser;
    passwordController.text = user.passwordUser;
    await login(user.emailUser, user.passwordUser);
  }

  Future<void> login(email, password) async {
    state = state.copyWith(wait: true);
    try {
      final loginDTO = LoginDTO(
        email: email,
        password: password,
        deviceToken: PreferenceService.getDeviceToken(),
      );
      await injection.getIt<IAuthService>().loginUser(
            loginDTO: loginDTO,
          );
      PreferenceService.setUser(
        email,
        password,
      );
      LogUtils.i(PreferenceService.getToken().toString());
      Routes.goToNavigationView(navigatorKey.currentState);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  Future<void> registerUser({
    required name,
    required password,
    required email,
    required phoneNumber,
    required context,
  }) async {
    state = state.copyWith(wait: true);
    if (_checkValid(
      password.text.trim(),
      name.text.trim(),
      email.text.trim(),
      phoneNumber.text.trim(),
    )) {
      Fluttertoast.showToast(msg: 'Invalid information!');
      state = state.copyWith(wait: false);
      return;
    }
    final userDTO = UserDTO(
      password: password.text.trim(),
      name: name.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
    );
    try {
      await injection.getIt<IAuthService>().registerUser(
            userDTO: userDTO,
          );
      name.clear();
      phoneNumber.clear();
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: SuccessNotifyWidget(
              title:
                  'Congratulations, you have successfully completed registration!',
              label: 'Registration successful',
            ),
          );
        },
      ).then((value) => changeView());
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  bool _checkValid(
    String password,
    String name,
    String email,
    String phoneNumber,
  ) {
    bool check = false;
    if (!RegexCheckUtils.emailRegex.hasMatch(email)) {
      state = state.copyWith(errorEmail: true);
      check = true;
    }
    if (name.isEmpty) {
      state = state.copyWith(errorName: true);
      check = true;
    }
    if (!RegexCheckUtils.phoneRegex.hasMatch(phoneNumber)) {
      state = state.copyWith(errorPhone: true);
      check = true;
    }
    if (!RegexCheckUtils.passwordRegex.hasMatch(password)) {
      state = state.copyWith(errorPassword: true);
      check = true;
    }
    return check;
  }

  void checkName(String value) {
    if (state.errorName) {
      state = state.copyWith(errorName: value.isEmpty);
    }
  }

  void checkEmail(String value) {
    if (state.errorEmail) {
      state = state.copyWith(
        errorEmail: !RegexCheckUtils.emailRegex.hasMatch(value.trim()),
      );
    }
  }

  void checkPhone(String value) {
    if (state.errorPhone) {
      state = state.copyWith(
        errorPhone: !RegexCheckUtils.phoneRegex.hasMatch(value.trim()),
      );
    }
  }

  void checkPassword(String value) {
    if (state.errorPassword) {
      state = state.copyWith(
        errorPassword: !RegexCheckUtils.passwordRegex.hasMatch(value.trim()),
      );
    }
  }
}
