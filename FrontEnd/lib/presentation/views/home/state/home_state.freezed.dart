// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  List<TopCarDTO> get listTopCar => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  List<Placemark> get placemarks => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<TopCarDTO> listTopCar,
      Status status,
      List<Placemark> placemarks,
      Position position});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listTopCar = null,
    Object? status = null,
    Object? placemarks = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      listTopCar: null == listTopCar
          ? _value.listTopCar
          : listTopCar // ignore: cast_nullable_to_non_nullable
              as List<TopCarDTO>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      placemarks: null == placemarks
          ? _value.placemarks
          : placemarks // ignore: cast_nullable_to_non_nullable
              as List<Placemark>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TopCarDTO> listTopCar,
      Status status,
      List<Placemark> placemarks,
      Position position});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listTopCar = null,
    Object? status = null,
    Object? placemarks = null,
    Object? position = null,
  }) {
    return _then(_$HomeStateImpl(
      listTopCar: null == listTopCar
          ? _value._listTopCar
          : listTopCar // ignore: cast_nullable_to_non_nullable
              as List<TopCarDTO>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      placemarks: null == placemarks
          ? _value._placemarks
          : placemarks // ignore: cast_nullable_to_non_nullable
              as List<Placemark>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {final List<TopCarDTO> listTopCar = const [],
      this.status = Status.loading,
      final List<Placemark> placemarks = const [],
      this.position = const Position(
          longitude: 0.0,
          latitude: 0.0,
          timestamp: ConstDateTime(2024),
          accuracy: 0.0,
          altitude: 0.0,
          altitudeAccuracy: 0.0,
          heading: 0.0,
          headingAccuracy: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0)})
      : _listTopCar = listTopCar,
        _placemarks = placemarks;

  final List<TopCarDTO> _listTopCar;
  @override
  @JsonKey()
  List<TopCarDTO> get listTopCar {
    if (_listTopCar is EqualUnmodifiableListView) return _listTopCar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTopCar);
  }

  @override
  @JsonKey()
  final Status status;
  final List<Placemark> _placemarks;
  @override
  @JsonKey()
  List<Placemark> get placemarks {
    if (_placemarks is EqualUnmodifiableListView) return _placemarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placemarks);
  }

  @override
  @JsonKey()
  final Position position;

  @override
  String toString() {
    return 'HomeState(listTopCar: $listTopCar, status: $status, placemarks: $placemarks, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._listTopCar, _listTopCar) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._placemarks, _placemarks) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listTopCar),
      status,
      const DeepCollectionEquality().hash(_placemarks),
      position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<TopCarDTO> listTopCar,
      final Status status,
      final List<Placemark> placemarks,
      final Position position}) = _$HomeStateImpl;

  @override
  List<TopCarDTO> get listTopCar;
  @override
  Status get status;
  @override
  List<Placemark> get placemarks;
  @override
  Position get position;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
