import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/change_password/notifier/change_password_notifier.dart';
import 'package:rental_car/presentation/views/change_password/state/change_password_state.dart';

import '../../../application/utils/assets_utils.dart';
import '../../../application/utils/colors_utils.dart';
import '../../common/widgets/loading_widget.dart';
import '../../common/widgets/text_button_widget.dart';
import '../../common/widgets/text_form_field.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({super.key});

  @override
  BaseStateDelegate<ChangePasswordView, ChangePasswordNotifier> createState() =>
      _ChangePasswordViewState();
}

class _ChangePasswordViewState
    extends BaseStateDelegate<ChangePasswordView, ChangePasswordNotifier> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initNotifier() {
    notifier = ref.read(changePasswordNotifierProvider.notifier);
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
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        color: ColorUtils.primaryColor,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        final err = ref.watch(
                          changePasswordNotifierProvider.select(
                            (value) => value.errorOldPassword,
                          ),
                        );
                        final isShow = ref.watch(
                          changePasswordNotifierProvider.select(
                            (value) => value.showOldPassword,
                          ),
                        );
                        return TextFormFieldCustomWidget(
                          hint: 'Old password',
                          label: "Old password",
                          controller: _oldPasswordController,
                          inputAction: TextInputAction.done,
                          obscureText: !isShow,
                          error: err
                              ? const Text(
                                  'Incorrect password',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                  ),
                                )
                              : null,
                          onChanged: (value) => notifier.checkPassword(
                            value: value,
                            type: ChangePassword.oldPassword,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => notifier.showPassword(
                              type: ChangePassword.oldPassword,
                            ),
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
                      height: 25.h,
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        final err = ref.watch(
                          changePasswordNotifierProvider.select(
                            (value) => value.errorNewPassword,
                          ),
                        );
                        final isShow = ref.watch(
                          changePasswordNotifierProvider.select(
                            (value) => value.showNewPassword,
                          ),
                        );
                        return TextFormFieldCustomWidget(
                          hint: 'New password',
                          label: "New password",
                          controller: _newPasswordController,
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
                          onChanged: (value) => notifier.checkPassword(
                            value: value,
                            type: ChangePassword.newPassword,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => notifier.showPassword(
                              type: ChangePassword.newPassword,
                            ),
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
                      height: 25.h,
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        final err = ref.watch(
                          changePasswordNotifierProvider.select(
                            (value) => value.errorConfirmPassword,
                          ),
                        );
                        final isShow = ref.watch(
                          changePasswordNotifierProvider.select(
                            (value) => value.showConfirmPassword,
                          ),
                        );
                        return TextFormFieldCustomWidget(
                          hint: 'Retype new password',
                          label: "Retype new password",
                          controller: _confirmPasswordController,
                          inputAction: TextInputAction.done,
                          obscureText: !isShow,
                          error: err
                              ? const Text(
                                  'Password confirm doesn\'t match',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                  ),
                                )
                              : null,
                          onChanged: (value) => notifier.checkPassword(
                            value: value,
                            type: ChangePassword.confirmPassword,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => notifier.showPassword(
                              type: ChangePassword.confirmPassword,
                            ),
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
                      label: 'Update profile',
                      onPressed: () => notifier.updateProfile(
                        oldPassword: _oldPasswordController,
                        newPassword: _newPasswordController,
                        confirmPassword: _confirmPasswordController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final isWaiting = ref.watch(
                  changePasswordNotifierProvider.select(
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
