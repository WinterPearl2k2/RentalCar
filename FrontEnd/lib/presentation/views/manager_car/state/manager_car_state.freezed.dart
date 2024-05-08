// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_car_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManagerCarState {
  List<Car> get listCarUser => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagerCarStateCopyWith<ManagerCarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerCarStateCopyWith<$Res> {
  factory $ManagerCarStateCopyWith(
          ManagerCarState value, $Res Function(ManagerCarState) then) =
      _$ManagerCarStateCopyWithImpl<$Res, ManagerCarState>;
  @useResult
  $Res call({List<Car> listCarUser, Status status});
}

/// @nodoc
class _$ManagerCarStateCopyWithImpl<$Res, $Val extends ManagerCarState>
    implements $ManagerCarStateCopyWith<$Res> {
  _$ManagerCarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listCarUser = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      listCarUser: null == listCarUser
          ? _value.listCarUser
          : listCarUser // ignore: cast_nullable_to_non_nullable
              as List<Car>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManagerCarStateImplCopyWith<$Res>
    implements $ManagerCarStateCopyWith<$Res> {
  factory _$$ManagerCarStateImplCopyWith(_$ManagerCarStateImpl value,
          $Res Function(_$ManagerCarStateImpl) then) =
      __$$ManagerCarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Car> listCarUser, Status status});
}

/// @nodoc
class __$$ManagerCarStateImplCopyWithImpl<$Res>
    extends _$ManagerCarStateCopyWithImpl<$Res, _$ManagerCarStateImpl>
    implements _$$ManagerCarStateImplCopyWith<$Res> {
  __$$ManagerCarStateImplCopyWithImpl(
      _$ManagerCarStateImpl _value, $Res Function(_$ManagerCarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listCarUser = null,
    Object? status = null,
  }) {
    return _then(_$ManagerCarStateImpl(
      listCarUser: null == listCarUser
          ? _value._listCarUser
          : listCarUser // ignore: cast_nullable_to_non_nullable
              as List<Car>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$ManagerCarStateImpl implements _ManagerCarState {
  const _$ManagerCarStateImpl(
      {final List<Car> listCarUser = const [], this.status = Status.loading})
      : _listCarUser = listCarUser;

  final List<Car> _listCarUser;
  @override
  @JsonKey()
  List<Car> get listCarUser {
    if (_listCarUser is EqualUnmodifiableListView) return _listCarUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCarUser);
  }

  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'ManagerCarState(listCarUser: $listCarUser, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagerCarStateImpl &&
            const DeepCollectionEquality()
                .equals(other._listCarUser, _listCarUser) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listCarUser), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagerCarStateImplCopyWith<_$ManagerCarStateImpl> get copyWith =>
      __$$ManagerCarStateImplCopyWithImpl<_$ManagerCarStateImpl>(
          this, _$identity);
}

abstract class _ManagerCarState implements ManagerCarState {
  const factory _ManagerCarState(
      {final List<Car> listCarUser,
      final Status status}) = _$ManagerCarStateImpl;

  @override
  List<Car> get listCarUser;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$ManagerCarStateImplCopyWith<_$ManagerCarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
