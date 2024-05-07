// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordState {
  dynamic get showNewPassword => throw _privateConstructorUsedError;
  dynamic get showConfirmPassword => throw _privateConstructorUsedError;
  dynamic get errNewPassword => throw _privateConstructorUsedError;
  dynamic get errConfirmPassword => throw _privateConstructorUsedError;
  dynamic get wait => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {dynamic showNewPassword,
      dynamic showConfirmPassword,
      dynamic errNewPassword,
      dynamic errConfirmPassword,
      dynamic wait});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showNewPassword = freezed,
    Object? showConfirmPassword = freezed,
    Object? errNewPassword = freezed,
    Object? errConfirmPassword = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      showNewPassword: freezed == showNewPassword
          ? _value.showNewPassword
          : showNewPassword // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showConfirmPassword: freezed == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errNewPassword: freezed == errNewPassword
          ? _value.errNewPassword
          : errNewPassword // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errConfirmPassword: freezed == errConfirmPassword
          ? _value.errConfirmPassword
          : errConfirmPassword // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordStateImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateImplCopyWith(_$ResetPasswordStateImpl value,
          $Res Function(_$ResetPasswordStateImpl) then) =
      __$$ResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic showNewPassword,
      dynamic showConfirmPassword,
      dynamic errNewPassword,
      dynamic errConfirmPassword,
      dynamic wait});
}

/// @nodoc
class __$$ResetPasswordStateImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateImpl>
    implements _$$ResetPasswordStateImplCopyWith<$Res> {
  __$$ResetPasswordStateImplCopyWithImpl(_$ResetPasswordStateImpl _value,
      $Res Function(_$ResetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showNewPassword = freezed,
    Object? showConfirmPassword = freezed,
    Object? errNewPassword = freezed,
    Object? errConfirmPassword = freezed,
    Object? wait = freezed,
  }) {
    return _then(_$ResetPasswordStateImpl(
      showNewPassword: freezed == showNewPassword
          ? _value.showNewPassword!
          : showNewPassword,
      showConfirmPassword: freezed == showConfirmPassword
          ? _value.showConfirmPassword!
          : showConfirmPassword,
      errNewPassword:
          freezed == errNewPassword ? _value.errNewPassword! : errNewPassword,
      errConfirmPassword: freezed == errConfirmPassword
          ? _value.errConfirmPassword!
          : errConfirmPassword,
      wait: freezed == wait ? _value.wait! : wait,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateImpl implements _ResetPasswordState {
  const _$ResetPasswordStateImpl(
      {this.showNewPassword = false,
      this.showConfirmPassword = false,
      this.errNewPassword = false,
      this.errConfirmPassword = false,
      this.wait = false});

  @override
  @JsonKey()
  final dynamic showNewPassword;
  @override
  @JsonKey()
  final dynamic showConfirmPassword;
  @override
  @JsonKey()
  final dynamic errNewPassword;
  @override
  @JsonKey()
  final dynamic errConfirmPassword;
  @override
  @JsonKey()
  final dynamic wait;

  @override
  String toString() {
    return 'ResetPasswordState(showNewPassword: $showNewPassword, showConfirmPassword: $showConfirmPassword, errNewPassword: $errNewPassword, errConfirmPassword: $errConfirmPassword, wait: $wait)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateImpl &&
            const DeepCollectionEquality()
                .equals(other.showNewPassword, showNewPassword) &&
            const DeepCollectionEquality()
                .equals(other.showConfirmPassword, showConfirmPassword) &&
            const DeepCollectionEquality()
                .equals(other.errNewPassword, errNewPassword) &&
            const DeepCollectionEquality()
                .equals(other.errConfirmPassword, errConfirmPassword) &&
            const DeepCollectionEquality().equals(other.wait, wait));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showNewPassword),
      const DeepCollectionEquality().hash(showConfirmPassword),
      const DeepCollectionEquality().hash(errNewPassword),
      const DeepCollectionEquality().hash(errConfirmPassword),
      const DeepCollectionEquality().hash(wait));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      __$$ResetPasswordStateImplCopyWithImpl<_$ResetPasswordStateImpl>(
          this, _$identity);
}

abstract class _ResetPasswordState implements ResetPasswordState {
  const factory _ResetPasswordState(
      {final dynamic showNewPassword,
      final dynamic showConfirmPassword,
      final dynamic errNewPassword,
      final dynamic errConfirmPassword,
      final dynamic wait}) = _$ResetPasswordStateImpl;

  @override
  dynamic get showNewPassword;
  @override
  dynamic get showConfirmPassword;
  @override
  dynamic get errNewPassword;
  @override
  dynamic get errConfirmPassword;
  @override
  dynamic get wait;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
