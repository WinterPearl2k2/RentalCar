import 'package:freezed_annotation/freezed_annotation.dart';

part 'calling_state.freezed.dart';

@freezed
class CallingState with _$CallingState {
  const factory CallingState({
    @Default('') String newMessage,
  }) = _CallingState;
}
