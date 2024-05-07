// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyCodeState {
  bool get errorEmail => throw _privateConstructorUsedError;
  bool get wait => throw _privateConstructorUsedError;
  bool get isResend => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  bool get clearText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyCodeStateCopyWith<VerifyCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyCodeStateCopyWith<$Res> {
  factory $VerifyCodeStateCopyWith(
          VerifyCodeState value, $Res Function(VerifyCodeState) then) =
      _$VerifyCodeStateCopyWithImpl<$Res, VerifyCodeState>;
  @useResult
  $Res call(
      {bool errorEmail, bool wait, bool isResend, String code, bool clearText});
}

/// @nodoc
class _$VerifyCodeStateCopyWithImpl<$Res, $Val extends VerifyCodeState>
    implements $VerifyCodeStateCopyWith<$Res> {
  _$VerifyCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorEmail = null,
    Object? wait = null,
    Object? isResend = null,
    Object? code = null,
    Object? clearText = null,
  }) {
    return _then(_value.copyWith(
      errorEmail: null == errorEmail
          ? _value.errorEmail
          : errorEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      isResend: null == isResend
          ? _value.isResend
          : isResend // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      clearText: null == clearText
          ? _value.clearText
          : clearText // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyCodeStateImplCopyWith<$Res>
    implements $VerifyCodeStateCopyWith<$Res> {
  factory _$$VerifyCodeStateImplCopyWith(_$VerifyCodeStateImpl value,
          $Res Function(_$VerifyCodeStateImpl) then) =
      __$$VerifyCodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool errorEmail, bool wait, bool isResend, String code, bool clearText});
}

/// @nodoc
class __$$VerifyCodeStateImplCopyWithImpl<$Res>
    extends _$VerifyCodeStateCopyWithImpl<$Res, _$VerifyCodeStateImpl>
    implements _$$VerifyCodeStateImplCopyWith<$Res> {
  __$$VerifyCodeStateImplCopyWithImpl(
      _$VerifyCodeStateImpl _value, $Res Function(_$VerifyCodeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorEmail = null,
    Object? wait = null,
    Object? isResend = null,
    Object? code = null,
    Object? clearText = null,
  }) {
    return _then(_$VerifyCodeStateImpl(
      errorEmail: null == errorEmail
          ? _value.errorEmail
          : errorEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      isResend: null == isResend
          ? _value.isResend
          : isResend // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      clearText: null == clearText
          ? _value.clearText
          : clearText // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VerifyCodeStateImpl implements _VerifyCodeState {
  const _$VerifyCodeStateImpl(
      {this.errorEmail = false,
      this.wait = false,
      this.isResend = false,
      this.code = '',
      this.clearText = false});

  @override
  @JsonKey()
  final bool errorEmail;
  @override
  @JsonKey()
  final bool wait;
  @override
  @JsonKey()
  final bool isResend;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final bool clearText;

  @override
  String toString() {
    return 'VerifyCodeState(errorEmail: $errorEmail, wait: $wait, isResend: $isResend, code: $code, clearText: $clearText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeStateImpl &&
            (identical(other.errorEmail, errorEmail) ||
                other.errorEmail == errorEmail) &&
            (identical(other.wait, wait) || other.wait == wait) &&
            (identical(other.isResend, isResend) ||
                other.isResend == isResend) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.clearText, clearText) ||
                other.clearText == clearText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, errorEmail, wait, isResend, code, clearText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeStateImplCopyWith<_$VerifyCodeStateImpl> get copyWith =>
      __$$VerifyCodeStateImplCopyWithImpl<_$VerifyCodeStateImpl>(
          this, _$identity);
}

abstract class _VerifyCodeState implements VerifyCodeState {
  const factory _VerifyCodeState(
      {final bool errorEmail,
      final bool wait,
      final bool isResend,
      final String code,
      final bool clearText}) = _$VerifyCodeStateImpl;

  @override
  bool get errorEmail;
  @override
  bool get wait;
  @override
  bool get isResend;
  @override
  String get code;
  @override
  bool get clearText;
  @override
  @JsonKey(ignore: true)
  _$$VerifyCodeStateImplCopyWith<_$VerifyCodeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
