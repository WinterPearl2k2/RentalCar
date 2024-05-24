import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/contract_service.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/services/firebase_service.dart';
import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../state/contract_state.dart';

part 'contract_notifier.g.dart';

@riverpod
class ContractNotifier extends _$ContractNotifier {
  @override
  ContractState build() => const ContractState();

  Future<void> setUpData() async {
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    state = state.copyWith(
      rentalFilter: -1,
      leaseFilter: -1,
    );
  }

  Future<void> getRentalContract() async {
    try {
      final contracts =
          await injection.getIt<IContractService>().getRentalContract(
                offset: 0,
                filter: state.rentalFilter,
              );
      state =
          state.copyWith(rentalContracts: contracts, status: Status.success,);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
      state = state.copyWith(status: Status.error);
    }
  }

  void filterRental(int value) {
    int filter = -1;
    switch (value) {
      case 0:
        filter = -1;
      case 1:
        filter = 0;
      case 2:
        filter = 1;
      case 3:
        filter = 2;
      case 4:
        filter = 3;
    }
    state = state.copyWith(rentalFilter: filter);
    getRentalContract();
  }

  void filterLease(int value) {
    int filter = -1;
    switch (value) {
      case 0:
        filter = -1;
      case 1:
        filter = 1;
      case 2:
        filter = 3;
    }
    state = state.copyWith(leaseFilter: filter);
    getLeaseContract();
  }

  Future<void> getMoreRentalContract() async {
    try {
      print('object');
      final contracts =
      await injection.getIt<IContractService>().getRentalContract(
        offset: state.rentalContracts.length,
        filter: state.rentalFilter,
      );
      if (contracts.isEmpty) return;
      state = state.copyWith(
        rentalContracts: [...state.rentalContracts, ...contracts],
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> getLeaseContract() async {
    try {
      final contracts =
          await injection.getIt<IContractService>().getLeaseContract(
                offset: 0,
                filter: state.leaseFilter,
              );
      state = state.copyWith(
        leaseContracts: contracts,
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
      state = state.copyWith(status: Status.error);
    }
  }

  Future<void> getMoreLeaseContract() async {
    try {
      final contracts =
      await injection.getIt<IContractService>().getLeaseContract(
        offset: state.leaseContracts.length,
        filter: state.leaseFilter,
      );
      if (contracts.isEmpty) return;
      state = state.copyWith(
        leaseContracts: [...state.leaseContracts, ...contracts],
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> _handleOpenAppMessage(RemoteMessage msg) async {
    await getRentalContract();
    await getLeaseContract();
  }

  Future<void> _handleMessage(RemoteMessage msg) async {
    await getRentalContract();
    await getLeaseContract();
  }

  Future<void> setListenMessage() async {
    injection.getIt<FirebaseService>().handleMessage(
      onChangedMessage: _handleMessage,
      onMessageOpenApp: _handleOpenAppMessage,
    );
  }
}
