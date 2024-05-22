// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapbox_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MapboxLocation _$MapboxLocationFromJson(Map<String, dynamic> json) {
  return _MapboxLocation.fromJson(json);
}

/// @nodoc
mixin _$MapboxLocation {
  @JsonKey(name: 'place_name')
  String get placeName => throw _privateConstructorUsedError;
  List<double> get center => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapboxLocationCopyWith<MapboxLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapboxLocationCopyWith<$Res> {
  factory $MapboxLocationCopyWith(
          MapboxLocation value, $Res Function(MapboxLocation) then) =
      _$MapboxLocationCopyWithImpl<$Res, MapboxLocation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_name') String placeName, List<double> center});
}

/// @nodoc
class _$MapboxLocationCopyWithImpl<$Res, $Val extends MapboxLocation>
    implements $MapboxLocationCopyWith<$Res> {
  _$MapboxLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeName = null,
    Object? center = null,
  }) {
    return _then(_value.copyWith(
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapboxLocationImplCopyWith<$Res>
    implements $MapboxLocationCopyWith<$Res> {
  factory _$$MapboxLocationImplCopyWith(_$MapboxLocationImpl value,
          $Res Function(_$MapboxLocationImpl) then) =
      __$$MapboxLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_name') String placeName, List<double> center});
}

/// @nodoc
class __$$MapboxLocationImplCopyWithImpl<$Res>
    extends _$MapboxLocationCopyWithImpl<$Res, _$MapboxLocationImpl>
    implements _$$MapboxLocationImplCopyWith<$Res> {
  __$$MapboxLocationImplCopyWithImpl(
      _$MapboxLocationImpl _value, $Res Function(_$MapboxLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeName = null,
    Object? center = null,
  }) {
    return _then(_$MapboxLocationImpl(
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      center: null == center
          ? _value._center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapboxLocationImpl implements _MapboxLocation {
  const _$MapboxLocationImpl(
      {@JsonKey(name: 'place_name') this.placeName = '',
      final List<double> center = const []})
      : _center = center;

  factory _$MapboxLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapboxLocationImplFromJson(json);

  @override
  @JsonKey(name: 'place_name')
  final String placeName;
  final List<double> _center;
  @override
  @JsonKey()
  List<double> get center {
    if (_center is EqualUnmodifiableListView) return _center;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_center);
  }

  @override
  String toString() {
    return 'MapboxLocation(placeName: $placeName, center: $center)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapboxLocationImpl &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            const DeepCollectionEquality().equals(other._center, _center));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, placeName, const DeepCollectionEquality().hash(_center));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapboxLocationImplCopyWith<_$MapboxLocationImpl> get copyWith =>
      __$$MapboxLocationImplCopyWithImpl<_$MapboxLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapboxLocationImplToJson(
      this,
    );
  }
}

abstract class _MapboxLocation implements MapboxLocation {
  const factory _MapboxLocation(
      {@JsonKey(name: 'place_name') final String placeName,
      final List<double> center}) = _$MapboxLocationImpl;

  factory _MapboxLocation.fromJson(Map<String, dynamic> json) =
      _$MapboxLocationImpl.fromJson;

  @override
  @JsonKey(name: 'place_name')
  String get placeName;
  @override
  List<double> get center;
  @override
  @JsonKey(ignore: true)
  _$$MapboxLocationImplCopyWith<_$MapboxLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
