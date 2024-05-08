import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_dto.freezed.dart';
part 'password_dto.g.dart';

@freezed
class PasswordDto with _$PasswordDto {
  const factory PasswordDto({
    @Default('') String oldPassword,
    @Default('') String newPassword,
  }) = _PasswordDto;

  factory PasswordDto.fromJson(Map<String, dynamic> json) => _$PasswordDtoFromJson(json);
}
