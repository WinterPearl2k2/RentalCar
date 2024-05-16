import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String idUser,
    @Default('') String emailUser,
    @Default('') String phoneUser,
    @Default('') String nameUser,
    @Default('') String passwordUser,
    @Default('') String createAt,
    @Default('') String updateAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
