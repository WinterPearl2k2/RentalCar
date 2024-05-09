import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/domain/model/car.dart';

part 'manager_car_state.freezed.dart';

@freezed
class ManagerCarState with _$ManagerCarState {
  const factory ManagerCarState({
    @Default([]) List<Car> listCarUser,
    @Default(CarDTO()) CarDTO carDTO,
    @Default(Status.loading) Status status,
    @Default(AddCarStep.step1) AddCarStep addCarStep,
    @Default(false) bool isCheckNameCar,
    @Default(false) bool isCheckColorCar,
    @Default(false) bool isCheckDescriptionCar,
    @Default(false) bool isCheckKilometers,
    @Default(false) bool isCheckSeatsCar,
    @Default(false) bool isCheckPriceCar,
    @Default(false) bool isCheckAddressCar,
    @Default('') String imageFile,
    @Default(false) bool isEditButton,
  }) = _ManagerCarState;
}
enum Status {
  loading,
  success,
}

enum AddCarStep {step1, step2, step3, step4, success }


