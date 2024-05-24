import 'package:flutter/material.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/presentation/views/account_profile/account_profile_view.dart';
import 'package:rental_car/presentation/views/auth/auth_view.dart';
import 'package:rental_car/presentation/views/car_detail/car_detail_view.dart';
import 'package:rental_car/presentation/views/car_rental_management/notification_view.dart';
import 'package:rental_car/presentation/views/car_review/car_review_view.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:rental_car/presentation/views/home/views/search_car_view.dart';
import 'package:rental_car/presentation/views/home/views/see_all_car_view.dart';
import 'package:rental_car/presentation/views/manager_car/views/edit_car_view.dart';

import '../../data/dtos/rental_contract_dto.dart';
import '../../presentation/views/rental_car/rental_car_view.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> routeBuilder(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.carRentalManagement:
        return MaterialPageRoute(
          builder: (context) => const CarRentalManagementView(),
        );
      case RoutesName.accountProfile:
        final args = settings.arguments as Map<String, UserProfileDTO>;
        return MaterialPageRoute(
          builder: (context) => AccountProfileView(
            user: args['user'] ?? const UserProfileDTO(),
          ),
        );
      case RoutesName.rentalCar:
        final args = settings.arguments as Map<String, CarDetailDTO>;
        return MaterialPageRoute(
          builder: (context) => RentalCarView(
            carData: args['car'] ?? const CarDetailDTO(),
          ),
        );
      case RoutesName.carDetailView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CarDetailView(
            idCar: args['idCar'] ?? '',
            distance: args['distance'] ?? 0.0,
            latCar: args['latCar'] ?? 0.0,
            longCar: args['longCar'] ?? 0.0,
          ),
        );
      case RoutesName.editCar:
        final args = settings.arguments as Map<String, Car>;
        return MaterialPageRoute(
          builder: (context) => EditCarView(
            car: args['car'] ?? const Car(),
          ),
        );
      case RoutesName.seeAllCar:
        final args = settings.arguments as Map<String, HomeNotifier>;
        return MaterialPageRoute(
          builder: (context) => SeeAllCarView(
            notifier: args['notifier'] ?? HomeNotifier(),
          ),
        );
      case RoutesName.searchCar:
        return MaterialPageRoute(
          builder: (context) => const SearchCarView(),
        );
      case RoutesName.reviewCar:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (context) => CarReviewView(
            idCar: args['idCar'] ?? '',
            nameCar: args['nameCar'] ?? '',
            imgCar: args['imgCar'] ?? '',
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AuthView(),
        );
    }
  }

  static void goToAuthScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RoutesName.auth, (Route<dynamic> route) => false);
  }

  static void goToNavigationView(NavigatorState? navigator) {
    navigator?.pushNamedAndRemoveUntil(
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
  ) {
    Navigator.pushNamed(
      context,
      RoutesName.verifyCode,
      arguments: {
        'email': email,
      },
    );
  }

  static void goToChangePasswordView(
    BuildContext context,
  ) {
    Navigator.pushNamed(
      context,
      RoutesName.changePassword,
    );
  }

  static Future<Object?> goToVerifyUserView(
    BuildContext context,
  ) {
    return Navigator.pushNamed(
      context,
      RoutesName.verifyUser,
    );
  }

  static void goToResetPasswordView(
    BuildContext context,
    String email,
  ) {
    Navigator.pushReplacementNamed(
      context,
      RoutesName.resetPassword,
      arguments: {'email': email},
    );
  }

  static void goToAddCarView(BuildContext context) {
    Navigator.of(context).pushNamed(
      RoutesName.addCar,
    );
  }

  static void goToCarDetailView(BuildContext context, String idCar,
      [double distance = 0.0, double latCar = 0.0, double longCar = 0.0]) {
    Navigator.of(context).pushNamed(RoutesName.carDetailView, arguments: {
      "idCar": idCar,
      "distance": distance,
      "latCar": latCar,
      "longCar": longCar,
    });
  }

  static void goToEditCarView(BuildContext context, Car car) {
    Navigator.of(context).pushNamed(RoutesName.editCar, arguments: {
      "car": car,
    });
  }

  static void goToPreviousView(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<Object?> goToAccountProfileView(
    BuildContext context,
    UserProfileDTO user,
  ) {
    return Navigator.pushNamed(
      context,
      RoutesName.accountProfile,
      arguments: {'user': user},
    );
  }

  static Future<Object?> goToDetailContractView(
    BuildContext context,
    RentalContractDto rentalContractDto,
  ) {
    return Navigator.pushNamed(
      context,
      RoutesName.detailContract,
      arguments: {'rental': rentalContractDto},
    );
  }

  static Future<Object?> goToCarRentalManagementView(
    BuildContext context,
  ) {
    return Navigator.pushNamed(
      context,
      RoutesName.carRentalManagement,
    );
  }

  static void goToRentalCarView(
    BuildContext context,
    CarDetailDTO car,
  ) {
    Navigator.pushNamed(
      context,
      RoutesName.rentalCar,
      arguments: {'car': car},
    );
  }

  static void goToSeeAllCarView(BuildContext context, HomeNotifier notifier) {
    Navigator.of(context)
        .pushNamed(RoutesName.seeAllCar, arguments: {'notifier': notifier});
  }

  static void goToSearchCarView(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.searchCar);
  }

  static void goToCarReviewView(BuildContext context,
      {required String idCar,
      required String imgCar,
      required String nameCar}) {
    Navigator.of(context).pushNamed(RoutesName.reviewCar, arguments: {
      'idCar': idCar,
      'nameCar': nameCar,
      'imgCar': imgCar,
    });
  }
}
