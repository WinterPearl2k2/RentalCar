import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/data/dtos/verify_code_dto.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/routes/routes.dart';
import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../state/verify_code_state.dart';

part 'verify_code_notifier.g.dart';

@riverpod
class VerifyCodeNotifier extends _$VerifyCodeNotifier {
  @override
  VerifyCodeState build() => const VerifyCodeState();

  void saveOTP(String value) {
    state = state.copyWith(code: value);
  }

  Future<void> sendCode({
    required String email,
    required context,
  }) async {
    if (state.code.isEmpty) return;
    state = state.copyWith(clearText: true);
    try {
      final codeDto = VerifyCodeDto(
        email: email,
        code: state.code,
      );
      await injection.getIt<IAuthService>().verifyCode(codeDto: codeDto);
      Routes.goToResetPasswordView(context, email);
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

  Future<void> resendOTP(String email) async {
    try {
      await injection.getIt<IAuthService>().forgotPassword(
            email: email,
          );
      state = state.copyWith(isResend: false);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}
