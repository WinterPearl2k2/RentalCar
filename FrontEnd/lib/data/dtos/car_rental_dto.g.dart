// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_rental_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarRentalDtoImpl _$$CarRentalDtoImplFromJson(Map<String, dynamic> json) =>
    _$CarRentalDtoImpl(
      idCar: json['idCar'] as String? ?? '',
      rentalPrice: (json['rentalPrice'] as num?)?.toDouble() ?? 0,
      rentalDays: (json['rentalDays'] as num?)?.toInt() ?? 0,
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
    );

Map<String, dynamic> _$$CarRentalDtoImplToJson(_$CarRentalDtoImpl instance) =>
    <String, dynamic>{
      'idCar': instance.idCar,
      'rentalPrice': instance.rentalPrice,
      'rentalDays': instance.rentalDays,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
