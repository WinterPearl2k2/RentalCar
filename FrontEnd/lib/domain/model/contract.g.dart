// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractImpl _$$ContractImplFromJson(Map<String, dynamic> json) =>
    _$ContractImpl(
      idContract: json['idContract'] as String? ?? '',
      idCar: json['idCar'] as String? ?? '',
      idUser: json['idUser'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
    );

Map<String, dynamic> _$$ContractImplToJson(_$ContractImpl instance) =>
    <String, dynamic>{
      'idContract': instance.idContract,
      'idCar': instance.idCar,
      'idUser': instance.idUser,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
