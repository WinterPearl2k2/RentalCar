import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
class UserProfileDTO with _$UserProfileDTO {
  const factory UserProfileDTO({
    @Default('') String name,
    @Default('') String email,
    @Default('') String phone,
  }) = _UserProfileDTO;

  factory UserProfileDTO.fromJson(Map<String, dynamic> json) => _$UserProfileDTOFromJson(json);
}
