import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';

part 'car_detail_state.freezed.dart';

@freezed
class CarDetailState with _$CarDetailState {
  const factory CarDetailState({
    @Default(CarDetailDTO()) CarDetailDTO carDetail,
  }) = _CarDetailState;
}
