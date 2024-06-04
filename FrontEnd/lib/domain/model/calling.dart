import 'package:freezed_annotation/freezed_annotation.dart';

part 'calling.freezed.dart';

part 'calling.g.dart';

@freezed
class Calling with _$Calling {
  const factory Calling({
    @Default('') String keyRoom,
    @Default('') String userName,
    @Default('') String mainUser,
  }) = _Calling;

  factory Calling.fromJson(Map<String, dynamic> json) =>
      _$CallingFromJson(json);
}
