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
      kilometersCar: (json['kilometersCar'] as num?)?.toDouble() ?? 0,
      seatsCar: (json['seatsCar'] as num?)?.toInt() ?? 0,
      addressCar: json['addressCar'] as String? ?? "",
      latCar: (json['latCar'] as num?)?.toDouble() ?? 0,
      longCar: (json['longCar'] as num?)?.toDouble() ?? 0,
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
      'addressCar': instance.addressCar,
      'latCar': instance.latCar,
      'longCar': instance.longCar,
      'transmissionCar': instance.transmissionCar,
      'imagesCar': instance.imagesCar,
      'statusCar': instance.statusCar,
    };
