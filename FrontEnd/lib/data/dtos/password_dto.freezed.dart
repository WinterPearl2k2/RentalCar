// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PasswordDto _$PasswordDtoFromJson(Map<String, dynamic> json) {
  return _PasswordDto.fromJson(json);
}

/// @nodoc
mixin _$PasswordDto {
  String get oldPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordDtoCopyWith<PasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordDtoCopyWith<$Res> {
  factory $PasswordDtoCopyWith(
          PasswordDto value, $Res Function(PasswordDto) then) =
      _$PasswordDtoCopyWithImpl<$Res, PasswordDto>;
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class _$PasswordDtoCopyWithImpl<$Res, $Val extends PasswordDto>
    implements $PasswordDtoCopyWith<$Res> {
  _$PasswordDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordDtoImplCopyWith<$Res>
    implements $PasswordDtoCopyWith<$Res> {
  factory _$$PasswordDtoImplCopyWith(
          _$PasswordDtoImpl value, $Res Function(_$PasswordDtoImpl) then) =
      __$$PasswordDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class __$$PasswordDtoImplCopyWithImpl<$Res>
    extends _$PasswordDtoCopyWithImpl<$Res, _$PasswordDtoImpl>
    implements _$$PasswordDtoImplCopyWith<$Res> {
  __$$PasswordDtoImplCopyWithImpl(
      _$PasswordDtoImpl _value, $Res Function(_$PasswordDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$PasswordDtoImpl(
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordDtoImpl implements _PasswordDto {
  const _$PasswordDtoImpl({this.oldPassword = '', this.newPassword = ''});

  factory _$PasswordDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordDtoImplFromJson(json);

  @override
  @JsonKey()
  final String oldPassword;
  @override
  @JsonKey()
  final String newPassword;

  @override
  String toString() {
    return 'PasswordDto(oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordDtoImpl &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, oldPassword, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordDtoImplCopyWith<_$PasswordDtoImpl> get copyWith =>
      __$$PasswordDtoImplCopyWithImpl<_$PasswordDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordDtoImplToJson(
      this,
    );
  }
}

abstract class _PasswordDto implements PasswordDto {
  const factory _PasswordDto(
      {final String oldPassword, final String newPassword}) = _$PasswordDtoImpl;

  factory _PasswordDto.fromJson(Map<String, dynamic> json) =
      _$PasswordDtoImpl.fromJson;

  @override
  String get oldPassword;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$PasswordDtoImplCopyWith<_$PasswordDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
