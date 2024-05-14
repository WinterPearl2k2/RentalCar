import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDTO with _$LoginDTO {
  const factory LoginDTO({
    @Default('') String password,
    @Default('') String email,
    @Default('') String deviceToken,
  }) = _LoginDTO;

  factory LoginDTO.fromJson(Map<String, dynamic> json) => _$LoginDTOFromJson(json);
}
