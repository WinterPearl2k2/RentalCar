import 'package:freezed_annotation/freezed_annotation.dart';
part 'car_owner.freezed.dart';
part 'car_owner.g.dart';

@freezed
class CarOwner with _$CarOwner {
  const factory CarOwner({
    @Default('') String idOwner,
    @Default('') String idCar,
    @Default('') String idUser,
    @Default('') String addressOwner,
  }) = _CarOwner;

  factory CarOwner.fromJson(Map<String, dynamic> json) => _$CarOwnerFromJson(json);
}
