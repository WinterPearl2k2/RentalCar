import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/contract_service.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/utils/log_utils.dart';
import '../state/car_rental_management_state.dart';

part 'car_rental_management_notifier.g.dart';

@riverpod
class CarRentalManagementNotifier extends _$CarRentalManagementNotifier {
  @override
  CarRentalManagementState build() => const CarRentalManagementState();

  Future<void> getRentalCar() async {
    try {
      final userCarRentalDto =
          await injection.getIt<ICarService>().getRentalCars();
      state = state.copyWith(
        user: userCarRentalDto,
      );
      LogUtils.i(userCarRentalDto.toString());
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(
      wait: true,
    );
  }

  Future<void> cancelRentalCar({required String idTransaction}) async {
    try {
      await injection.getIt<IContractService>().cancelRentalCar(
            idTransaction: idTransaction,
          );
      state = state.copyWith(
        user: state.user.where((user) => idTransaction != user.transaction).toList(),
      );
      Fluttertoast.showToast(msg: 'Cancellation successful.');
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> signContract({required String idTransaction}) async {
    try {
      await injection.getIt<IContractService>().signContract(
        idTransaction: idTransaction,
      );
      state = state.copyWith(
        user: state.user.where((user) => idTransaction != user.transaction).toList(),
      );
      Fluttertoast.showToast(msg: 'Sign successful.');
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}
