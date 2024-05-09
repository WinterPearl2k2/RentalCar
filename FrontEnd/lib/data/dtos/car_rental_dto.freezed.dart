// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_rental_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarRentalDto _$CarRentalDtoFromJson(Map<String, dynamic> json) {
  return _CarRentalDto.fromJson(json);
}

/// @nodoc
mixin _$CarRentalDto {
  String get idCar => throw _privateConstructorUsedError;
  double get rentalPrice => throw _privateConstructorUsedError;
  int get rentalDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarRentalDtoCopyWith<CarRentalDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarRentalDtoCopyWith<$Res> {
  factory $CarRentalDtoCopyWith(
          CarRentalDto value, $Res Function(CarRentalDto) then) =
      _$CarRentalDtoCopyWithImpl<$Res, CarRentalDto>;
  @useResult
  $Res call({String idCar, double rentalPrice, int rentalDays});
}

/// @nodoc
class _$CarRentalDtoCopyWithImpl<$Res, $Val extends CarRentalDto>
    implements $CarRentalDtoCopyWith<$Res> {
  _$CarRentalDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? rentalPrice = null,
    Object? rentalDays = null,
  }) {
    return _then(_value.copyWith(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      rentalPrice: null == rentalPrice
          ? _value.rentalPrice
          : rentalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      rentalDays: null == rentalDays
          ? _value.rentalDays
          : rentalDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarRentalDtoImplCopyWith<$Res>
    implements $CarRentalDtoCopyWith<$Res> {
  factory _$$CarRentalDtoImplCopyWith(
          _$CarRentalDtoImpl value, $Res Function(_$CarRentalDtoImpl) then) =
      __$$CarRentalDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idCar, double rentalPrice, int rentalDays});
}

/// @nodoc
class __$$CarRentalDtoImplCopyWithImpl<$Res>
    extends _$CarRentalDtoCopyWithImpl<$Res, _$CarRentalDtoImpl>
    implements _$$CarRentalDtoImplCopyWith<$Res> {
  __$$CarRentalDtoImplCopyWithImpl(
      _$CarRentalDtoImpl _value, $Res Function(_$CarRentalDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? rentalPrice = null,
    Object? rentalDays = null,
  }) {
    return _then(_$CarRentalDtoImpl(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      rentalPrice: null == rentalPrice
          ? _value.rentalPrice
          : rentalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      rentalDays: null == rentalDays
          ? _value.rentalDays
          : rentalDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarRentalDtoImpl implements _CarRentalDto {
  const _$CarRentalDtoImpl(
      {this.idCar = '', this.rentalPrice = 0, this.rentalDays = 0});

  factory _$CarRentalDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarRentalDtoImplFromJson(json);

  @override
  @JsonKey()
  final String idCar;
  @override
  @JsonKey()
  final double rentalPrice;
  @override
  @JsonKey()
  final int rentalDays;

  @override
  String toString() {
    return 'CarRentalDto(idCar: $idCar, rentalPrice: $rentalPrice, rentalDays: $rentalDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarRentalDtoImpl &&
            (identical(other.idCar, idCar) || other.idCar == idCar) &&
            (identical(other.rentalPrice, rentalPrice) ||
                other.rentalPrice == rentalPrice) &&
            (identical(other.rentalDays, rentalDays) ||
                other.rentalDays == rentalDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idCar, rentalPrice, rentalDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarRentalDtoImplCopyWith<_$CarRentalDtoImpl> get copyWith =>
      __$$CarRentalDtoImplCopyWithImpl<_$CarRentalDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarRentalDtoImplToJson(
      this,
    );
  }
}

abstract class _CarRentalDto implements CarRentalDto {
  const factory _CarRentalDto(
      {final String idCar,
      final double rentalPrice,
      final int rentalDays}) = _$CarRentalDtoImpl;

  factory _CarRentalDto.fromJson(Map<String, dynamic> json) =
      _$CarRentalDtoImpl.fromJson;

  @override
  String get idCar;
  @override
  double get rentalPrice;
  @override
  int get rentalDays;
  @override
  @JsonKey(ignore: true)
  _$$CarRentalDtoImplCopyWith<_$CarRentalDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
