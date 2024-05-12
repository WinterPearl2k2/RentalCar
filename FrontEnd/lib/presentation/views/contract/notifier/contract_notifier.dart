import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/contract_service.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../state/contract_state.dart';

part 'contract_notifier.g.dart';

@riverpod
class ContractNotifier extends _$ContractNotifier {
  @override
  ContractState build() => const ContractState();

  Future<void> getRentalContract() async {
    try {
      final contracts = await injection
          .getIt<IContractService>()
          .getRentalContract(offset: 0);
      state = state.copyWith(
        rentalContracts: contracts,
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> getMoreRentalContract() async {
    try {
      final contracts =
          await injection.getIt<IContractService>().getRentalContract(
                offset: state.rentalContracts.length,
              );
      if(contracts.isEmpty) return;
      state = state.copyWith(
        rentalContracts: [...state.rentalContracts, ...contracts],
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}
