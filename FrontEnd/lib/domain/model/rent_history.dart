import 'package:freezed_annotation/freezed_annotation.dart';
part 'rent_history.freezed.dart';
part 'rent_history.g.dart';

@freezed
class RentHistory with _$RentHistory {
  const factory RentHistory({
    @Default('') String idHistory,
    @Default('') String idCar,
    @Default('') String idUser,
    @Default(0) int statusHistory,
  }) = _RentHistory;

  factory RentHistory.fromJson(Map<String, dynamic> json) => _$RentHistoryFromJson(json);
}
