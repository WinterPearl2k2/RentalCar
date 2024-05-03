// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  User get user => throw _privateConstructorUsedError;
  StateView get stateView => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get wait => throw _privateConstructorUsedError;
  dynamic get errorName => throw _privateConstructorUsedError;
  dynamic get errorEmail => throw _privateConstructorUsedError;
  dynamic get errorPhone => throw _privateConstructorUsedError;
  dynamic get errorPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {User user,
      StateView stateView,
      bool showPassword,
      bool wait,
      dynamic errorName,
      dynamic errorEmail,
      dynamic errorPhone,
      dynamic errorPassword});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? stateView = null,
    Object? showPassword = null,
    Object? wait = null,
    Object? errorName = freezed,
    Object? errorEmail = freezed,
    Object? errorPhone = freezed,
    Object? errorPassword = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      stateView: null == stateView
          ? _value.stateView
          : stateView // ignore: cast_nullable_to_non_nullable
              as StateView,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      errorName: freezed == errorName
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorEmail: freezed == errorEmail
          ? _value.errorEmail
          : errorEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorPhone: freezed == errorPhone
          ? _value.errorPhone
          : errorPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorPassword: freezed == errorPassword
          ? _value.errorPassword
          : errorPassword // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      StateView stateView,
      bool showPassword,
      bool wait,
      dynamic errorName,
      dynamic errorEmail,
      dynamic errorPhone,
      dynamic errorPassword});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? stateView = null,
    Object? showPassword = null,
    Object? wait = null,
    Object? errorName = freezed,
    Object? errorEmail = freezed,
    Object? errorPhone = freezed,
    Object? errorPassword = freezed,
  }) {
    return _then(_$AuthStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      stateView: null == stateView
          ? _value.stateView
          : stateView // ignore: cast_nullable_to_non_nullable
              as StateView,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      errorName: freezed == errorName ? _value.errorName! : errorName,
      errorEmail: freezed == errorEmail ? _value.errorEmail! : errorEmail,
      errorPhone: freezed == errorPhone ? _value.errorPhone! : errorPhone,
      errorPassword:
          freezed == errorPassword ? _value.errorPassword! : errorPassword,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.user = const User(),
      this.stateView = StateView.signIn,
      this.showPassword = false,
      this.wait = false,
      this.errorName = false,
      this.errorEmail = false,
      this.errorPhone = false,
      this.errorPassword = false});

  @override
  @JsonKey()
  final User user;
  @override
  @JsonKey()
  final StateView stateView;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  @JsonKey()
  final bool wait;
  @override
  @JsonKey()
  final dynamic errorName;
  @override
  @JsonKey()
  final dynamic errorEmail;
  @override
  @JsonKey()
  final dynamic errorPhone;
  @override
  @JsonKey()
  final dynamic errorPassword;

  @override
  String toString() {
    return 'AuthState(user: $user, stateView: $stateView, showPassword: $showPassword, wait: $wait, errorName: $errorName, errorEmail: $errorEmail, errorPhone: $errorPhone, errorPassword: $errorPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.stateView, stateView) ||
                other.stateView == stateView) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.wait, wait) || other.wait == wait) &&
            const DeepCollectionEquality().equals(other.errorName, errorName) &&
            const DeepCollectionEquality()
                .equals(other.errorEmail, errorEmail) &&
            const DeepCollectionEquality()
                .equals(other.errorPhone, errorPhone) &&
            const DeepCollectionEquality()
                .equals(other.errorPassword, errorPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      stateView,
      showPassword,
      wait,
      const DeepCollectionEquality().hash(errorName),
      const DeepCollectionEquality().hash(errorEmail),
      const DeepCollectionEquality().hash(errorPhone),
      const DeepCollectionEquality().hash(errorPassword));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final User user,
      final StateView stateView,
      final bool showPassword,
      final bool wait,
      final dynamic errorName,
      final dynamic errorEmail,
      final dynamic errorPhone,
      final dynamic errorPassword}) = _$AuthStateImpl;

  @override
  User get user;
  @override
  StateView get stateView;
  @override
  bool get showPassword;
  @override
  bool get wait;
  @override
  dynamic get errorName;
  @override
  dynamic get errorEmail;
  @override
  dynamic get errorPhone;
  @override
  dynamic get errorPassword;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
