// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasswordDtoImpl _$$PasswordDtoImplFromJson(Map<String, dynamic> json) =>
    _$PasswordDtoImpl(
      oldPassword: json['oldPassword'] as String? ?? '',
      newPassword: json['newPassword'] as String? ?? '',
    );

Map<String, dynamic> _$$PasswordDtoImplToJson(_$PasswordDtoImpl instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
