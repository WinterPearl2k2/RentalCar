import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_dto.freezed.dart';
part 'reset_password_dto.g.dart';

@freezed
class ResetPasswordDto with _$ResetPasswordDto {
  const factory ResetPasswordDto({
    @Default('') String password,
    @Default('') String email,
  }) = _ResetPasswordDto;

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) => _$ResetPasswordDtoFromJson(json);
}
