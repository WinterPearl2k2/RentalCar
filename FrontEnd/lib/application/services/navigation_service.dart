import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationService({required this.navigatorKey});

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateReplaceTo(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }
}
