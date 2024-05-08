import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/domain/model/car.dart';

part 'manager_car_state.freezed.dart';

@freezed
class ManagerCarState with _$ManagerCarState {
  const factory ManagerCarState({
    @Default([]) List<Car> listCarUser,
    @Default(Status.loading) Status status,
  }) = _ManagerCarState;
}
enum Status {
  loading,
  success,
}

