// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_car_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopCarDTO _$TopCarDTOFromJson(Map<String, dynamic> json) {
  return _TopCarDTO.fromJson(json);
}

/// @nodoc
mixin _$TopCarDTO {
  String get idCar => throw _privateConstructorUsedError;
  String get imagesCar => throw _privateConstructorUsedError;
  String get nameCar => throw _privateConstructorUsedError;
  double get priceCar => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopCarDTOCopyWith<TopCarDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopCarDTOCopyWith<$Res> {
  factory $TopCarDTOCopyWith(TopCarDTO value, $Res Function(TopCarDTO) then) =
      _$TopCarDTOCopyWithImpl<$Res, TopCarDTO>;
  @useResult
  $Res call(
      {String idCar,
      String imagesCar,
      String nameCar,
      double priceCar,
      double averageRating,
      int reviewCount});
}

/// @nodoc
class _$TopCarDTOCopyWithImpl<$Res, $Val extends TopCarDTO>
    implements $TopCarDTOCopyWith<$Res> {
  _$TopCarDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? imagesCar = null,
    Object? nameCar = null,
    Object? priceCar = null,
    Object? averageRating = null,
    Object? reviewCount = null,
  }) {
    return _then(_value.copyWith(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      imagesCar: null == imagesCar
          ? _value.imagesCar
          : imagesCar // ignore: cast_nullable_to_non_nullable
              as String,
      nameCar: null == nameCar
          ? _value.nameCar
          : nameCar // ignore: cast_nullable_to_non_nullable
              as String,
      priceCar: null == priceCar
          ? _value.priceCar
          : priceCar // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopCarDTOImplCopyWith<$Res>
    implements $TopCarDTOCopyWith<$Res> {
  factory _$$TopCarDTOImplCopyWith(
          _$TopCarDTOImpl value, $Res Function(_$TopCarDTOImpl) then) =
      __$$TopCarDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idCar,
      String imagesCar,
      String nameCar,
      double priceCar,
      double averageRating,
      int reviewCount});
}

/// @nodoc
class __$$TopCarDTOImplCopyWithImpl<$Res>
    extends _$TopCarDTOCopyWithImpl<$Res, _$TopCarDTOImpl>
    implements _$$TopCarDTOImplCopyWith<$Res> {
  __$$TopCarDTOImplCopyWithImpl(
      _$TopCarDTOImpl _value, $Res Function(_$TopCarDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? imagesCar = null,
    Object? nameCar = null,
    Object? priceCar = null,
    Object? averageRating = null,
    Object? reviewCount = null,
  }) {
    return _then(_$TopCarDTOImpl(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      imagesCar: null == imagesCar
          ? _value.imagesCar
          : imagesCar // ignore: cast_nullable_to_non_nullable
              as String,
      nameCar: null == nameCar
          ? _value.nameCar
          : nameCar // ignore: cast_nullable_to_non_nullable
              as String,
      priceCar: null == priceCar
          ? _value.priceCar
          : priceCar // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopCarDTOImpl implements _TopCarDTO {
  const _$TopCarDTOImpl(
      {this.idCar = '',
      this.imagesCar = '',
      this.nameCar = '',
      this.priceCar = 0,
      this.averageRating = 0,
      this.reviewCount = 0});

  factory _$TopCarDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopCarDTOImplFromJson(json);

  @override
  @JsonKey()
  final String idCar;
  @override
  @JsonKey()
  final String imagesCar;
  @override
  @JsonKey()
  final String nameCar;
  @override
  @JsonKey()
  final double priceCar;
  @override
  @JsonKey()
  final double averageRating;
  @override
  @JsonKey()
  final int reviewCount;

  @override
  String toString() {
    return 'TopCarDTO(idCar: $idCar, imagesCar: $imagesCar, nameCar: $nameCar, priceCar: $priceCar, averageRating: $averageRating, reviewCount: $reviewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopCarDTOImpl &&
            (identical(other.idCar, idCar) || other.idCar == idCar) &&
            (identical(other.imagesCar, imagesCar) ||
                other.imagesCar == imagesCar) &&
            (identical(other.nameCar, nameCar) || other.nameCar == nameCar) &&
            (identical(other.priceCar, priceCar) ||
                other.priceCar == priceCar) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idCar, imagesCar, nameCar,
      priceCar, averageRating, reviewCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopCarDTOImplCopyWith<_$TopCarDTOImpl> get copyWith =>
      __$$TopCarDTOImplCopyWithImpl<_$TopCarDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopCarDTOImplToJson(
      this,
    );
  }
}

abstract class _TopCarDTO implements TopCarDTO {
  const factory _TopCarDTO(
      {final String idCar,
      final String imagesCar,
      final String nameCar,
      final double priceCar,
      final double averageRating,
      final int reviewCount}) = _$TopCarDTOImpl;

  factory _TopCarDTO.fromJson(Map<String, dynamic> json) =
      _$TopCarDTOImpl.fromJson;

  @override
  String get idCar;
  @override
  String get imagesCar;
  @override
  String get nameCar;
  @override
  double get priceCar;
  @override
  double get averageRating;
  @override
  int get reviewCount;
  @override
  @JsonKey(ignore: true)
  _$$TopCarDTOImplCopyWith<_$TopCarDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
