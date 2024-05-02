// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarImpl _$$CarImplFromJson(Map<String, dynamic> json) => _$CarImpl(
      idCar: json['idCar'] as String? ?? '',
      idBrand: json['idBrand'] as String? ?? '',
      idOwner: json['idOwner'] as String? ?? '',
      idReview: (json['idReview'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nameCar: json['nameCar'] as String? ?? '',
      priceCar: json['priceCar'] as String? ?? '',
      fuelTypeCar:
          $enumDecodeNullable(_$TypeFuelEnumMap, json['fuelTypeCar']) ??
              TypeFuel.gasFuel,
      colorCar: json['colorCar'] as String? ?? '',
      descriptionCar: json['descriptionCar'] as String? ?? '',
      kilometersCar: (json['kilometersCar'] as num?)?.toInt() ?? 0,
      seatsCar: (json['seatsCar'] as num?)?.toInt() ?? 0,
      transmissionCar:
          $enumDecodeNullable(_$TransmissionEnumMap, json['transmissionCar']) ??
              Transmission.manual,
      imagesCar: (json['imagesCar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      statusCar: $enumDecodeNullable(_$StatusCarEnumMap, json['statusCar']) ??
          StatusCar.available,
      createAt: json['createAt'] as String? ?? '',
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
      'idCar': instance.idCar,
      'idBrand': instance.idBrand,
      'idOwner': instance.idOwner,
      'idReview': instance.idReview,
      'nameCar': instance.nameCar,
      'priceCar': instance.priceCar,
      'fuelTypeCar': _$TypeFuelEnumMap[instance.fuelTypeCar]!,
      'colorCar': instance.colorCar,
      'descriptionCar': instance.descriptionCar,
      'kilometersCar': instance.kilometersCar,
      'seatsCar': instance.seatsCar,
      'transmissionCar': _$TransmissionEnumMap[instance.transmissionCar]!,
      'imagesCar': instance.imagesCar,
      'statusCar': _$StatusCarEnumMap[instance.statusCar]!,
      'createAt': instance.createAt,
    };

const _$TypeFuelEnumMap = {
  TypeFuel.dieselFuel: 'dieselFuel',
  TypeFuel.gasFuel: 'gasFuel',
  TypeFuel.hybridFuel: 'hybridFuel',
  TypeFuel.electricFuel: 'electricFuel',
};

const _$TransmissionEnumMap = {
  Transmission.automatic: 'automatic',
  Transmission.manual: 'manual',
};

const _$StatusCarEnumMap = {
  StatusCar.renting: 'renting',
  StatusCar.available: 'available',
};
