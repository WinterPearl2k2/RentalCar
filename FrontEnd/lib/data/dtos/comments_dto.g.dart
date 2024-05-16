// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsDTOImpl _$$CommentsDTOImplFromJson(Map<String, dynamic> json) =>
    _$CommentsDTOImpl(
      comment: json['comment'] as String? ?? '',
      commenter: json['commenter'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? const ConstDateTime(2024)
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CommentsDTOImplToJson(_$CommentsDTOImpl instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'commenter': instance.commenter,
      'createdAt': instance.createdAt.toIso8601String(),
    };
