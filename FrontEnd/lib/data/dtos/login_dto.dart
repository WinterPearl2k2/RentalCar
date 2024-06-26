import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDTO with _$LoginDTO {
  const factory LoginDTO({
    @Default('') String password,
    @Default('') String email,
    @Default('') String deviceToken,
    @Default(false) bool authentication,
  }) = _LoginDTO;

  factory LoginDTO.fromJson(Map<String, dynamic> json) => _$LoginDTOFromJson(json);
}
