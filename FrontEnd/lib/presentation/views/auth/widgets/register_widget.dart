import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/presentation/views/auth/notifier/auth_notifier.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../../../common/widgets/text_form_field.dart';
import 'icon_button_widget.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    super.key,
    required this.emailController,
    required this.notifier,
    required this.nameController,
    required this.phoneController,
    required this.passwordController,
  });

  final AuthNotifier notifier;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nice to know you!',
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Enter your account to continue',
            style: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Consumer(
            builder: (context, ref, child) {
              final err = ref.watch(
                authNotifierProvider.select((value) => value.errorName),
              );
              return TextFormFieldCustomWidget(
                hint: 'Your full name',
                label: "Full name",
                controller: nameController,
                inputAction: TextInputAction.next,
                error: err
                    ? const Text(
                        'Name cannot be empty!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                        ),
                      )
                    : null,
                onChanged: (value) => notifier.checkName(value),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (context, ref, child) {
              final err = ref.watch(
                authNotifierProvider.select((value) => value.errorEmail),
              );
              return TextFormFieldCustomWidget(
                hint: 'Your email address',
                label: "Email address",
                inputAction: TextInputAction.next,
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
            height: 20.h,
          ),
          Consumer(
            builder: (context, ref, child) {
              final err = ref.watch(
                authNotifierProvider.select((value) => value.errorPhone),
              );
              return TextFormFieldCustomWidget(
                hint: 'Your phone number',
                label: "Phone number",
                inputAction: TextInputAction.next,
                controller: phoneController,
                textInputType: TextInputType.phone,
                error: err
                    ? const Text(
                        'Invalid phone number!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                        ),
                      )
                    : null,
                onChanged: (value) => notifier.checkPhone(value),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (_, ref, child) {
              final isShow = ref.watch(
                authNotifierProvider.select((value) => value.showPassword),
              );
              final err = ref.watch(
                authNotifierProvider.select((value) => value.errorPassword),
              );
              return TextFormFieldCustomWidget(
                hint: 'Your password',
                label: "Password",
                controller: passwordController,
                inputAction: TextInputAction.done,
                obscureText: !isShow,
                error: err
                    ? const Text(
                        'Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                        ),
                      )
                    : null,
                onChanged: (value) => notifier.checkPassword(value),
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
            label: 'Register',
            onPressed: () => notifier.registerUser(
              name: nameController,
              password: passwordController,
              email: emailController,
              phoneNumber: phoneController,
              context: context,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: ColorUtils.textColor,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "Or register with",
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: ColorUtils.textColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButtonWidget(
                icon: Image.asset(
                  'assets/icons/ic_google.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButtonWidget(
                icon: Image.asset(
                  'assets/icons/ic_facebook.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have a RentalCar account? ',
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    nameController.clear(),
                    phoneController.clear(),
                    passwordController.clear(),
                    emailController.clear(),
                    notifier.changeView(),
                  },
                  child: Text(
                    'Login',
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
