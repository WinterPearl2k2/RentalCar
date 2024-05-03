import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_car_state.freezed.dart';

@freezed
class AddCarState with _$AddCarState {
  const AddCarState._();

  factory AddCarState({
    @Default(AddCarStep.step1) AddCarStep addCarStep,
  }) = _AddCarState;
}

enum AddCarStep { step0 ,step1, step2, step3, step4, success }



