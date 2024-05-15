// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_review_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarReviewDTO _$CarReviewDTOFromJson(Map<String, dynamic> json) {
  return _CarReviewDTO.fromJson(json);
}

/// @nodoc
mixin _$CarReviewDTO {
  String get idCar => throw _privateConstructorUsedError;
  double get rateReview => throw _privateConstructorUsedError;
  String get commentReview => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarReviewDTOCopyWith<CarReviewDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarReviewDTOCopyWith<$Res> {
  factory $CarReviewDTOCopyWith(
          CarReviewDTO value, $Res Function(CarReviewDTO) then) =
      _$CarReviewDTOCopyWithImpl<$Res, CarReviewDTO>;
  @useResult
  $Res call({String idCar, double rateReview, String commentReview});
}

/// @nodoc
class _$CarReviewDTOCopyWithImpl<$Res, $Val extends CarReviewDTO>
    implements $CarReviewDTOCopyWith<$Res> {
  _$CarReviewDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? rateReview = null,
    Object? commentReview = null,
  }) {
    return _then(_value.copyWith(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      rateReview: null == rateReview
          ? _value.rateReview
          : rateReview // ignore: cast_nullable_to_non_nullable
              as double,
      commentReview: null == commentReview
          ? _value.commentReview
          : commentReview // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarReviewDTOImplCopyWith<$Res>
    implements $CarReviewDTOCopyWith<$Res> {
  factory _$$CarReviewDTOImplCopyWith(
          _$CarReviewDTOImpl value, $Res Function(_$CarReviewDTOImpl) then) =
      __$$CarReviewDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idCar, double rateReview, String commentReview});
}

/// @nodoc
class __$$CarReviewDTOImplCopyWithImpl<$Res>
    extends _$CarReviewDTOCopyWithImpl<$Res, _$CarReviewDTOImpl>
    implements _$$CarReviewDTOImplCopyWith<$Res> {
  __$$CarReviewDTOImplCopyWithImpl(
      _$CarReviewDTOImpl _value, $Res Function(_$CarReviewDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCar = null,
    Object? rateReview = null,
    Object? commentReview = null,
  }) {
    return _then(_$CarReviewDTOImpl(
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      rateReview: null == rateReview
          ? _value.rateReview
          : rateReview // ignore: cast_nullable_to_non_nullable
              as double,
      commentReview: null == commentReview
          ? _value.commentReview
          : commentReview // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarReviewDTOImpl implements _CarReviewDTO {
  const _$CarReviewDTOImpl(
      {this.idCar = '', this.rateReview = 3.0, this.commentReview = ''});

  factory _$CarReviewDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarReviewDTOImplFromJson(json);

  @override
  @JsonKey()
  final String idCar;
  @override
  @JsonKey()
  final double rateReview;
  @override
  @JsonKey()
  final String commentReview;

  @override
  String toString() {
    return 'CarReviewDTO(idCar: $idCar, rateReview: $rateReview, commentReview: $commentReview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarReviewDTOImpl &&
            (identical(other.idCar, idCar) || other.idCar == idCar) &&
            (identical(other.rateReview, rateReview) ||
                other.rateReview == rateReview) &&
            (identical(other.commentReview, commentReview) ||
                other.commentReview == commentReview));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idCar, rateReview, commentReview);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarReviewDTOImplCopyWith<_$CarReviewDTOImpl> get copyWith =>
      __$$CarReviewDTOImplCopyWithImpl<_$CarReviewDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarReviewDTOImplToJson(
      this,
    );
  }
}

abstract class _CarReviewDTO implements CarReviewDTO {
  const factory _CarReviewDTO(
      {final String idCar,
      final double rateReview,
      final String commentReview}) = _$CarReviewDTOImpl;

  factory _CarReviewDTO.fromJson(Map<String, dynamic> json) =
      _$CarReviewDTOImpl.fromJson;

  @override
  String get idCar;
  @override
  double get rateReview;
  @override
  String get commentReview;
  @override
  @JsonKey(ignore: true)
  _$$CarReviewDTOImplCopyWith<_$CarReviewDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
