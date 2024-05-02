import 'package:freezed_annotation/freezed_annotation.dart';
part 'car_brand.freezed.dart';
part 'car_brand.g.dart';

@freezed
class CarBrand with _$CarBrand {
  const factory CarBrand({
    @Default('') String idBrand,
    @Default('') String modelBrand,
    @Default('') String modelYear,
  }) = _CarBrand;

  factory CarBrand.fromJson(Map<String, dynamic> json) => _$CarBrandFromJson(json);
}
