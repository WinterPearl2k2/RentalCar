// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentHistoryImpl _$$RentHistoryImplFromJson(Map<String, dynamic> json) =>
    _$RentHistoryImpl(
      idHistory: json['idHistory'] as String? ?? '',
      idCar: json['idCar'] as String? ?? '',
      idUser: json['idUser'] as String? ?? '',
      statusHistory: (json['statusHistory'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RentHistoryImplToJson(_$RentHistoryImpl instance) =>
    <String, dynamic>{
      'idHistory': instance.idHistory,
      'idCar': instance.idCar,
      'idUser': instance.idUser,
      'statusHistory': instance.statusHistory,
    };
