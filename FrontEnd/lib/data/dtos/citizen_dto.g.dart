// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citizen_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CitizenDtoImpl _$$CitizenDtoImplFromJson(Map<String, dynamic> json) =>
    _$CitizenDtoImpl(
      no: json['no'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      sex: json['sex'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      placeOfOrigin: json['placeOfOrigin'] as String? ?? '',
    );

Map<String, dynamic> _$$CitizenDtoImplToJson(_$CitizenDtoImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth,
      'sex': instance.sex,
      'nationality': instance.nationality,
      'placeOfOrigin': instance.placeOfOrigin,
    };
