// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_car_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCarState {
  AddCarStep get addCarStep => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCarStateCopyWith<AddCarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCarStateCopyWith<$Res> {
  factory $AddCarStateCopyWith(
          AddCarState value, $Res Function(AddCarState) then) =
      _$AddCarStateCopyWithImpl<$Res, AddCarState>;
  @useResult
  $Res call({AddCarStep addCarStep});
}

/// @nodoc
class _$AddCarStateCopyWithImpl<$Res, $Val extends AddCarState>
    implements $AddCarStateCopyWith<$Res> {
  _$AddCarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addCarStep = null,
  }) {
    return _then(_value.copyWith(
      addCarStep: null == addCarStep
          ? _value.addCarStep
          : addCarStep // ignore: cast_nullable_to_non_nullable
              as AddCarStep,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCarStateImplCopyWith<$Res>
    implements $AddCarStateCopyWith<$Res> {
  factory _$$AddCarStateImplCopyWith(
          _$AddCarStateImpl value, $Res Function(_$AddCarStateImpl) then) =
      __$$AddCarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddCarStep addCarStep});
}

/// @nodoc
class __$$AddCarStateImplCopyWithImpl<$Res>
    extends _$AddCarStateCopyWithImpl<$Res, _$AddCarStateImpl>
    implements _$$AddCarStateImplCopyWith<$Res> {
  __$$AddCarStateImplCopyWithImpl(
      _$AddCarStateImpl _value, $Res Function(_$AddCarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addCarStep = null,
  }) {
    return _then(_$AddCarStateImpl(
      addCarStep: null == addCarStep
          ? _value.addCarStep
          : addCarStep // ignore: cast_nullable_to_non_nullable
              as AddCarStep,
    ));
  }
}

/// @nodoc

class _$AddCarStateImpl extends _AddCarState {
  _$AddCarStateImpl({this.addCarStep = AddCarStep.step1}) : super._();

  @override
  @JsonKey()
  final AddCarStep addCarStep;

  @override
  String toString() {
    return 'AddCarState(addCarStep: $addCarStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCarStateImpl &&
            (identical(other.addCarStep, addCarStep) ||
                other.addCarStep == addCarStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addCarStep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCarStateImplCopyWith<_$AddCarStateImpl> get copyWith =>
      __$$AddCarStateImplCopyWithImpl<_$AddCarStateImpl>(this, _$identity);
}

abstract class _AddCarState extends AddCarState {
  factory _AddCarState({final AddCarStep addCarStep}) = _$AddCarStateImpl;
  _AddCarState._() : super._();

  @override
  AddCarStep get addCarStep;
  @override
  @JsonKey(ignore: true)
  _$$AddCarStateImplCopyWith<_$AddCarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
