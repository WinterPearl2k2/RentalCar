import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/top_car_dto.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<TopCarDTO> listTopCar,
    @Default(Status.loading) Status status,
  }) = _HomeState;
}

enum Status {
  loading,
  success,
}