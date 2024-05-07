// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyCodeDto _$VerifyCodeDtoFromJson(Map<String, dynamic> json) {
  return _VerifyCodeDto.fromJson(json);
}

/// @nodoc
mixin _$VerifyCodeDto {
  String get code => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyCodeDtoCopyWith<VerifyCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyCodeDtoCopyWith<$Res> {
  factory $VerifyCodeDtoCopyWith(
          VerifyCodeDto value, $Res Function(VerifyCodeDto) then) =
      _$VerifyCodeDtoCopyWithImpl<$Res, VerifyCodeDto>;
  @useResult
  $Res call({String code, String email});
}

/// @nodoc
class _$VerifyCodeDtoCopyWithImpl<$Res, $Val extends VerifyCodeDto>
    implements $VerifyCodeDtoCopyWith<$Res> {
  _$VerifyCodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyCodeDtoImplCopyWith<$Res>
    implements $VerifyCodeDtoCopyWith<$Res> {
  factory _$$VerifyCodeDtoImplCopyWith(
          _$VerifyCodeDtoImpl value, $Res Function(_$VerifyCodeDtoImpl) then) =
      __$$VerifyCodeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String email});
}

/// @nodoc
class __$$VerifyCodeDtoImplCopyWithImpl<$Res>
    extends _$VerifyCodeDtoCopyWithImpl<$Res, _$VerifyCodeDtoImpl>
    implements _$$VerifyCodeDtoImplCopyWith<$Res> {
  __$$VerifyCodeDtoImplCopyWithImpl(
      _$VerifyCodeDtoImpl _value, $Res Function(_$VerifyCodeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? email = null,
  }) {
    return _then(_$VerifyCodeDtoImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyCodeDtoImpl implements _VerifyCodeDto {
  const _$VerifyCodeDtoImpl({this.code = '', this.email = ''});

  factory _$VerifyCodeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyCodeDtoImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'VerifyCodeDto(code: $code, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeDtoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeDtoImplCopyWith<_$VerifyCodeDtoImpl> get copyWith =>
      __$$VerifyCodeDtoImplCopyWithImpl<_$VerifyCodeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyCodeDtoImplToJson(
      this,
    );
  }
}

abstract class _VerifyCodeDto implements VerifyCodeDto {
  const factory _VerifyCodeDto({final String code, final String email}) =
      _$VerifyCodeDtoImpl;

  factory _VerifyCodeDto.fromJson(Map<String, dynamic> json) =
      _$VerifyCodeDtoImpl.fromJson;

  @override
  String get code;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$VerifyCodeDtoImplCopyWith<_$VerifyCodeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
