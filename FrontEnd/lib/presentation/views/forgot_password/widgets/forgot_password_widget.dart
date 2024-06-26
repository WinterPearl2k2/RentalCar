import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../../../common/widgets/text_form_field.dart';
import '../notifier/forgot_password_notifier.dart';

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({
    super.key,
    required this.notifier,
  });

  final TextEditingController emailController = TextEditingController();
  final ForgotPasswordNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot Password?',
            style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Please input your email to recover your RentalCar account.',
            style: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (context, ref, _) {
              final err = ref.watch(
                forgotPasswordNotifierProvider.select(
                      (value) => value.errorEmail,
                ),
              );
              return TextFormFieldCustomWidget(
                hint: 'Your email address',
                label: "Email address",
                inputAction: TextInputAction.done,
                controller: emailController,
                error: err
                    ? const Text(
                  'Invalid email!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                )
                    : null,
                onChanged: (value) => notifier.checkEmail(value),
              );
            },
          ),
          SizedBox(
            height: 50.h,
          ),
          TextButtonWidget(
            label: 'Recover account',
            onPressed: () => notifier.forgotPassword(
              email: emailController,
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}
