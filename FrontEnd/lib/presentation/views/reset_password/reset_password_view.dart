import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/presentation/views/reset_password/notifier/reset_password_notifier.dart';

import '../../../application/utils/assets_utils.dart';
import '../../../application/utils/colors_utils.dart';
import '../../common/base_state_delegate/base_state_delegate.dart';
import '../../common/widgets/loading_widget.dart';
import '../../common/widgets/text_button_widget.dart';
import '../../common/widgets/text_form_field.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView({super.key});

  @override
  BaseStateDelegate<ResetPasswordView, ResetPasswordNotifier> createState() =>
      _VerifyCodeViewState();
}

class _VerifyCodeViewState
    extends BaseStateDelegate<ResetPasswordView, ResetPasswordNotifier> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initNotifier() {
    notifier = ref.read(resetPasswordNotifierProvider.notifier);
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
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ).r,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create new password',
                      style: TextStyle(
                          color: ColorUtils.primaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Please create new password of your RentalCar account to access again your account.',
                      style: TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer(
                      builder: (_, ref, child) {
                        final isShow = ref.watch(
                          resetPasswordNotifierProvider
                              .select((value) => value.showNewPassword),
                        );
                        final err = ref.watch(
                          resetPasswordNotifierProvider
                              .select((value) => value.errNewPassword),
                        );
                        return TextFormFieldCustomWidget(
                          hint: 'Your password',
                          label: "Password",
                          controller: newPasswordController,
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
                          onChanged: (value) =>
                              notifier.checkNewPassword(value),
                          suffixIcon: IconButton(
                            onPressed: () => notifier.showNewPassword(),
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
                      height: 20.h,
                    ),
                    Consumer(
                      builder: (_, ref, child) {
                        final isShow = ref.watch(
                          resetPasswordNotifierProvider
                              .select((value) => value.showConfirmPassword),
                        );
                        final err = ref.watch(
                          resetPasswordNotifierProvider
                              .select((value) => value.errConfirmPassword),
                        );
                        return TextFormFieldCustomWidget(
                          hint: 'Retype your password',
                          label: "Retype password",
                          controller: confirmPasswordController,
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
                          onChanged: (value) =>
                              notifier.checkConfirmPassword(value),
                          suffixIcon: IconButton(
                            onPressed: () => notifier.showConfirmPassword(),
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
                      height: 30.h,
                    ),
                    TextButtonWidget(
                      label: 'Confirm password',
                      onPressed: () => notifier.changePassword(
                        newPassword: newPasswordController,
                        confirmPassword: confirmPasswordController,
                        email: emailString,
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final isWaiting = ref.watch(
                  resetPasswordNotifierProvider.select((value) => value.wait),
                );
                return isWaiting ? const LoadingWidget() : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
