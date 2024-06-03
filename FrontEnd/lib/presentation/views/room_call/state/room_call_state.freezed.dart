// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_call_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomCallState {
  Stream<dynamic> get stream => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomCallStateCopyWith<RoomCallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCallStateCopyWith<$Res> {
  factory $RoomCallStateCopyWith(
          RoomCallState value, $Res Function(RoomCallState) then) =
      _$RoomCallStateCopyWithImpl<$Res, RoomCallState>;
  @useResult
  $Res call({Stream<dynamic> stream});
}

/// @nodoc
class _$RoomCallStateCopyWithImpl<$Res, $Val extends RoomCallState>
    implements $RoomCallStateCopyWith<$Res> {
  _$RoomCallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stream = null,
  }) {
    return _then(_value.copyWith(
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomCallStateImplCopyWith<$Res>
    implements $RoomCallStateCopyWith<$Res> {
  factory _$$RoomCallStateImplCopyWith(
          _$RoomCallStateImpl value, $Res Function(_$RoomCallStateImpl) then) =
      __$$RoomCallStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Stream<dynamic> stream});
}

/// @nodoc
class __$$RoomCallStateImplCopyWithImpl<$Res>
    extends _$RoomCallStateCopyWithImpl<$Res, _$RoomCallStateImpl>
    implements _$$RoomCallStateImplCopyWith<$Res> {
  __$$RoomCallStateImplCopyWithImpl(
      _$RoomCallStateImpl _value, $Res Function(_$RoomCallStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stream = null,
  }) {
    return _then(_$RoomCallStateImpl(
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<dynamic>,
    ));
  }
}

/// @nodoc

class _$RoomCallStateImpl implements _RoomCallState {
  const _$RoomCallStateImpl({this.stream = const Stream.empty()});

  @override
  @JsonKey()
  final Stream<dynamic> stream;

  @override
  String toString() {
    return 'RoomCallState(stream: $stream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCallStateImpl &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomCallStateImplCopyWith<_$RoomCallStateImpl> get copyWith =>
      __$$RoomCallStateImplCopyWithImpl<_$RoomCallStateImpl>(this, _$identity);
}

abstract class _RoomCallState implements RoomCallState {
  const factory _RoomCallState({final Stream<dynamic> stream}) =
      _$RoomCallStateImpl;

  @override
  Stream<dynamic> get stream;
  @override
  @JsonKey(ignore: true)
  _$$RoomCallStateImplCopyWith<_$RoomCallStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
