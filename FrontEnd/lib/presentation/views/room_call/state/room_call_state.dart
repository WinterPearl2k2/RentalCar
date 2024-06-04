import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_call_state.freezed.dart';

@freezed
class RoomCallState with _$RoomCallState {
  const factory RoomCallState({
    @Default(Stream.empty()) Stream stream,
    @Default(true) bool micEnabled,
    @Default(true) bool camEnabled,
    @Default({}) Map<String, dynamic> participants,
    @Default(false) bool wait,
    @Default('') String newMessage,
  }) = _RoomCallState;
}
