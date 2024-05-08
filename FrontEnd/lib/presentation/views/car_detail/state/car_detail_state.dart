import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/domain/model/car.dart';

part 'car_detail_state.freezed.dart';

@freezed
class CarDetailState with _$CarDetailState {
  const factory CarDetailState({
    @Default(Car()) Car car,
  }) = _CarDetailState;
}
