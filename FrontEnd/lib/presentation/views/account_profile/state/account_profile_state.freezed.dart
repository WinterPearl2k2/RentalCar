// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountProfileState {
  bool get wait => throw _privateConstructorUsedError;
  bool get errorName => throw _privateConstructorUsedError;
  bool get errorEmail => throw _privateConstructorUsedError;
  bool get errorPhone => throw _privateConstructorUsedError;
  UserProfileDTO get user => throw _privateConstructorUsedError;
  dynamic get blockButton => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountProfileStateCopyWith<AccountProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountProfileStateCopyWith<$Res> {
  factory $AccountProfileStateCopyWith(
          AccountProfileState value, $Res Function(AccountProfileState) then) =
      _$AccountProfileStateCopyWithImpl<$Res, AccountProfileState>;
  @useResult
  $Res call(
      {bool wait,
      bool errorName,
      bool errorEmail,
      bool errorPhone,
      UserProfileDTO user,
      dynamic blockButton});

  $UserProfileDTOCopyWith<$Res> get user;
}

/// @nodoc
class _$AccountProfileStateCopyWithImpl<$Res, $Val extends AccountProfileState>
    implements $AccountProfileStateCopyWith<$Res> {
  _$AccountProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wait = null,
    Object? errorName = null,
    Object? errorEmail = null,
    Object? errorPhone = null,
    Object? user = null,
    Object? blockButton = freezed,
  }) {
    return _then(_value.copyWith(
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      errorName: null == errorName
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as bool,
      errorEmail: null == errorEmail
          ? _value.errorEmail
          : errorEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      errorPhone: null == errorPhone
          ? _value.errorPhone
          : errorPhone // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileDTO,
      blockButton: freezed == blockButton
          ? _value.blockButton
          : blockButton // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileDTOCopyWith<$Res> get user {
    return $UserProfileDTOCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountProfileStateImplCopyWith<$Res>
    implements $AccountProfileStateCopyWith<$Res> {
  factory _$$AccountProfileStateImplCopyWith(_$AccountProfileStateImpl value,
          $Res Function(_$AccountProfileStateImpl) then) =
      __$$AccountProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool wait,
      bool errorName,
      bool errorEmail,
      bool errorPhone,
      UserProfileDTO user,
      dynamic blockButton});

  @override
  $UserProfileDTOCopyWith<$Res> get user;
}

/// @nodoc
class __$$AccountProfileStateImplCopyWithImpl<$Res>
    extends _$AccountProfileStateCopyWithImpl<$Res, _$AccountProfileStateImpl>
    implements _$$AccountProfileStateImplCopyWith<$Res> {
  __$$AccountProfileStateImplCopyWithImpl(_$AccountProfileStateImpl _value,
      $Res Function(_$AccountProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wait = null,
    Object? errorName = null,
    Object? errorEmail = null,
    Object? errorPhone = null,
    Object? user = null,
    Object? blockButton = freezed,
  }) {
    return _then(_$AccountProfileStateImpl(
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      errorName: null == errorName
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as bool,
      errorEmail: null == errorEmail
          ? _value.errorEmail
          : errorEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      errorPhone: null == errorPhone
          ? _value.errorPhone
          : errorPhone // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileDTO,
      blockButton: freezed == blockButton ? _value.blockButton! : blockButton,
    ));
  }
}

/// @nodoc

class _$AccountProfileStateImpl implements _AccountProfileState {
  const _$AccountProfileStateImpl(
      {this.wait = false,
      this.errorName = false,
      this.errorEmail = false,
      this.errorPhone = false,
      this.user = const UserProfileDTO(),
      this.blockButton = false});

  @override
  @JsonKey()
  final bool wait;
  @override
  @JsonKey()
  final bool errorName;
  @override
  @JsonKey()
  final bool errorEmail;
  @override
  @JsonKey()
  final bool errorPhone;
  @override
  @JsonKey()
  final UserProfileDTO user;
  @override
  @JsonKey()
  final dynamic blockButton;

  @override
  String toString() {
    return 'AccountProfileState(wait: $wait, errorName: $errorName, errorEmail: $errorEmail, errorPhone: $errorPhone, user: $user, blockButton: $blockButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountProfileStateImpl &&
            (identical(other.wait, wait) || other.wait == wait) &&
            (identical(other.errorName, errorName) ||
                other.errorName == errorName) &&
            (identical(other.errorEmail, errorEmail) ||
                other.errorEmail == errorEmail) &&
            (identical(other.errorPhone, errorPhone) ||
                other.errorPhone == errorPhone) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other.blockButton, blockButton));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wait, errorName, errorEmail,
      errorPhone, user, const DeepCollectionEquality().hash(blockButton));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountProfileStateImplCopyWith<_$AccountProfileStateImpl> get copyWith =>
      __$$AccountProfileStateImplCopyWithImpl<_$AccountProfileStateImpl>(
          this, _$identity);
}

abstract class _AccountProfileState implements AccountProfileState {
  const factory _AccountProfileState(
      {final bool wait,
      final bool errorName,
      final bool errorEmail,
      final bool errorPhone,
      final UserProfileDTO user,
      final dynamic blockButton}) = _$AccountProfileStateImpl;

  @override
  bool get wait;
  @override
  bool get errorName;
  @override
  bool get errorEmail;
  @override
  bool get errorPhone;
  @override
  UserProfileDTO get user;
  @override
  dynamic get blockButton;
  @override
  @JsonKey(ignore: true)
  _$$AccountProfileStateImplCopyWith<_$AccountProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
