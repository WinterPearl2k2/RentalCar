// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapbox_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapboxLocationImpl _$$MapboxLocationImplFromJson(Map<String, dynamic> json) =>
    _$MapboxLocationImpl(
      placeId: json['place_id'] as String? ?? '',
      descriptionLocation: json['description'] as String? ?? '',
      formattedAddress: json['formatted_address'] as String? ?? '',
    );

Map<String, dynamic> _$$MapboxLocationImplToJson(
        _$MapboxLocationImpl instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'description': instance.descriptionLocation,
      'formatted_address': instance.formattedAddress,
    };
