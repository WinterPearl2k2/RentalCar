// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get idUser => throw _privateConstructorUsedError;
  String get emailUser => throw _privateConstructorUsedError;
  String get phoneUser => throw _privateConstructorUsedError;
  String get nameUser => throw _privateConstructorUsedError;
  String get passwordUser => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String idUser,
      String emailUser,
      String phoneUser,
      String nameUser,
      String passwordUser,
      String createAt,
      String updateAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? emailUser = null,
    Object? phoneUser = null,
    Object? nameUser = null,
    Object? passwordUser = null,
    Object? createAt = null,
    Object? updateAt = null,
  }) {
    return _then(_value.copyWith(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      emailUser: null == emailUser
          ? _value.emailUser
          : emailUser // ignore: cast_nullable_to_non_nullable
              as String,
      phoneUser: null == phoneUser
          ? _value.phoneUser
          : phoneUser // ignore: cast_nullable_to_non_nullable
              as String,
      nameUser: null == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String,
      passwordUser: null == passwordUser
          ? _value.passwordUser
          : passwordUser // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idUser,
      String emailUser,
      String phoneUser,
      String nameUser,
      String passwordUser,
      String createAt,
      String updateAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? emailUser = null,
    Object? phoneUser = null,
    Object? nameUser = null,
    Object? passwordUser = null,
    Object? createAt = null,
    Object? updateAt = null,
  }) {
    return _then(_$UserImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      emailUser: null == emailUser
          ? _value.emailUser
          : emailUser // ignore: cast_nullable_to_non_nullable
              as String,
      phoneUser: null == phoneUser
          ? _value.phoneUser
          : phoneUser // ignore: cast_nullable_to_non_nullable
              as String,
      nameUser: null == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String,
      passwordUser: null == passwordUser
          ? _value.passwordUser
          : passwordUser // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.idUser = '',
      this.emailUser = '',
      this.phoneUser = '',
      this.nameUser = '',
      this.passwordUser = '',
      this.createAt = '',
      this.updateAt = ''});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey()
  final String idUser;
  @override
  @JsonKey()
  final String emailUser;
  @override
  @JsonKey()
  final String phoneUser;
  @override
  @JsonKey()
  final String nameUser;
  @override
  @JsonKey()
  final String passwordUser;
  @override
  @JsonKey()
  final String createAt;
  @override
  @JsonKey()
  final String updateAt;

  @override
  String toString() {
    return 'User(idUser: $idUser, emailUser: $emailUser, phoneUser: $phoneUser, nameUser: $nameUser, passwordUser: $passwordUser, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.emailUser, emailUser) ||
                other.emailUser == emailUser) &&
            (identical(other.phoneUser, phoneUser) ||
                other.phoneUser == phoneUser) &&
            (identical(other.nameUser, nameUser) ||
                other.nameUser == nameUser) &&
            (identical(other.passwordUser, passwordUser) ||
                other.passwordUser == passwordUser) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idUser, emailUser, phoneUser,
      nameUser, passwordUser, createAt, updateAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String idUser,
      final String emailUser,
      final String phoneUser,
      final String nameUser,
      final String passwordUser,
      final String createAt,
      final String updateAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get idUser;
  @override
  String get emailUser;
  @override
  String get phoneUser;
  @override
  String get nameUser;
  @override
  String get passwordUser;
  @override
  String get createAt;
  @override
  String get updateAt;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
