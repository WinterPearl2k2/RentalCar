// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CarReviewState {
  CarReviewDTO get carReview => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarReviewStateCopyWith<CarReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarReviewStateCopyWith<$Res> {
  factory $CarReviewStateCopyWith(
          CarReviewState value, $Res Function(CarReviewState) then) =
      _$CarReviewStateCopyWithImpl<$Res, CarReviewState>;
  @useResult
  $Res call({CarReviewDTO carReview, Status status});

  $CarReviewDTOCopyWith<$Res> get carReview;
}

/// @nodoc
class _$CarReviewStateCopyWithImpl<$Res, $Val extends CarReviewState>
    implements $CarReviewStateCopyWith<$Res> {
  _$CarReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carReview = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      carReview: null == carReview
          ? _value.carReview
          : carReview // ignore: cast_nullable_to_non_nullable
              as CarReviewDTO,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CarReviewDTOCopyWith<$Res> get carReview {
    return $CarReviewDTOCopyWith<$Res>(_value.carReview, (value) {
      return _then(_value.copyWith(carReview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CarReviewStateImplCopyWith<$Res>
    implements $CarReviewStateCopyWith<$Res> {
  factory _$$CarReviewStateImplCopyWith(_$CarReviewStateImpl value,
          $Res Function(_$CarReviewStateImpl) then) =
      __$$CarReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CarReviewDTO carReview, Status status});

  @override
  $CarReviewDTOCopyWith<$Res> get carReview;
}

/// @nodoc
class __$$CarReviewStateImplCopyWithImpl<$Res>
    extends _$CarReviewStateCopyWithImpl<$Res, _$CarReviewStateImpl>
    implements _$$CarReviewStateImplCopyWith<$Res> {
  __$$CarReviewStateImplCopyWithImpl(
      _$CarReviewStateImpl _value, $Res Function(_$CarReviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carReview = null,
    Object? status = null,
  }) {
    return _then(_$CarReviewStateImpl(
      carReview: null == carReview
          ? _value.carReview
          : carReview // ignore: cast_nullable_to_non_nullable
              as CarReviewDTO,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$CarReviewStateImpl implements _CarReviewState {
  const _$CarReviewStateImpl(
      {this.carReview = const CarReviewDTO(), this.status = Status.loading});

  @override
  @JsonKey()
  final CarReviewDTO carReview;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'CarReviewState(carReview: $carReview, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarReviewStateImpl &&
            (identical(other.carReview, carReview) ||
                other.carReview == carReview) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carReview, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarReviewStateImplCopyWith<_$CarReviewStateImpl> get copyWith =>
      __$$CarReviewStateImplCopyWithImpl<_$CarReviewStateImpl>(
          this, _$identity);
}

abstract class _CarReviewState implements CarReviewState {
  const factory _CarReviewState(
      {final CarReviewDTO carReview,
      final Status status}) = _$CarReviewStateImpl;

  @override
  CarReviewDTO get carReview;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$CarReviewStateImplCopyWith<_$CarReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
