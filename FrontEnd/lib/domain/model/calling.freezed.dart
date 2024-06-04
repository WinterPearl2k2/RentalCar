// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calling.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Calling _$CallingFromJson(Map<String, dynamic> json) {
  return _Calling.fromJson(json);
}

/// @nodoc
mixin _$Calling {
  String get keyRoom => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get mainUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallingCopyWith<Calling> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallingCopyWith<$Res> {
  factory $CallingCopyWith(Calling value, $Res Function(Calling) then) =
      _$CallingCopyWithImpl<$Res, Calling>;
  @useResult
  $Res call({String keyRoom, String userName, String mainUser});
}

/// @nodoc
class _$CallingCopyWithImpl<$Res, $Val extends Calling>
    implements $CallingCopyWith<$Res> {
  _$CallingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyRoom = null,
    Object? userName = null,
    Object? mainUser = null,
  }) {
    return _then(_value.copyWith(
      keyRoom: null == keyRoom
          ? _value.keyRoom
          : keyRoom // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      mainUser: null == mainUser
          ? _value.mainUser
          : mainUser // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallingImplCopyWith<$Res> implements $CallingCopyWith<$Res> {
  factory _$$CallingImplCopyWith(
          _$CallingImpl value, $Res Function(_$CallingImpl) then) =
      __$$CallingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String keyRoom, String userName, String mainUser});
}

/// @nodoc
class __$$CallingImplCopyWithImpl<$Res>
    extends _$CallingCopyWithImpl<$Res, _$CallingImpl>
    implements _$$CallingImplCopyWith<$Res> {
  __$$CallingImplCopyWithImpl(
      _$CallingImpl _value, $Res Function(_$CallingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyRoom = null,
    Object? userName = null,
    Object? mainUser = null,
  }) {
    return _then(_$CallingImpl(
      keyRoom: null == keyRoom
          ? _value.keyRoom
          : keyRoom // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      mainUser: null == mainUser
          ? _value.mainUser
          : mainUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallingImpl implements _Calling {
  const _$CallingImpl(
      {this.keyRoom = '', this.userName = '', this.mainUser = ''});

  factory _$CallingImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallingImplFromJson(json);

  @override
  @JsonKey()
  final String keyRoom;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String mainUser;

  @override
  String toString() {
    return 'Calling(keyRoom: $keyRoom, userName: $userName, mainUser: $mainUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallingImpl &&
            (identical(other.keyRoom, keyRoom) || other.keyRoom == keyRoom) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.mainUser, mainUser) ||
                other.mainUser == mainUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, keyRoom, userName, mainUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallingImplCopyWith<_$CallingImpl> get copyWith =>
      __$$CallingImplCopyWithImpl<_$CallingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallingImplToJson(
      this,
    );
  }
}

abstract class _Calling implements Calling {
  const factory _Calling(
      {final String keyRoom,
      final String userName,
      final String mainUser}) = _$CallingImpl;

  factory _Calling.fromJson(Map<String, dynamic> json) = _$CallingImpl.fromJson;

  @override
  String get keyRoom;
  @override
  String get userName;
  @override
  String get mainUser;
  @override
  @JsonKey(ignore: true)
  _$$CallingImplCopyWith<_$CallingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
