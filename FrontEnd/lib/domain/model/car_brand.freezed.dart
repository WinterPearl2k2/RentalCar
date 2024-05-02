// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarBrand _$CarBrandFromJson(Map<String, dynamic> json) {
  return _CarBrand.fromJson(json);
}

/// @nodoc
mixin _$CarBrand {
  String get idBrand => throw _privateConstructorUsedError;
  String get modelBrand => throw _privateConstructorUsedError;
  String get modelYear => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarBrandCopyWith<CarBrand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarBrandCopyWith<$Res> {
  factory $CarBrandCopyWith(CarBrand value, $Res Function(CarBrand) then) =
      _$CarBrandCopyWithImpl<$Res, CarBrand>;
  @useResult
  $Res call({String idBrand, String modelBrand, String modelYear});
}

/// @nodoc
class _$CarBrandCopyWithImpl<$Res, $Val extends CarBrand>
    implements $CarBrandCopyWith<$Res> {
  _$CarBrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBrand = null,
    Object? modelBrand = null,
    Object? modelYear = null,
  }) {
    return _then(_value.copyWith(
      idBrand: null == idBrand
          ? _value.idBrand
          : idBrand // ignore: cast_nullable_to_non_nullable
              as String,
      modelBrand: null == modelBrand
          ? _value.modelBrand
          : modelBrand // ignore: cast_nullable_to_non_nullable
              as String,
      modelYear: null == modelYear
          ? _value.modelYear
          : modelYear // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarBrandImplCopyWith<$Res>
    implements $CarBrandCopyWith<$Res> {
  factory _$$CarBrandImplCopyWith(
          _$CarBrandImpl value, $Res Function(_$CarBrandImpl) then) =
      __$$CarBrandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idBrand, String modelBrand, String modelYear});
}

/// @nodoc
class __$$CarBrandImplCopyWithImpl<$Res>
    extends _$CarBrandCopyWithImpl<$Res, _$CarBrandImpl>
    implements _$$CarBrandImplCopyWith<$Res> {
  __$$CarBrandImplCopyWithImpl(
      _$CarBrandImpl _value, $Res Function(_$CarBrandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBrand = null,
    Object? modelBrand = null,
    Object? modelYear = null,
  }) {
    return _then(_$CarBrandImpl(
      idBrand: null == idBrand
          ? _value.idBrand
          : idBrand // ignore: cast_nullable_to_non_nullable
              as String,
      modelBrand: null == modelBrand
          ? _value.modelBrand
          : modelBrand // ignore: cast_nullable_to_non_nullable
              as String,
      modelYear: null == modelYear
          ? _value.modelYear
          : modelYear // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarBrandImpl implements _CarBrand {
  const _$CarBrandImpl(
      {this.idBrand = '', this.modelBrand = '', this.modelYear = ''});

  factory _$CarBrandImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarBrandImplFromJson(json);

  @override
  @JsonKey()
  final String idBrand;
  @override
  @JsonKey()
  final String modelBrand;
  @override
  @JsonKey()
  final String modelYear;

  @override
  String toString() {
    return 'CarBrand(idBrand: $idBrand, modelBrand: $modelBrand, modelYear: $modelYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarBrandImpl &&
            (identical(other.idBrand, idBrand) || other.idBrand == idBrand) &&
            (identical(other.modelBrand, modelBrand) ||
                other.modelBrand == modelBrand) &&
            (identical(other.modelYear, modelYear) ||
                other.modelYear == modelYear));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idBrand, modelBrand, modelYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarBrandImplCopyWith<_$CarBrandImpl> get copyWith =>
      __$$CarBrandImplCopyWithImpl<_$CarBrandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarBrandImplToJson(
      this,
    );
  }
}

abstract class _CarBrand implements CarBrand {
  const factory _CarBrand(
      {final String idBrand,
      final String modelBrand,
      final String modelYear}) = _$CarBrandImpl;

  factory _CarBrand.fromJson(Map<String, dynamic> json) =
      _$CarBrandImpl.fromJson;

  @override
  String get idBrand;
  @override
  String get modelBrand;
  @override
  String get modelYear;
  @override
  @JsonKey(ignore: true)
  _$$CarBrandImplCopyWith<_$CarBrandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
