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
      starCar: (json['starCar'] as num?)?.toDouble() ?? 0,
      countReviewCar: (json['countReviewCar'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TopCarDTOImplToJson(_$TopCarDTOImpl instance) =>
    <String, dynamic>{
      'idCar': instance.idCar,
      'imagesCar': instance.imagesCar,
      'nameCar': instance.nameCar,
      'starCar': instance.starCar,
      'countReviewCar': instance.countReviewCar,
    };
