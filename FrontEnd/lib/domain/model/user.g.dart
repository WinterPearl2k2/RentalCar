// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      idUser: json['idUser'] as String? ?? '',
      emailUser: json['emailUser'] as String? ?? '',
      phoneUser: json['phoneUser'] as String? ?? '',
      nameUser: json['nameUser'] as String? ?? '',
      passwordUser: json['passwordUser'] as String? ?? '',
      createAt: json['createAt'] as String? ?? '',
      updateAt: json['updateAt'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'idUser': instance.idUser,
      'emailUser': instance.emailUser,
      'phoneUser': instance.phoneUser,
      'nameUser': instance.nameUser,
      'passwordUser': instance.passwordUser,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
