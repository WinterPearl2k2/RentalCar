import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/utils/log_utils.dart';
import '../../../../application/utils/regex_check_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
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
    if (_checkValid(email.text)) {
      Fluttertoast.showToast(msg: 'Invalid information!');
      state = state.copyWith(wait: false);
      return;
    }
    try {
      await injection.getIt<IAuthService>().forgotPassword(
            email: email.text,
          );
      Routes.goToVerifyCodeView(context, email.text);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  bool _checkValid(String email) {
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
}
