// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileDTO _$UserProfileDTOFromJson(Map<String, dynamic> json) {
  return _UserProfileDTO.fromJson(json);
}

/// @nodoc
mixin _$UserProfileDTO {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get authentication => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileDTOCopyWith<UserProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDTOCopyWith<$Res> {
  factory $UserProfileDTOCopyWith(
          UserProfileDTO value, $Res Function(UserProfileDTO) then) =
      _$UserProfileDTOCopyWithImpl<$Res, UserProfileDTO>;
  @useResult
  $Res call({String name, String email, String phone, bool authentication});
}

/// @nodoc
class _$UserProfileDTOCopyWithImpl<$Res, $Val extends UserProfileDTO>
    implements $UserProfileDTOCopyWith<$Res> {
  _$UserProfileDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? authentication = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      authentication: null == authentication
          ? _value.authentication
          : authentication // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileDTOImplCopyWith<$Res>
    implements $UserProfileDTOCopyWith<$Res> {
  factory _$$UserProfileDTOImplCopyWith(_$UserProfileDTOImpl value,
          $Res Function(_$UserProfileDTOImpl) then) =
      __$$UserProfileDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String phone, bool authentication});
}

/// @nodoc
class __$$UserProfileDTOImplCopyWithImpl<$Res>
    extends _$UserProfileDTOCopyWithImpl<$Res, _$UserProfileDTOImpl>
    implements _$$UserProfileDTOImplCopyWith<$Res> {
  __$$UserProfileDTOImplCopyWithImpl(
      _$UserProfileDTOImpl _value, $Res Function(_$UserProfileDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? authentication = null,
  }) {
    return _then(_$UserProfileDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      authentication: null == authentication
          ? _value.authentication
          : authentication // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileDTOImpl implements _UserProfileDTO {
  const _$UserProfileDTOImpl(
      {this.name = '',
      this.email = '',
      this.phone = '',
      this.authentication = false});

  factory _$UserProfileDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileDTOImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final bool authentication;

  @override
  String toString() {
    return 'UserProfileDTO(name: $name, email: $email, phone: $phone, authentication: $authentication)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileDTOImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.authentication, authentication) ||
                other.authentication == authentication));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, phone, authentication);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileDTOImplCopyWith<_$UserProfileDTOImpl> get copyWith =>
      __$$UserProfileDTOImplCopyWithImpl<_$UserProfileDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileDTOImplToJson(
      this,
    );
  }
}

abstract class _UserProfileDTO implements UserProfileDTO {
  const factory _UserProfileDTO(
      {final String name,
      final String email,
      final String phone,
      final bool authentication}) = _$UserProfileDTOImpl;

  factory _UserProfileDTO.fromJson(Map<String, dynamic> json) =
      _$UserProfileDTOImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  bool get authentication;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileDTOImplCopyWith<_$UserProfileDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
