// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'citizen_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CitizenDto _$CitizenDtoFromJson(Map<String, dynamic> json) {
  return _CitizenDto.fromJson(json);
}

/// @nodoc
mixin _$CitizenDto {
  String get no => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  String get placeOfOrigin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CitizenDtoCopyWith<CitizenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitizenDtoCopyWith<$Res> {
  factory $CitizenDtoCopyWith(
          CitizenDto value, $Res Function(CitizenDto) then) =
      _$CitizenDtoCopyWithImpl<$Res, CitizenDto>;
  @useResult
  $Res call(
      {String no,
      String fullName,
      String dateOfBirth,
      String sex,
      String nationality,
      String placeOfOrigin});
}

/// @nodoc
class _$CitizenDtoCopyWithImpl<$Res, $Val extends CitizenDto>
    implements $CitizenDtoCopyWith<$Res> {
  _$CitizenDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? fullName = null,
    Object? dateOfBirth = null,
    Object? sex = null,
    Object? nationality = null,
    Object? placeOfOrigin = null,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfOrigin: null == placeOfOrigin
          ? _value.placeOfOrigin
          : placeOfOrigin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitizenDtoImplCopyWith<$Res>
    implements $CitizenDtoCopyWith<$Res> {
  factory _$$CitizenDtoImplCopyWith(
          _$CitizenDtoImpl value, $Res Function(_$CitizenDtoImpl) then) =
      __$$CitizenDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String no,
      String fullName,
      String dateOfBirth,
      String sex,
      String nationality,
      String placeOfOrigin});
}

/// @nodoc
class __$$CitizenDtoImplCopyWithImpl<$Res>
    extends _$CitizenDtoCopyWithImpl<$Res, _$CitizenDtoImpl>
    implements _$$CitizenDtoImplCopyWith<$Res> {
  __$$CitizenDtoImplCopyWithImpl(
      _$CitizenDtoImpl _value, $Res Function(_$CitizenDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? fullName = null,
    Object? dateOfBirth = null,
    Object? sex = null,
    Object? nationality = null,
    Object? placeOfOrigin = null,
  }) {
    return _then(_$CitizenDtoImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfOrigin: null == placeOfOrigin
          ? _value.placeOfOrigin
          : placeOfOrigin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CitizenDtoImpl implements _CitizenDto {
  const _$CitizenDtoImpl(
      {this.no = '',
      this.fullName = '',
      this.dateOfBirth = '',
      this.sex = '',
      this.nationality = '',
      this.placeOfOrigin = ''});

  factory _$CitizenDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitizenDtoImplFromJson(json);

  @override
  @JsonKey()
  final String no;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String dateOfBirth;
  @override
  @JsonKey()
  final String sex;
  @override
  @JsonKey()
  final String nationality;
  @override
  @JsonKey()
  final String placeOfOrigin;

  @override
  String toString() {
    return 'CitizenDto(no: $no, fullName: $fullName, dateOfBirth: $dateOfBirth, sex: $sex, nationality: $nationality, placeOfOrigin: $placeOfOrigin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitizenDtoImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.placeOfOrigin, placeOfOrigin) ||
                other.placeOfOrigin == placeOfOrigin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, no, fullName, dateOfBirth, sex, nationality, placeOfOrigin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CitizenDtoImplCopyWith<_$CitizenDtoImpl> get copyWith =>
      __$$CitizenDtoImplCopyWithImpl<_$CitizenDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitizenDtoImplToJson(
      this,
    );
  }
}

abstract class _CitizenDto implements CitizenDto {
  const factory _CitizenDto(
      {final String no,
      final String fullName,
      final String dateOfBirth,
      final String sex,
      final String nationality,
      final String placeOfOrigin}) = _$CitizenDtoImpl;

  factory _CitizenDto.fromJson(Map<String, dynamic> json) =
      _$CitizenDtoImpl.fromJson;

  @override
  String get no;
  @override
  String get fullName;
  @override
  String get dateOfBirth;
  @override
  String get sex;
  @override
  String get nationality;
  @override
  String get placeOfOrigin;
  @override
  @JsonKey(ignore: true)
  _$$CitizenDtoImplCopyWith<_$CitizenDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
