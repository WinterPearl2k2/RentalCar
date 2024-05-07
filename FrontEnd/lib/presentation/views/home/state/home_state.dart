import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/domain/model/car.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Car> listCar,
  }) = _HomeState;
}

