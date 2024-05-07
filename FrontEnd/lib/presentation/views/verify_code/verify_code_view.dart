import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/views/verify_code/notifier/verify_code_notifier.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../application/utils/colors_utils.dart';
import '../../common/base_state_delegate/base_state_delegate.dart';
import '../../common/widgets/text_button_widget.dart';

class VerifyCodeView extends ConsumerStatefulWidget {
  const VerifyCodeView({super.key});

  @override
  BaseStateDelegate<VerifyCodeView, VerifyCodeNotifier> createState() =>
      _VerifyCodeViewState();
}

class _VerifyCodeViewState
    extends BaseStateDelegate<VerifyCodeView, VerifyCodeNotifier> {
  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  @override
  void initNotifier() {
    notifier = ref.read(verifyCodeNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final emailString = args['email'] ?? "";
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
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
                      RichText(
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
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          final isClear = ref.watch(
                            verifyCodeNotifierProvider
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
                            final isResend = ref.watch(
                              verifyCodeNotifierProvider
                                  .select((value) => value.isResend),
                            );

                            if (!isResend) {
                              _countdownController.restart();
                            }
                            return Countdown(
                              seconds: 60,
                              controller: _countdownController,
                              onFinished: () => notifier.countDownFinished(),
                              build: (BuildContext context, double time) =>
                                  Text(
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
                          email: emailString,
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
                              verifyCodeNotifierProvider
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
                                        notifier.resendOTP(emailString);
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
              ),
              // Consumer(
              //   builder: (context, ref, child) {
              //     return const LoadingWidget();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
