// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarOwner _$CarOwnerFromJson(Map<String, dynamic> json) {
  return _CarOwner.fromJson(json);
}

/// @nodoc
mixin _$CarOwner {
  String get idOwner => throw _privateConstructorUsedError;
  String get idCar => throw _privateConstructorUsedError;
  String get idUser => throw _privateConstructorUsedError;
  String get addressOwner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarOwnerCopyWith<CarOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarOwnerCopyWith<$Res> {
  factory $CarOwnerCopyWith(CarOwner value, $Res Function(CarOwner) then) =
      _$CarOwnerCopyWithImpl<$Res, CarOwner>;
  @useResult
  $Res call({String idOwner, String idCar, String idUser, String addressOwner});
}

/// @nodoc
class _$CarOwnerCopyWithImpl<$Res, $Val extends CarOwner>
    implements $CarOwnerCopyWith<$Res> {
  _$CarOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOwner = null,
    Object? idCar = null,
    Object? idUser = null,
    Object? addressOwner = null,
  }) {
    return _then(_value.copyWith(
      idOwner: null == idOwner
          ? _value.idOwner
          : idOwner // ignore: cast_nullable_to_non_nullable
              as String,
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      addressOwner: null == addressOwner
          ? _value.addressOwner
          : addressOwner // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarOwnerImplCopyWith<$Res>
    implements $CarOwnerCopyWith<$Res> {
  factory _$$CarOwnerImplCopyWith(
          _$CarOwnerImpl value, $Res Function(_$CarOwnerImpl) then) =
      __$$CarOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idOwner, String idCar, String idUser, String addressOwner});
}

/// @nodoc
class __$$CarOwnerImplCopyWithImpl<$Res>
    extends _$CarOwnerCopyWithImpl<$Res, _$CarOwnerImpl>
    implements _$$CarOwnerImplCopyWith<$Res> {
  __$$CarOwnerImplCopyWithImpl(
      _$CarOwnerImpl _value, $Res Function(_$CarOwnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOwner = null,
    Object? idCar = null,
    Object? idUser = null,
    Object? addressOwner = null,
  }) {
    return _then(_$CarOwnerImpl(
      idOwner: null == idOwner
          ? _value.idOwner
          : idOwner // ignore: cast_nullable_to_non_nullable
              as String,
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      addressOwner: null == addressOwner
          ? _value.addressOwner
          : addressOwner // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarOwnerImpl implements _CarOwner {
  const _$CarOwnerImpl(
      {this.idOwner = '',
      this.idCar = '',
      this.idUser = '',
      this.addressOwner = ''});

  factory _$CarOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarOwnerImplFromJson(json);

  @override
  @JsonKey()
  final String idOwner;
  @override
  @JsonKey()
  final String idCar;
  @override
  @JsonKey()
  final String idUser;
  @override
  @JsonKey()
  final String addressOwner;

  @override
  String toString() {
    return 'CarOwner(idOwner: $idOwner, idCar: $idCar, idUser: $idUser, addressOwner: $addressOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarOwnerImpl &&
            (identical(other.idOwner, idOwner) || other.idOwner == idOwner) &&
            (identical(other.idCar, idCar) || other.idCar == idCar) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.addressOwner, addressOwner) ||
                other.addressOwner == addressOwner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idOwner, idCar, idUser, addressOwner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarOwnerImplCopyWith<_$CarOwnerImpl> get copyWith =>
      __$$CarOwnerImplCopyWithImpl<_$CarOwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarOwnerImplToJson(
      this,
    );
  }
}

abstract class _CarOwner implements CarOwner {
  const factory _CarOwner(
      {final String idOwner,
      final String idCar,
      final String idUser,
      final String addressOwner}) = _$CarOwnerImpl;

  factory _CarOwner.fromJson(Map<String, dynamic> json) =
      _$CarOwnerImpl.fromJson;

  @override
  String get idOwner;
  @override
  String get idCar;
  @override
  String get idUser;
  @override
  String get addressOwner;
  @override
  @JsonKey(ignore: true)
  _$$CarOwnerImplCopyWith<_$CarOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
