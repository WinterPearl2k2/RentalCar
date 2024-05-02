// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Car _$CarFromJson(Map<String, dynamic> json) {
  return _Car.fromJson(json);
}

/// @nodoc
mixin _$Car {
  String get idCar => throw _privateConstructorUsedError;
  String get idBrand => throw _privateConstructorUsedError;
  String get idOwner => throw _privateConstructorUsedError;
  List<String> get idReview => throw _privateConstructorUsedError;
  String get nameCar => throw _privateConstructorUsedError;
  String get priceCar => throw _privateConstructorUsedError;
  TypeFuel get fuelTypeCar => throw _privateConstructorUsedError;
  String get colorCar => throw _privateConstructorUsedError;
  String get descriptionCar => throw _privateConstructorUsedError;
  int get kilometersCar => throw _privateConstructorUsedError;
  int get seatsCar => throw _privateConstructorUsedError;
  Transmission get transmissionCar => throw _privateConstructorUsedError;
  List<String> get imagesCar => throw _privateConstructorUsedError;
  StatusCar get statusCar => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarCopyWith<Car> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarCopyWith<$Res> {
  factory $CarCopyWith(Car value, $Res Function(Car) then) =
      _$CarCopyWithImpl<$Res, Car>;
  @useResult
  $Res call(
      {String idCar,
      String idBrand,
      String idOwner,
      List<String> idReview,
      String nameCar,
      String priceCar,
      TypeFuel fuelTypeCar,
      String colorCar,
      String descriptionCar,
      int kilometersCar,
      int seatsCar,
      Transmission transmissionCar,
      List<String> imagesCar,
      StatusCar statusCar,
      String createAt});
}

/// @nodoc
class _$CarCopyWithImpl<$Res, $Val extends Car> implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? idBrand = null,
    Object? idOwner = null,
    Object? idReview = null,
    Object? nameCar = null,
    Object? priceCar = null,
    Object? fuelTypeCar = null,
    Object? colorCar = null,
    Object? descriptionCar = null,
    Object? kilometersCar = null,
    Object? seatsCar = null,
    Object? transmissionCar = null,
    Object? imagesCar = null,
    Object? statusCar = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      idBrand: null == idBrand
          ? _value.idBrand
          : idBrand // ignore: cast_nullable_to_non_nullable
              as String,
      idOwner: null == idOwner
          ? _value.idOwner
          : idOwner // ignore: cast_nullable_to_non_nullable
              as String,
      idReview: null == idReview
          ? _value.idReview
          : idReview // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nameCar: null == nameCar
          ? _value.nameCar
          : nameCar // ignore: cast_nullable_to_non_nullable
              as String,
      priceCar: null == priceCar
          ? _value.priceCar
          : priceCar // ignore: cast_nullable_to_non_nullable
              as String,
      fuelTypeCar: null == fuelTypeCar
          ? _value.fuelTypeCar
          : fuelTypeCar // ignore: cast_nullable_to_non_nullable
              as TypeFuel,
      colorCar: null == colorCar
          ? _value.colorCar
          : colorCar // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionCar: null == descriptionCar
          ? _value.descriptionCar
          : descriptionCar // ignore: cast_nullable_to_non_nullable
              as String,
      kilometersCar: null == kilometersCar
          ? _value.kilometersCar
          : kilometersCar // ignore: cast_nullable_to_non_nullable
              as int,
      seatsCar: null == seatsCar
          ? _value.seatsCar
          : seatsCar // ignore: cast_nullable_to_non_nullable
              as int,
      transmissionCar: null == transmissionCar
          ? _value.transmissionCar
          : transmissionCar // ignore: cast_nullable_to_non_nullable
              as Transmission,
      imagesCar: null == imagesCar
          ? _value.imagesCar
          : imagesCar // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statusCar: null == statusCar
          ? _value.statusCar
          : statusCar // ignore: cast_nullable_to_non_nullable
              as StatusCar,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarImplCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$$CarImplCopyWith(_$CarImpl value, $Res Function(_$CarImpl) then) =
      __$$CarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idCar,
      String idBrand,
      String idOwner,
      List<String> idReview,
      String nameCar,
      String priceCar,
      TypeFuel fuelTypeCar,
      String colorCar,
      String descriptionCar,
      int kilometersCar,
      int seatsCar,
      Transmission transmissionCar,
      List<String> imagesCar,
      StatusCar statusCar,
      String createAt});
}

