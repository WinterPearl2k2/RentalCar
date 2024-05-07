// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarImpl _$$CarImplFromJson(Map<String, dynamic> json) => _$CarImpl(
      idCar: json['idCar'] as String? ?? '',
      idUser: json['idUser'] as String? ?? '',
      idReview: json['idReview'] as String? ?? '',
      nameCar: json['nameCar'] as String? ?? '',
      priceCar: (json['priceCar'] as num?)?.toDouble() ?? 0,
      fuelTypeCar: json['fuelTypeCar'] as String? ?? '',
      brandCar: json['brandCar'] as String? ?? '',
      colorCar: json['colorCar'] as String? ?? '',
      descriptionCar: json['descriptionCar'] as String? ?? '',
      kilometersCar: (json['kilometersCar'] as num?)?.toInt() ?? 0,
      seatsCar: (json['seatsCar'] as num?)?.toInt() ?? 0,
      transmissionCar: json['transmissionCar'] as String? ?? '',
      addressCar: json['addressCar'] as String? ?? '',
      imagesCar: json['imagesCar'] as String? ?? "",
      statusCar: json['statusCar'] as String? ?? '',
      createAt: json['createAt'] as String? ?? '',
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
      'idCar': instance.idCar,
      'idUser': instance.idUser,
      'idReview': instance.idReview,
      'nameCar': instance.nameCar,
      'priceCar': instance.priceCar,
      'fuelTypeCar': instance.fuelTypeCar,
      'brandCar': instance.brandCar,
      'colorCar': instance.colorCar,
      'descriptionCar': instance.descriptionCar,
      'kilometersCar': instance.kilometersCar,
      'seatsCar': instance.seatsCar,
      'transmissionCar': instance.transmissionCar,
      'addressCar': instance.addressCar,
      'imagesCar': instance.imagesCar,
      'statusCar': instance.statusCar,
      'createAt': instance.createAt,
    };
