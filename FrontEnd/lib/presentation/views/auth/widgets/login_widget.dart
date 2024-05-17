import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/presentation/views/auth/notifier/auth_notifier.dart';

import '../../../../application/utils/assets_utils.dart';
import '../../../../application/utils/colors_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../../../common/widgets/text_form_field.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.emailController,
    required this.notifier,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to, CarRental',
            style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,),
          ),
          Text(
            'Enter your account to continue',
            style: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14.sp,
            ),
          ),
          Image.asset(
            AssetUtils.imgLoading,
            height: 120.h,
            width: 500.w,
            fit: BoxFit.cover,
          ),
          TextFormFieldCustomWidget(
            hint: 'Your email address',
            label: "Email address",
            inputAction: TextInputAction.next,
            controller: emailController,
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (context, ref, child) {
              final isShow = ref.watch(
                authNotifierProvider.select((value) => value.showPassword),
              );
              return TextFormFieldCustomWidget(
                hint: 'Your password',
                label: "Password",
                controller: passwordController,
                inputAction: TextInputAction.done,
                obscureText: !isShow,
                suffixIcon: IconButton(
                  onPressed: () => notifier.showPassword(),
                  icon: !isShow
                      ? SvgPicture.asset(
                          AssetUtils.visibleOn,
                          colorFilter: ColorFilter.mode(
                            ColorUtils.textColor,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          AssetUtils.visibleOff,
                          colorFilter: ColorFilter.mode(
                            ColorUtils.textColor,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
              );
            },
          ),
          SizedBox(
            height: 50.h,
          ),
          TextButtonWidget(
            label: 'Login',
            onPressed: () => notifier.loginUser(
              email: emailController,
              password: passwordController,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Routes.goToForgotPasswordView(context),
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Divider(
                  color: ColorUtils.textColor,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SvgPicture.asset(
                AssetUtils.icFoot,
                colorFilter: ColorFilter.mode(
                  ColorUtils.textColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Divider(
                  color: ColorUtils.textColor,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              //
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t you have a RentalCar account? ',
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    passwordController.clear(),
                    emailController.clear(),
                    notifier.changeView(),
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
