import 'package:freezed_annotation/freezed_annotation.dart';

part 'citizen_dto.freezed.dart';

part 'citizen_dto.g.dart';

@freezed
class CitizenDto with _$CitizenDto {
  const factory CitizenDto({
    @Default('') String no,
    @Default('') String fullName,
    @Default('') String dateOfBirth,
    @Default('') String sex,
    @Default('') String nationality,
    @Default('') String placeOfOrigin,
  }) = _CitizenDto;

  factory CitizenDto.fromJson(Map<String, dynamic> json) =>
      _$CitizenDtoFromJson(json);
}
