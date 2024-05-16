import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/presentation/views/forgot_password/state/forgot_password_state.dart';
import 'package:rental_car/presentation/views/forgot_password/widgets/forgot_password_widget.dart';
import 'package:rental_car/presentation/views/forgot_password/widgets/reset_password_widget.dart';
import 'package:rental_car/presentation/views/forgot_password/widgets/verify_code_widget.dart';
import '../../common/base_state_delegate/base_state_delegate.dart';
import '../../common/widgets/loading_widget.dart';
import 'notifier/forgot_password_notifier.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  BaseStateDelegate<ForgotPasswordView, ForgotPasswordNotifier> createState() =>
      _ForgotPasswordViewState();
}

class _ForgotPasswordViewState
    extends BaseStateDelegate<ForgotPasswordView, ForgotPasswordNotifier> {
  @override
  void initNotifier() {
    notifier = ref.read(
      forgotPasswordNotifierProvider.notifier,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              AssetUtils.icBack,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Stack(
          children: [
            Consumer(
              builder: (context, ref, _) {
                final statusView = ref.watch(
                  forgotPasswordNotifierProvider.select(
                    (value) => value.status,
                  ),
                );
                switch (statusView) {
                  case ForgotPasswordStatus.senEmail:
                    return ForgotPasswordWidget(
                      notifier: notifier,
                    );
                  case ForgotPasswordStatus.verifyCode:
                    return VerifyCodeWidget(
                      notifier: notifier,
                    );
                  case ForgotPasswordStatus.resetPassword:
                    return ResetPasswordWidget(
                      notifier: notifier,
                    );
                }
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final isWaiting = ref.watch(
                  forgotPasswordNotifierProvider.select(
                    (value) => value.wait,
                  ),
                );
                return isWaiting ? const LoadingWidget() : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
