// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationMessageDtoImpl _$$NotificationMessageDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationMessageDtoImpl(
      typeMessage: json['typeMessage'] as String? ?? '',
      carId: json['carId'] as String? ?? '',
    );

Map<String, dynamic> _$$NotificationMessageDtoImplToJson(
        _$NotificationMessageDtoImpl instance) =>
    <String, dynamic>{
      'typeMessage': instance.typeMessage,
      'carId': instance.carId,
    };
