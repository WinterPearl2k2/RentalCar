// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citizen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CitizenImpl _$$CitizenImplFromJson(Map<String, dynamic> json) =>
    _$CitizenImpl(
      no: json['no'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      sex: json['sex'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      placeOfOrigin: json['placeOfOrigin'] as String? ?? '',
    );

Map<String, dynamic> _$$CitizenImplToJson(_$CitizenImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth,
      'sex': instance.sex,
      'nationality': instance.nationality,
      'placeOfOrigin': instance.placeOfOrigin,
    };
