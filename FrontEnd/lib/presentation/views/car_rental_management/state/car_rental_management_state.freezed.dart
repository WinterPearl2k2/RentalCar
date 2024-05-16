// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_rental_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CarRentalManagementState {
  List<UserCarRentalDto> get user => throw _privateConstructorUsedError;
  bool get wait => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarRentalManagementStateCopyWith<CarRentalManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarRentalManagementStateCopyWith<$Res> {
  factory $CarRentalManagementStateCopyWith(CarRentalManagementState value,
          $Res Function(CarRentalManagementState) then) =
      _$CarRentalManagementStateCopyWithImpl<$Res, CarRentalManagementState>;
  @useResult
  $Res call({List<UserCarRentalDto> user, bool wait});
}

/// @nodoc
class _$CarRentalManagementStateCopyWithImpl<$Res,
        $Val extends CarRentalManagementState>
    implements $CarRentalManagementStateCopyWith<$Res> {
  _$CarRentalManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? wait = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as List<UserCarRentalDto>,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarRentalManagementStateImplCopyWith<$Res>
    implements $CarRentalManagementStateCopyWith<$Res> {
  factory _$$CarRentalManagementStateImplCopyWith(
          _$CarRentalManagementStateImpl value,
          $Res Function(_$CarRentalManagementStateImpl) then) =
      __$$CarRentalManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserCarRentalDto> user, bool wait});
}

/// @nodoc
class __$$CarRentalManagementStateImplCopyWithImpl<$Res>
    extends _$CarRentalManagementStateCopyWithImpl<$Res,
        _$CarRentalManagementStateImpl>
    implements _$$CarRentalManagementStateImplCopyWith<$Res> {
  __$$CarRentalManagementStateImplCopyWithImpl(
      _$CarRentalManagementStateImpl _value,
      $Res Function(_$CarRentalManagementStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? wait = null,
  }) {
    return _then(_$CarRentalManagementStateImpl(
      user: null == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as List<UserCarRentalDto>,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CarRentalManagementStateImpl implements _CarRentalManagementState {
  const _$CarRentalManagementStateImpl(
      {final List<UserCarRentalDto> user = const [], this.wait = false})
      : _user = user;

  final List<UserCarRentalDto> _user;
  @override
  @JsonKey()
  List<UserCarRentalDto> get user {
    if (_user is EqualUnmodifiableListView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_user);
  }

  @override
  @JsonKey()
  final bool wait;

  @override
  String toString() {
    return 'CarRentalManagementState(user: $user, wait: $wait)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarRentalManagementStateImpl &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            (identical(other.wait, wait) || other.wait == wait));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_user), wait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarRentalManagementStateImplCopyWith<_$CarRentalManagementStateImpl>
      get copyWith => __$$CarRentalManagementStateImplCopyWithImpl<
          _$CarRentalManagementStateImpl>(this, _$identity);
}

abstract class _CarRentalManagementState implements CarRentalManagementState {
  const factory _CarRentalManagementState(
      {final List<UserCarRentalDto> user,
      final bool wait}) = _$CarRentalManagementStateImpl;

  @override
  List<UserCarRentalDto> get user;
  @override
  bool get wait;
  @override
  @JsonKey(ignore: true)
  _$$CarRentalManagementStateImplCopyWith<_$CarRentalManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
