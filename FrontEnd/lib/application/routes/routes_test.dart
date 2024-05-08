import 'package:flutter/cupertino.dart';
import 'package:rental_car/application/routes/routes_name.dart';
import 'package:rental_car/presentation/views/bottom_navigation/bottom_navigaton_view.dart';
import 'package:rental_car/presentation/views/change_password/change_password_view.dart';
import 'package:rental_car/presentation/views/forgot_password/forgot_password_view.dart';
import '../../presentation/views/auth/auth_view.dart';

class RoutesTest {
  static Map<String, WidgetBuilder> routes() {
    return {
      RoutesName.auth: (context) => const AuthView(),
      RoutesName.forgotPassword: (context) => const ForgotPasswordView(),
      RoutesName.bottomNavigation: (context) => const BottomNavigationView(),
      RoutesName.changePassword: (context) => const ChangePasswordView(),
      // RoutesName.accountProfile: (context) => const AccountProfileView(),
    };
  }
}