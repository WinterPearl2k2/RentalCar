
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_car_state.freezed.dart';

@freezed
class AddCarState with _$AddCarState {
  const AddCarState._();

  factory AddCarState({
    @Default(AddCarStep.step1) AddCarStep addCarStep,
    @Default(false) bool isCheckNameCar,
    @Default(false) bool isCheckColorCar,
    @Default(false) bool isCheckKilometers,
    @Default(false) bool isCheckSeatsCar,
    @Default(false) bool isCheckPriceCar,
    @Default(false) bool isCheckAddressCar,
    @Default('') String imageFile,
  }) = _AddCarState;
}

enum AddCarStep { step0, step1, step2, step3, step4, success }


