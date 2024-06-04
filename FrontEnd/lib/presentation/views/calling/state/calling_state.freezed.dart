// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calling_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CallingState {
  String get newMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallingStateCopyWith<CallingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallingStateCopyWith<$Res> {
  factory $CallingStateCopyWith(
          CallingState value, $Res Function(CallingState) then) =
      _$CallingStateCopyWithImpl<$Res, CallingState>;
  @useResult
  $Res call({String newMessage});
}

/// @nodoc
class _$CallingStateCopyWithImpl<$Res, $Val extends CallingState>
    implements $CallingStateCopyWith<$Res> {
  _$CallingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMessage = null,
  }) {
    return _then(_value.copyWith(
      newMessage: null == newMessage
          ? _value.newMessage
          : newMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallingStateImplCopyWith<$Res>
    implements $CallingStateCopyWith<$Res> {
  factory _$$CallingStateImplCopyWith(
          _$CallingStateImpl value, $Res Function(_$CallingStateImpl) then) =
      __$$CallingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newMessage});
}

/// @nodoc
class __$$CallingStateImplCopyWithImpl<$Res>
    extends _$CallingStateCopyWithImpl<$Res, _$CallingStateImpl>
    implements _$$CallingStateImplCopyWith<$Res> {
  __$$CallingStateImplCopyWithImpl(
      _$CallingStateImpl _value, $Res Function(_$CallingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMessage = null,
  }) {
    return _then(_$CallingStateImpl(
      newMessage: null == newMessage
          ? _value.newMessage
          : newMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CallingStateImpl implements _CallingState {
  const _$CallingStateImpl({this.newMessage = ''});

  @override
  @JsonKey()
  final String newMessage;

  @override
  String toString() {
    return 'CallingState(newMessage: $newMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallingStateImpl &&
            (identical(other.newMessage, newMessage) ||
                other.newMessage == newMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallingStateImplCopyWith<_$CallingStateImpl> get copyWith =>
      __$$CallingStateImplCopyWithImpl<_$CallingStateImpl>(this, _$identity);
}

abstract class _CallingState implements CallingState {
  const factory _CallingState({final String newMessage}) = _$CallingStateImpl;

  @override
  String get newMessage;
  @override
  @JsonKey(ignore: true)
  _$$CallingStateImplCopyWith<_$CallingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
