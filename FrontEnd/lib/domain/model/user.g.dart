// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      idUser: json['idUser'] as String? ?? '',
      idContract: (json['idContract'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      emailUser: json['emailUser'] as String? ?? '',
      phoneUser: json['phoneUser'] as String? ?? '',
      nameUser: json['nameUser'] as String? ?? '',
      birthUser: json['birthUser'] as String? ?? '',
      passwordUser: json['passwordUser'] as String? ?? '',
      createAt: json['createAt'] as String? ?? '',
      updateAt: json['updateAt'] as String? ?? '',
      locationUser: (json['locationUser'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'idUser': instance.idUser,
      'idContract': instance.idContract,
      'emailUser': instance.emailUser,
      'phoneUser': instance.phoneUser,
      'nameUser': instance.nameUser,
      'birthUser': instance.birthUser,
      'passwordUser': instance.passwordUser,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'locationUser': instance.locationUser,
    };
