// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopCarDTOImpl _$$TopCarDTOImplFromJson(Map<String, dynamic> json) =>
    _$TopCarDTOImpl(
      idCar: json['idCar'] as String? ?? '',
      imagesCar: json['imagesCar'] as String? ?? '',
      nameCar: json['nameCar'] as String? ?? '',
      priceCar: (json['priceCar'] as num?)?.toDouble() ?? 0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TopCarDTOImplToJson(_$TopCarDTOImpl instance) =>
    <String, dynamic>{
      'idCar': instance.idCar,
      'imagesCar': instance.imagesCar,
      'nameCar': instance.nameCar,
      'priceCar': instance.priceCar,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
    };
