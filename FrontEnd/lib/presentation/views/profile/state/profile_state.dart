import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) loading,
    @Default(UserProfileDTO()) UserProfileDTO user,
  }) = _ProfileState;
}
