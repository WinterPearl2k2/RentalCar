// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginDTOImpl _$$LoginDTOImplFromJson(Map<String, dynamic> json) =>
    _$LoginDTOImpl(
      password: json['password'] as String? ?? '',
      email: json['email'] as String? ?? '',
      deviceToken: json['deviceToken'] as String? ?? '',
      authentication: json['authentication'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoginDTOImplToJson(_$LoginDTOImpl instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
      'deviceToken': instance.deviceToken,
      'authentication': instance.authentication,
    };
