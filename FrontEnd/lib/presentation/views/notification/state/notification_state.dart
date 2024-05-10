import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/dtos/user_car_rental_dto.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<UserCarRentalDto> user,
    @Default(false) bool wait,
  }) = _NotificationState;
}
