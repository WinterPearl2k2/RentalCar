import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/dtos/rental_contract_dto.dart';

part 'contract_state.freezed.dart';

@freezed
class ContractState with _$ContractState {
  const factory ContractState({
    @Default([]) List<RentalContractDto> rentalContracts,
    @Default(false) bool wait,
  }) = _ContractState;
}
