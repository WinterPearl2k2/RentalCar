// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CarDetailState {
  CarDetailDTO get carDetail => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarDetailStateCopyWith<CarDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarDetailStateCopyWith<$Res> {
  factory $CarDetailStateCopyWith(
          CarDetailState value, $Res Function(CarDetailState) then) =
      _$CarDetailStateCopyWithImpl<$Res, CarDetailState>;
  @useResult
  $Res call({CarDetailDTO carDetail, Status status});

  $CarDetailDTOCopyWith<$Res> get carDetail;
}

/// @nodoc
class _$CarDetailStateCopyWithImpl<$Res, $Val extends CarDetailState>
    implements $CarDetailStateCopyWith<$Res> {
  _$CarDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carDetail = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      carDetail: null == carDetail
          ? _value.carDetail
          : carDetail // ignore: cast_nullable_to_non_nullable
              as CarDetailDTO,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CarDetailDTOCopyWith<$Res> get carDetail {
    return $CarDetailDTOCopyWith<$Res>(_value.carDetail, (value) {
      return _then(_value.copyWith(carDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CarDetailStateImplCopyWith<$Res>
    implements $CarDetailStateCopyWith<$Res> {
  factory _$$CarDetailStateImplCopyWith(_$CarDetailStateImpl value,
          $Res Function(_$CarDetailStateImpl) then) =
      __$$CarDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CarDetailDTO carDetail, Status status});

  @override
  $CarDetailDTOCopyWith<$Res> get carDetail;
}

/// @nodoc
class __$$CarDetailStateImplCopyWithImpl<$Res>
    extends _$CarDetailStateCopyWithImpl<$Res, _$CarDetailStateImpl>
    implements _$$CarDetailStateImplCopyWith<$Res> {
  __$$CarDetailStateImplCopyWithImpl(
      _$CarDetailStateImpl _value, $Res Function(_$CarDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carDetail = null,
    Object? status = null,
  }) {
    return _then(_$CarDetailStateImpl(
      carDetail: null == carDetail
          ? _value.carDetail
          : carDetail // ignore: cast_nullable_to_non_nullable
              as CarDetailDTO,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$CarDetailStateImpl implements _CarDetailState {
  const _$CarDetailStateImpl(
      {this.carDetail = const CarDetailDTO(), this.status = Status.loading});

  @override
  @JsonKey()
  final CarDetailDTO carDetail;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'CarDetailState(carDetail: $carDetail, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarDetailStateImpl &&
            (identical(other.carDetail, carDetail) ||
                other.carDetail == carDetail) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carDetail, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarDetailStateImplCopyWith<_$CarDetailStateImpl> get copyWith =>
      __$$CarDetailStateImplCopyWithImpl<_$CarDetailStateImpl>(
          this, _$identity);
}

abstract class _CarDetailState implements CarDetailState {
  const factory _CarDetailState(
      {final CarDetailDTO carDetail,
      final Status status}) = _$CarDetailStateImpl;

  @override
  CarDetailDTO get carDetail;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$CarDetailStateImplCopyWith<_$CarDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
