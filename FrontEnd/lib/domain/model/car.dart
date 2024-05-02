import 'package:freezed_annotation/freezed_annotation.dart';
part 'car.freezed.dart';
part 'car.g.dart';

@freezed
class Car with _$Car {
  const factory Car({
    @Default('') String idCar,
    @Default('') String idBrand,
    @Default('') String idOwner,
    @Default([]) List<String> idReview,
    @Default('') String nameCar,
    @Default('') String priceCar,
    @Default(TypeFuel.gasFuel) TypeFuel fuelTypeCar,
    @Default('') String colorCar,
    @Default('') String descriptionCar,
    @Default(0) int kilometersCar,
    @Default(0) int seatsCar,
    @Default(Transmission.manual) Transmission transmissionCar,
    @Default([]) List<String> imagesCar,
    @Default(StatusCar.available) StatusCar statusCar,
    @Default('') String createAt,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}

enum StatusCar {
  renting,
  available,
}

enum TypeFuel {
  dieselFuel,
  gasFuel,
  hybridFuel,
  electricFuel,
}

enum Transmission {
  automatic,
  manual,
}