/// @nodoc
class __$$CarImplCopyWithImpl<$Res> extends _$CarCopyWithImpl<$Res, _$CarImpl>
    implements _$$CarImplCopyWith<$Res> {
  __$$CarImplCopyWithImpl(_$CarImpl _value, $Res Function(_$CarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? idBrand = null,
    Object? idOwner = null,
    Object? idReview = null,
    Object? nameCar = null,
    Object? priceCar = null,
    Object? fuelTypeCar = null,
    Object? colorCar = null,
    Object? descriptionCar = null,
    Object? kilometersCar = null,
    Object? seatsCar = null,
    Object? transmissionCar = null,
    Object? imagesCar = null,
    Object? statusCar = null,
    Object? createAt = null,
  }) {
    return _then(_$CarImpl(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      idBrand: null == idBrand
          ? _value.idBrand
          : idBrand // ignore: cast_nullable_to_non_nullable
              as String,
      idOwner: null == idOwner
          ? _value.idOwner
          : idOwner // ignore: cast_nullable_to_non_nullable
              as String,
      idReview: null == idReview
          ? _value._idReview
          : idReview // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nameCar: null == nameCar
          ? _value.nameCar
          : nameCar // ignore: cast_nullable_to_non_nullable
              as String,
      priceCar: null == priceCar
          ? _value.priceCar
          : priceCar // ignore: cast_nullable_to_non_nullable
              as String,
      fuelTypeCar: null == fuelTypeCar
          ? _value.fuelTypeCar
          : fuelTypeCar // ignore: cast_nullable_to_non_nullable
              as TypeFuel,
      colorCar: null == colorCar
          ? _value.colorCar
          : colorCar // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionCar: null == descriptionCar
          ? _value.descriptionCar
          : descriptionCar // ignore: cast_nullable_to_non_nullable
              as String,
      kilometersCar: null == kilometersCar
          ? _value.kilometersCar
          : kilometersCar // ignore: cast_nullable_to_non_nullable
              as int,
      seatsCar: null == seatsCar
          ? _value.seatsCar
          : seatsCar // ignore: cast_nullable_to_non_nullable
              as int,
      transmissionCar: null == transmissionCar
          ? _value.transmissionCar
          : transmissionCar // ignore: cast_nullable_to_non_nullable
              as Transmission,
      imagesCar: null == imagesCar
          ? _value._imagesCar
          : imagesCar // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statusCar: null == statusCar
          ? _value.statusCar
          : statusCar // ignore: cast_nullable_to_non_nullable
              as StatusCar,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarImpl implements _Car {
  const _$CarImpl(
      {this.idCar = '',
      this.idBrand = '',
      this.idOwner = '',
      final List<String> idReview = const [],
      this.nameCar = '',
      this.priceCar = '',
      this.fuelTypeCar = TypeFuel.gasFuel,
      this.colorCar = '',
      this.descriptionCar = '',
      this.kilometersCar = 0,
      this.seatsCar = 0,
      this.transmissionCar = Transmission.manual,
      final List<String> imagesCar = const [],
      this.statusCar = StatusCar.available,
      this.createAt = ''})
      : _idReview = idReview,
        _imagesCar = imagesCar;

  factory _$CarImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarImplFromJson(json);

  @override
  @JsonKey()
  final String idCar;
  @override
  @JsonKey()
  final String idBrand;
  @override
  @JsonKey()
  final String idOwner;
  final List<String> _idReview;
  @override
  @JsonKey()
  List<String> get idReview {
    if (_idReview is EqualUnmodifiableListView) return _idReview;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idReview);
  }

  @override
  @JsonKey()
  final String nameCar;
  @override
  @JsonKey()
  final String priceCar;
  @override
  @JsonKey()
  final TypeFuel fuelTypeCar;
  @override
  @JsonKey()
  final String colorCar;
  @override
  @JsonKey()
  final String descriptionCar;
  @override
  @JsonKey()
  final int kilometersCar;
  @override
  @JsonKey()
  final int seatsCar;
  @override
  @JsonKey()
  final Transmission transmissionCar;
  final List<String> _imagesCar;
  @override
  @JsonKey()
  List<String> get imagesCar {
    if (_imagesCar is EqualUnmodifiableListView) return _imagesCar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesCar);
  }

  @override
  @JsonKey()
  final StatusCar statusCar;
  @override
  @JsonKey()
  final String createAt;

  @override
  String toString() {
    return 'Car(idCar: $idCar, idBrand: $idBrand, idOwner: $idOwner, idReview: $idReview, nameCar: $nameCar, priceCar: $priceCar, fuelTypeCar: $fuelTypeCar, colorCar: $colorCar, descriptionCar: $descriptionCar, kilometersCar: $kilometersCar, seatsCar: $seatsCar, transmissionCar: $transmissionCar, imagesCar: $imagesCar, statusCar: $statusCar, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarImpl &&
            (identical(other.idCar, idCar) || other.idCar == idCar) &&
            (identical(other.idBrand, idBrand) || other.idBrand == idBrand) &&
            (identical(other.idOwner, idOwner) || other.idOwner == idOwner) &&
            const DeepCollectionEquality().equals(other._idReview, _idReview) &&
            (identical(other.nameCar, nameCar) || other.nameCar == nameCar) &&
            (identical(other.priceCar, priceCar) ||
                other.priceCar == priceCar) &&
            (identical(other.fuelTypeCar, fuelTypeCar) ||
                other.fuelTypeCar == fuelTypeCar) &&
            (identical(other.colorCar, colorCar) ||
                other.colorCar == colorCar) &&
            (identical(other.descriptionCar, descriptionCar) ||
                other.descriptionCar == descriptionCar) &&
            (identical(other.kilometersCar, kilometersCar) ||
                other.kilometersCar == kilometersCar) &&
            (identical(other.seatsCar, seatsCar) ||
                other.seatsCar == seatsCar) &&
            (identical(other.transmissionCar, transmissionCar) ||
                other.transmissionCar == transmissionCar) &&
            const DeepCollectionEquality()
                .equals(other._imagesCar, _imagesCar) &&
            (identical(other.statusCar, statusCar) ||
                other.statusCar == statusCar) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idCar,
      idBrand,
      idOwner,
      const DeepCollectionEquality().hash(_idReview),
      nameCar,
      priceCar,
      fuelTypeCar,
      colorCar,
      descriptionCar,
      kilometersCar,
      seatsCar,
      transmissionCar,
      const DeepCollectionEquality().hash(_imagesCar),
      statusCar,
      createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarImplCopyWith<_$CarImpl> get copyWith =>
      __$$CarImplCopyWithImpl<_$CarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarImplToJson(
      this,
    );
  }
}

abstract class _Car implements Car {
  const factory _Car(
      {final String idCar,
      final String idBrand,
      final String idOwner,
      final List<String> idReview,
      final String nameCar,
      final String priceCar,
      final TypeFuel fuelTypeCar,
      final String colorCar,
      final String descriptionCar,
      final int kilometersCar,
      final int seatsCar,
      final Transmission transmissionCar,
      final List<String> imagesCar,
      final StatusCar statusCar,
      final String createAt}) = _$CarImpl;

  factory _Car.fromJson(Map<String, dynamic> json) = _$CarImpl.fromJson;

  @override
  String get idCar;
  @override
  String get idBrand;
  @override
  String get idOwner;
  @override
  List<String> get idReview;
  @override
  String get nameCar;
  @override
  String get priceCar;
  @override
  TypeFuel get fuelTypeCar;
  @override
  String get colorCar;
  @override
  String get descriptionCar;
  @override
  int get kilometersCar;
  @override
  int get seatsCar;
  @override
  Transmission get transmissionCar;
  @override
  List<String> get imagesCar;
  @override
  StatusCar get statusCar;
  @override
  String get createAt;
  @override
  @JsonKey(ignore: true)
  _$$CarImplCopyWith<_$CarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
