import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/views/verify_code/notifier/verify_code_notifier.dart';

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
  @override
  void initNotifier() {
    notifier = ref.read(verifyCodeNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final emailString = args['email'] ?? "";
    final expirationString = args['time'] ?? "";
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
                      Text(
                        'We already sent you 4 digit OTP number to your email ${emailString}',
                        style: TextStyle(
                          color: ColorUtils.textColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      OtpTextField(
                        showFieldAsBox: true,
                        numberOfFields: 4,
                        fieldWidth: 50.w,
                        fieldHeight: 50.h,
                        borderRadius: BorderRadius.circular(15),
                        enabledBorderColor: ColorUtils.textColor,
                        focusedBorderColor: ColorUtils.primaryColor,
                        onSubmit: (value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      TextButtonWidget(
                        label: 'Recover account',
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
