import 'package:freezed_annotation/freezed_annotation.dart';
part 'car.freezed.dart';
part 'car.g.dart';

@freezed
class Car with _$Car {
  const factory Car({
    @Default('') String idCar,
    @Default('') String idUser,
    @Default('') String idReview,
    @Default('') String nameCar,
    @Default(0) double priceCar,
    @Default('') String fuelTypeCar,
    @Default('') String brandCar,
    @Default('') String colorCar,
    @Default('') String descriptionCar,
    @Default(0) int kilometersCar,
    @Default(0) int seatsCar,
    @Default('') String transmissionCar,
    @Default('') String addressCar,
    @Default("") String imagesCar,
    @Default('') String statusCar,
    @Default('') String createAt,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}

enum StatusCar {
  renting,
  available,
}
