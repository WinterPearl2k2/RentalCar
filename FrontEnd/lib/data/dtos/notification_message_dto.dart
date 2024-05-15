import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_message_dto.freezed.dart';

part 'notification_message_dto.g.dart';

@freezed
class NotificationMessageDto with _$NotificationMessageDto {
  const factory NotificationMessageDto({
    @Default('') String typeMessage,
    @Default('') String carId,
  }) = _NotificationMessageDto;

  factory NotificationMessageDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationMessageDtoFromJson(json);
}
