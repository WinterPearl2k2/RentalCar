// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginDTO _$LoginDTOFromJson(Map<String, dynamic> json) {
  return _LoginDTO.fromJson(json);
}

/// @nodoc
mixin _$LoginDTO {
  String get password => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get deviceToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDTOCopyWith<LoginDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDTOCopyWith<$Res> {
  factory $LoginDTOCopyWith(LoginDTO value, $Res Function(LoginDTO) then) =
      _$LoginDTOCopyWithImpl<$Res, LoginDTO>;
  @useResult
  $Res call({String password, String email, String deviceToken});
}

/// @nodoc
class _$LoginDTOCopyWithImpl<$Res, $Val extends LoginDTO>
    implements $LoginDTOCopyWith<$Res> {
  _$LoginDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? email = null,
    Object? deviceToken = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      deviceToken: null == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginDTOImplCopyWith<$Res>
    implements $LoginDTOCopyWith<$Res> {
  factory _$$LoginDTOImplCopyWith(
          _$LoginDTOImpl value, $Res Function(_$LoginDTOImpl) then) =
      __$$LoginDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, String email, String deviceToken});
}

/// @nodoc
class __$$LoginDTOImplCopyWithImpl<$Res>
    extends _$LoginDTOCopyWithImpl<$Res, _$LoginDTOImpl>
    implements _$$LoginDTOImplCopyWith<$Res> {
  __$$LoginDTOImplCopyWithImpl(
      _$LoginDTOImpl _value, $Res Function(_$LoginDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? email = null,
    Object? deviceToken = null,
  }) {
    return _then(_$LoginDTOImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      deviceToken: null == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDTOImpl implements _LoginDTO {
  const _$LoginDTOImpl(
      {this.password = '', this.email = '', this.deviceToken = ''});

  factory _$LoginDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDTOImplFromJson(json);

  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String deviceToken;

  @override
  String toString() {
    return 'LoginDTO(password: $password, email: $email, deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDTOImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, password, email, deviceToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDTOImplCopyWith<_$LoginDTOImpl> get copyWith =>
      __$$LoginDTOImplCopyWithImpl<_$LoginDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDTOImplToJson(
      this,
    );
  }
}

abstract class _LoginDTO implements LoginDTO {
  const factory _LoginDTO(
      {final String password,
      final String email,
      final String deviceToken}) = _$LoginDTOImpl;

  factory _LoginDTO.fromJson(Map<String, dynamic> json) =
      _$LoginDTOImpl.fromJson;

  @override
  String get password;
  @override
  String get email;
  @override
  String get deviceToken;
  @override
  @JsonKey(ignore: true)
  _$$LoginDTOImplCopyWith<_$LoginDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
