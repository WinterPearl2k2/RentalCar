// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyCodeDtoImpl _$$VerifyCodeDtoImplFromJson(Map<String, dynamic> json) =>
    _$VerifyCodeDtoImpl(
      code: json['code'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$VerifyCodeDtoImplToJson(_$VerifyCodeDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
    };
