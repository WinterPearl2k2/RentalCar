// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarReviewImpl _$$CarReviewImplFromJson(Map<String, dynamic> json) =>
    _$CarReviewImpl(
      idReview: json['idReview'] as String? ?? '',
      rateReview: (json['rateReview'] as num?)?.toInt() ?? 0,
      commentReview: json['commentReview'] as String? ?? '',
      createAt: json['createAt'] as String? ?? '',
    );

Map<String, dynamic> _$$CarReviewImplToJson(_$CarReviewImpl instance) =>
    <String, dynamic>{
      'idReview': instance.idReview,
      'rateReview': instance.rateReview,
      'commentReview': instance.commentReview,
      'createAt': instance.createAt,
    };
