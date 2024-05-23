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
  @JsonKey(name: 'place_id')
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get descriptionLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_address')
  String get formattedAddress => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'description') String descriptionLocation,
      @JsonKey(name: 'formatted_address') String formattedAddress});
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
    Object? placeId = null,
    Object? descriptionLocation = null,
    Object? formattedAddress = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionLocation: null == descriptionLocation
          ? _value.descriptionLocation
          : descriptionLocation // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'description') String descriptionLocation,
      @JsonKey(name: 'formatted_address') String formattedAddress});
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
    Object? placeId = null,
    Object? descriptionLocation = null,
    Object? formattedAddress = null,
  }) {
    return _then(_$MapboxLocationImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionLocation: null == descriptionLocation
          ? _value.descriptionLocation
          : descriptionLocation // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapboxLocationImpl implements _MapboxLocation {
  const _$MapboxLocationImpl(
      {@JsonKey(name: 'place_id') this.placeId = '',
      @JsonKey(name: 'description') this.descriptionLocation = '',
      @JsonKey(name: 'formatted_address') this.formattedAddress = ''});

  factory _$MapboxLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapboxLocationImplFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String placeId;
  @override
  @JsonKey(name: 'description')
  final String descriptionLocation;
  @override
  @JsonKey(name: 'formatted_address')
  final String formattedAddress;

  @override
  String toString() {
    return 'MapboxLocation(placeId: $placeId, descriptionLocation: $descriptionLocation, formattedAddress: $formattedAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapboxLocationImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.descriptionLocation, descriptionLocation) ||
                other.descriptionLocation == descriptionLocation) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, placeId, descriptionLocation, formattedAddress);

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
          {@JsonKey(name: 'place_id') final String placeId,
          @JsonKey(name: 'description') final String descriptionLocation,
          @JsonKey(name: 'formatted_address') final String formattedAddress}) =
      _$MapboxLocationImpl;

  factory _MapboxLocation.fromJson(Map<String, dynamic> json) =
      _$MapboxLocationImpl.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String get placeId;
  @override
  @JsonKey(name: 'description')
  String get descriptionLocation;
  @override
  @JsonKey(name: 'formatted_address')
  String get formattedAddress;
  @override
  @JsonKey(ignore: true)
  _$$MapboxLocationImplCopyWith<_$MapboxLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
