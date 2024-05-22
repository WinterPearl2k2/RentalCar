import 'package:freezed_annotation/freezed_annotation.dart';

part 'citizen.freezed.dart';
part 'citizen.g.dart';

@freezed
class Citizen with _$Citizen {
  const factory Citizen({
    @Default('') String no,
    @Default('') String fullName,
    @Default('') String dateOfBirth,
    @Default('') String sex,
      @Default('') String nationality,
    @Default('') String placeOfOrigin,
  }) = _Citizen;

  factory Citizen.fromJson(Map<String, dynamic> json) => _$CitizenFromJson(json);
}
