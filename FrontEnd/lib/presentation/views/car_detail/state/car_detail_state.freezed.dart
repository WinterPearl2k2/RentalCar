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
  Car get car => throw _privateConstructorUsedError;

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
  $Res call({Car car});

  $CarCopyWith<$Res> get car;
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
    Object? car = null,
  }) {
    return _then(_value.copyWith(
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as Car,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CarCopyWith<$Res> get car {
    return $CarCopyWith<$Res>(_value.car, (value) {
      return _then(_value.copyWith(car: value) as $Val);
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
  $Res call({Car car});

  @override
  $CarCopyWith<$Res> get car;
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
    Object? car = null,
  }) {
    return _then(_$CarDetailStateImpl(
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as Car,
    ));
  }
}

/// @nodoc

class _$CarDetailStateImpl implements _CarDetailState {
  const _$CarDetailStateImpl({this.car = const Car()});

  @override
  @JsonKey()
  final Car car;

  @override
  String toString() {
    return 'CarDetailState(car: $car)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarDetailStateImpl &&
            (identical(other.car, car) || other.car == car));
  }

  @override
  int get hashCode => Object.hash(runtimeType, car);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarDetailStateImplCopyWith<_$CarDetailStateImpl> get copyWith =>
      __$$CarDetailStateImplCopyWithImpl<_$CarDetailStateImpl>(
          this, _$identity);
}

abstract class _CarDetailState implements CarDetailState {
  const factory _CarDetailState({final Car car}) = _$CarDetailStateImpl;

  @override
  Car get car;
  @override
  @JsonKey(ignore: true)
  _$$CarDetailStateImplCopyWith<_$CarDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
