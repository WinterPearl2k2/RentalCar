// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarDetailDTOImpl _$$CarDetailDTOImplFromJson(Map<String, dynamic> json) =>
    _$CarDetailDTOImpl(
      idCar: json['idCar'] as String? ?? '',
      idUser: json['idUser'] as String? ?? '',
      imagesCar: json['imagesCar'] as String? ?? "",
      nameCar: json['nameCar'] as String? ?? '',
      descriptionCar: json['descriptionCar'] as String? ?? '',
      fuelTypeCar: json['fuelTypeCar'] as String? ?? "",
      colorCar: json['colorCar'] as String? ?? '',
      kilometersCar: (json['kilometersCar'] as num?)?.toDouble() ?? 0,
      seatsCar: (json['seatsCar'] as num?)?.toInt() ?? 0,
      transmissionCar: json['transmissionCar'] as String? ?? "",
      addressCar: json['addressCar'] as String? ?? "",
      userName: json['userName'] as String? ?? "",
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentsDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      priceCar: (json['priceCar'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CarDetailDTOImplToJson(_$CarDetailDTOImpl instance) =>
    <String, dynamic>{
      'idCar': instance.idCar,
      'idUser': instance.idUser,
      'imagesCar': instance.imagesCar,
      'nameCar': instance.nameCar,
      'descriptionCar': instance.descriptionCar,
      'fuelTypeCar': instance.fuelTypeCar,
      'colorCar': instance.colorCar,
      'kilometersCar': instance.kilometersCar,
      'seatsCar': instance.seatsCar,
      'transmissionCar': instance.transmissionCar,
      'addressCar': instance.addressCar,
      'userName': instance.userName,
      'comments': instance.comments,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
      'priceCar': instance.priceCar,
    };
