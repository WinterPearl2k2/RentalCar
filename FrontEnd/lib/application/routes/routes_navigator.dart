import 'package:flutter/cupertino.dart';
import 'package:rental_car/application/routes/routes_name.dart';
import 'package:rental_car/presentation/views/bottom_navigation/bottom_navigaton_view.dart';
import 'package:rental_car/presentation/views/car_detail/car_detail_view.dart';
import 'package:rental_car/presentation/views/car_rental_management/notification_view.dart';
import 'package:rental_car/presentation/views/change_password/change_password_view.dart';
import 'package:rental_car/presentation/views/detail_contract/detail_contract_view.dart';
import 'package:rental_car/presentation/views/forgot_password/forgot_password_view.dart';
import 'package:rental_car/presentation/views/verify_id/verify_id_view.dart';
import '../../presentation/views/auth/auth_view.dart';
import '../../presentation/views/manager_car/views/add_car_view.dart';

class RoutesNavigator {
  static Map<String, WidgetBuilder> routes() {
    return {
      RoutesName.auth: (context) => const AuthView(),
      RoutesName.forgotPassword: (context) => const ForgotPasswordView(),
      RoutesName.bottomNavigation: (context) => const BottomNavigationView(),
      RoutesName.changePassword: (context) => const ChangePasswordView(),
      RoutesName.carRentalManagement: (context) => const CarRentalManagementView(),
      RoutesName.detailContract: (context) => const DetailContractView(),
      RoutesName.verifyUser: (context) => const VerifyIdView(),
      RoutesName.addCar: (context) => const AddCarView(),
      RoutesName.carDetailView: (context) {
        final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
       return CarDetailView(
            idCar: args['idCar'] ?? '',
            distance: args['distance'] ?? 0.0,
            latCar: args['latCar'] ?? 0.0,
            longCar: args['longCar'] ?? 0.0,
        );
      },
    };
  }
}