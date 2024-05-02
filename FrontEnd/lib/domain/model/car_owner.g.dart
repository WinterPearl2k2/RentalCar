// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarOwnerImpl _$$CarOwnerImplFromJson(Map<String, dynamic> json) =>
    _$CarOwnerImpl(
      idOwner: json['idOwner'] as String? ?? '',
      idCar: json['idCar'] as String? ?? '',
      idUser: json['idUser'] as String? ?? '',
      addressOwner: json['addressOwner'] as String? ?? '',
    );

Map<String, dynamic> _$$CarOwnerImplToJson(_$CarOwnerImpl instance) =>
    <String, dynamic>{
      'idOwner': instance.idOwner,
      'idCar': instance.idCar,
      'idUser': instance.idUser,
      'addressOwner': instance.addressOwner,
    };
