// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapbox_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapboxLocationImpl _$$MapboxLocationImplFromJson(Map<String, dynamic> json) =>
    _$MapboxLocationImpl(
      placeName: json['place_name'] as String? ?? '',
      center: (json['center'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MapboxLocationImplToJson(
        _$MapboxLocationImpl instance) =>
    <String, dynamic>{
      'place_name': instance.placeName,
      'center': instance.center,
    };
