// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarReviewDTOImpl _$$CarReviewDTOImplFromJson(Map<String, dynamic> json) =>
    _$CarReviewDTOImpl(
      idCar: json['idCar'] as String? ?? '',
      rateReview: (json['rateReview'] as num?)?.toDouble() ?? 3.0,
      commentReview: json['commentReview'] as String? ?? '',
    );

Map<String, dynamic> _$$CarReviewDTOImplToJson(_$CarReviewDTOImpl instance) =>
    <String, dynamic>{
      'idCar': instance.idCar,
      'rateReview': instance.rateReview,
      'commentReview': instance.commentReview,
    };
