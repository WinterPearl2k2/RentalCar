import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/views/auth/state/auth_state.dart';
import 'package:rental_car/presentation/views/auth/widgets/login_widget.dart';
import 'package:rental_car/presentation/views/auth/widgets/register_widget.dart';

import '../../common/base_state_delegate/base_state_delegate.dart';
import '../../common/widgets/loading_widget.dart';
import 'notifier/auth_notifier.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  BaseStateDelegate<AuthView, AuthNotifier> createState() => _AuthViewState();
}

class _AuthViewState extends BaseStateDelegate<AuthView, AuthNotifier> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initNotifier() {
    notifier = ref.read(authNotifierProvider.notifier);
    notifier.loginBegin(
      emailController: emailController,
      passwordController: passwordController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                        top: 70, left: 30, right: 30, bottom: 20)
                    .r,
                child: Consumer(
                  builder: (_, ref, child) {
                    final stateView = ref.watch(
                      authNotifierProvider.select((value) => value.stateView),
                    );
                    switch (stateView) {
                      case StateView.signIn:
                        return LoginWidget(
                          emailController: emailController,
                          passwordController: passwordController,
                          notifier: notifier,
                        );
                      case StateView.signUp:
                        return RegisterWidget(
                          emailController: emailController,
                          nameController: nameController,
                          passwordController: passwordController,
                          phoneController: phoneController,
                          notifier: notifier,
                        );
                    }
                  },
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final isWaiting = ref.watch(
                    authNotifierProvider.select((value) => value.wait),
                  );
                  return isWaiting ? const LoadingWidget() : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
