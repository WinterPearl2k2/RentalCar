import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/utils/colors_utils.dart';
import '../../common/base_state_delegate/base_state_delegate.dart';
import '../../common/widgets/text_button_widget.dart';
import '../../common/widgets/text_form_field.dart';
import 'notifier/forgot_password_notifier.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  BaseStateDelegate<ForgotPasswordView, ForgotPasswordNotifier> createState() =>
      _ForgotPasswordViewState();
}

class _ForgotPasswordViewState
    extends BaseStateDelegate<ForgotPasswordView, ForgotPasswordNotifier> {
  final TextEditingController emailController = TextEditingController();

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
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
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

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
