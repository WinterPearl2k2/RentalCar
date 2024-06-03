import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_call_state.freezed.dart';

@freezed
class RoomCallState with _$RoomCallState {
  const factory RoomCallState({
    @Default(Stream.empty()) Stream stream,
  }) = _RoomCallState;
}