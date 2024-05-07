import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_dto.freezed.dart';
part 'verify_code_dto.g.dart';

@freezed
class VerifyCodeDto with _$VerifyCodeDto {
  const factory VerifyCodeDto({
    @Default('') String code,
    @Default('') String email,
  }) = _VerifyCodeDto;

  factory VerifyCodeDto.fromJson(Map<String, dynamic> json) => _$VerifyCodeDtoFromJson(json);
}
