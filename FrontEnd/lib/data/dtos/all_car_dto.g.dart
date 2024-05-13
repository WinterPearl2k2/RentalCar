// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllCarDTOImpl _$$AllCarDTOImplFromJson(Map<String, dynamic> json) =>
    _$AllCarDTOImpl(
      idCar: json['idCar'] as String? ?? '',
      imagesCar: json['imagesCar'] as String? ?? '',
      nameCar: json['nameCar'] as String? ?? '',
      priceCar: (json['priceCar'] as num?)?.toDouble() ?? 0,
      latCar: (json['latCar'] as num?)?.toDouble() ?? 0,
      longCar: (json['longCar'] as num?)?.toDouble() ?? 0,
      distanceCar: (json['distanceCar'] as num?)?.toDouble() ?? 0,
      starCar: (json['starCar'] as num?)?.toDouble() ?? 0,
      countReviewCar: (json['countReviewCar'] as num?)?.toInt() ?? 0,
      createAt: json['createAt'] == null
          ? const ConstDateTime(2024)
          : DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$AllCarDTOImplToJson(_$AllCarDTOImpl instance) =>
    <String, dynamic>{
      'idCar': instance.idCar,
      'imagesCar': instance.imagesCar,
      'nameCar': instance.nameCar,
      'priceCar': instance.priceCar,
      'latCar': instance.latCar,
      'longCar': instance.longCar,
      'distanceCar': instance.distanceCar,
      'starCar': instance.starCar,
      'countReviewCar': instance.countReviewCar,
      'createAt': instance.createAt.toIso8601String(),
    };
