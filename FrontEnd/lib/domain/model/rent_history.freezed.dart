// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RentHistory _$RentHistoryFromJson(Map<String, dynamic> json) {
  return _RentHistory.fromJson(json);
}

/// @nodoc
mixin _$RentHistory {
  String get idHistory => throw _privateConstructorUsedError;
  String get idCar => throw _privateConstructorUsedError;
  String get idUser => throw _privateConstructorUsedError;
  int get statusHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentHistoryCopyWith<RentHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentHistoryCopyWith<$Res> {
  factory $RentHistoryCopyWith(
          RentHistory value, $Res Function(RentHistory) then) =
      _$RentHistoryCopyWithImpl<$Res, RentHistory>;
  @useResult
  $Res call({String idHistory, String idCar, String idUser, int statusHistory});
}

/// @nodoc
class _$RentHistoryCopyWithImpl<$Res, $Val extends RentHistory>
    implements $RentHistoryCopyWith<$Res> {
  _$RentHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idHistory = null,
    Object? idCar = null,
    Object? idUser = null,
    Object? statusHistory = null,
  }) {
    return _then(_value.copyWith(
      idHistory: null == idHistory
          ? _value.idHistory
          : idHistory // ignore: cast_nullable_to_non_nullable
              as String,
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentHistoryImplCopyWith<$Res>
    implements $RentHistoryCopyWith<$Res> {
  factory _$$RentHistoryImplCopyWith(
          _$RentHistoryImpl value, $Res Function(_$RentHistoryImpl) then) =
      __$$RentHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idHistory, String idCar, String idUser, int statusHistory});
}

/// @nodoc
class __$$RentHistoryImplCopyWithImpl<$Res>
    extends _$RentHistoryCopyWithImpl<$Res, _$RentHistoryImpl>
    implements _$$RentHistoryImplCopyWith<$Res> {
  __$$RentHistoryImplCopyWithImpl(
      _$RentHistoryImpl _value, $Res Function(_$RentHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idHistory = null,
    Object? idCar = null,
    Object? idUser = null,
    Object? statusHistory = null,
  }) {
    return _then(_$RentHistoryImpl(
      idHistory: null == idHistory
          ? _value.idHistory
          : idHistory // ignore: cast_nullable_to_non_nullable
              as String,
      idCar: null == idCar
          ? _value.idCar
          : idCar // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentHistoryImpl implements _RentHistory {
  const _$RentHistoryImpl(
      {this.idHistory = '',
      this.idCar = '',
      this.idUser = '',
      this.statusHistory = 0});

  factory _$RentHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentHistoryImplFromJson(json);

  @override
  @JsonKey()
  final String idHistory;
  @override
  @JsonKey()
  final String idCar;
  @override
  @JsonKey()
  final String idUser;
  @override
  @JsonKey()
  final int statusHistory;

  @override
  String toString() {
    return 'RentHistory(idHistory: $idHistory, idCar: $idCar, idUser: $idUser, statusHistory: $statusHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentHistoryImpl &&
            (identical(other.idHistory, idHistory) ||
                other.idHistory == idHistory) &&
            (identical(other.idCar, idCar) || other.idCar == idCar) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.statusHistory, statusHistory) ||
                other.statusHistory == statusHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idHistory, idCar, idUser, statusHistory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentHistoryImplCopyWith<_$RentHistoryImpl> get copyWith =>
      __$$RentHistoryImplCopyWithImpl<_$RentHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentHistoryImplToJson(
      this,
    );
  }
}

abstract class _RentHistory implements RentHistory {
  const factory _RentHistory(
      {final String idHistory,
      final String idCar,
      final String idUser,
      final int statusHistory}) = _$RentHistoryImpl;

  factory _RentHistory.fromJson(Map<String, dynamic> json) =
      _$RentHistoryImpl.fromJson;

  @override
  String get idHistory;
  @override
  String get idCar;
  @override
  String get idUser;
  @override
  int get statusHistory;
  @override
  @JsonKey(ignore: true)
  _$$RentHistoryImplCopyWith<_$RentHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
