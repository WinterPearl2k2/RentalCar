import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../notifier/forgot_password_notifier.dart';

class VerifyCodeWidget extends StatelessWidget {
  VerifyCodeWidget({
    super.key,
    required this.notifier,
  });

  final ForgotPasswordNotifier notifier;
  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ).r,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check your email',
              style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final emailString = ref.watch(
                  forgotPasswordNotifierProvider.select(
                    (value) => value.emailString,
                  ),
                );
                return RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          'We already sent you 4 digit OTP number to your email ',
                      style: TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: emailString,
                      style: TextStyle(
                        color: ColorUtils.primaryColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ]),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Consumer(
              builder: (context, ref, child) {
                final isClear = ref.watch(
                  forgotPasswordNotifierProvider
                      .select((value) => value.clearText),
                );
                return OtpTextField(
                  showFieldAsBox: true,
                  numberOfFields: 4,
                  fieldWidth: 50.w,
                  fieldHeight: 50.h,
                  alignment: Alignment.center,
                  textStyle: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 16,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  enabledBorderColor: ColorUtils.textColor,
                  focusedBorderColor: ColorUtils.primaryColor,
                  clearText: isClear,
                  onSubmit: (value) => notifier.saveOTP(value),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Consumer(
                builder: (context, ref, child) {
                  ref.watch(
                    forgotPasswordNotifierProvider
                        .select((value) => value.isResend),
                  );
                  return Countdown(
                    seconds: 60,
                    controller: _countdownController,
                    onFinished: () => notifier.countDownFinished(),
                    build: (BuildContext context, double time) => Text(
                      '${time.toInt()}s',
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButtonWidget(
              label: 'Recover account',
              onPressed: () => notifier.sendCode(
                context: context,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Consumer(
                builder: (context, ref, child) {
                  final isResend = ref.watch(
                    forgotPasswordNotifierProvider
                        .select((value) => value.isResend),
                  );
                  return RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Did\'t receive OTP number? ',
                        style: TextStyle(
                          color: ColorUtils.textColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'Resend',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (isResend) {
                              notifier.resendOTP(_countdownController);
                            }
                          },
                        style: TextStyle(
                            color: isResend
                                ? ColorUtils.primaryColor
                                : ColorUtils.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
