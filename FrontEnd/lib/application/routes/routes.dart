import 'package:flutter/material.dart';
import 'package:rental_car/presentation/views/add_car/add_car_view.dart';
import 'package:rental_car/presentation/views/auth/auth_view.dart';
import 'package:rental_car/presentation/views/bottom_navigation/bottom_navigaton_view.dart';
import 'package:rental_car/presentation/views/forgot_password/forgot_password_view.dart';
import 'package:rental_car/presentation/views/verify_code/verify_code_view.dart';

import 'routes_name.dart';

class Routes {
  static Route<dynamic> routeBuilder(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.auth:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AuthView(),
        );
      case RoutesName.addCar:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AddCarView(),
        );
      case RoutesName.bottomNavigation:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigationView(),
        );
      case RoutesName.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
        );
      case RoutesName.verifyCode:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (context) => const VerifyCodeView(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }

  static void goToAuthScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RoutesName.auth, (Route<dynamic> route) => false);
  }

  static void goToNavigationView(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutesName.bottomNavigation,
      (Route<dynamic> route) => false,
    );
  }

  static void goToForgotPasswordView(BuildContext context) {
    Navigator.of(context).pushNamed(
      RoutesName.forgotPassword,
    );
  }

  static void goToVerifyCodeView(
    BuildContext context,
    String email,
    String time,
  ) {
    Navigator.pushNamed(
      context,
      RoutesName.verifyCode,
      arguments: {
        'email': email,
        'time': time,
      },
    );
  }
}
