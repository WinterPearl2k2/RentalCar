import 'package:freezed_annotation/freezed_annotation.dart';
part 'contract.freezed.dart';
part 'contract.g.dart';

@freezed
class Contract with _$Contract {
  const factory Contract({
    @Default('') String idContract,
    @Default('') String idCar,
    @Default('') String idUser,
    @Default('') String startTime,
    @Default('') String endTime,
  }) = _Contract;

  factory Contract.fromJson(Map<String, dynamic> json) => _$ContractFromJson(json);
}
