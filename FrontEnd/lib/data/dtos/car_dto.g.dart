// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarDTOImpl _$$CarDTOImplFromJson(Map<String, dynamic> json) => _$CarDTOImpl(
      nameCar: json['nameCar'] as String? ?? '',
      priceCar: (json['priceCar'] as num?)?.toDouble() ?? 0,
      brandCar: json['brandCar'] as String? ?? "",
      fuelTypeCar: json['fuelTypeCar'] as String? ?? "",
      colorCar: json['colorCar'] as String? ?? '',
      descriptionCar: json['descriptionCar'] as String? ?? '',
      kilometersCar: (json['kilometersCar'] as num?)?.toInt() ?? 0,
      seatsCar: (json['seatsCar'] as num?)?.toInt() ?? 0,
      addressOwner: json['addressOwner'] as String? ?? "",
      transmissionCar: json['transmissionCar'] as String? ?? "",
      imagesCar: json['imagesCar'] as String? ?? "",
      statusCar: json['statusCar'] as String? ?? "",
    );

Map<String, dynamic> _$$CarDTOImplToJson(_$CarDTOImpl instance) =>
    <String, dynamic>{
      'nameCar': instance.nameCar,
      'priceCar': instance.priceCar,
      'brandCar': instance.brandCar,
      'fuelTypeCar': instance.fuelTypeCar,
      'colorCar': instance.colorCar,
      'descriptionCar': instance.descriptionCar,
      'kilometersCar': instance.kilometersCar,
      'seatsCar': instance.seatsCar,
      'addressOwner': instance.addressOwner,
      'transmissionCar': instance.transmissionCar,
      'imagesCar': instance.imagesCar,
      'statusCar': instance.statusCar,
    };
