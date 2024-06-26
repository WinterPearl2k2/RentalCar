import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/presentation/common/enum/status.dart';

import '../../../../data/dtos/rental_contract_dto.dart';

part 'contract_state.freezed.dart';

@freezed
class ContractState with _$ContractState {
  const factory ContractState({
    @Default([]) List<RentalContractDto> rentalContracts,
    @Default([]) List<RentalContractDto> leaseContracts,
    @Default(-1) int rentalFilter,
    @Default(-1) int leaseFilter,
    @Default(false) bool wait,
    @Default(Status.loading) Status status,
  }) = _ContractState;
}
