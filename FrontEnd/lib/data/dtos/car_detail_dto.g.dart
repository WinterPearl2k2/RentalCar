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
      userName: json['userName'] as String? ?? "",
      starCar: (json['starCar'] as num?)?.toDouble() ?? 0,
      countReviewCar: (json['countReviewCar'] as num?)?.toDouble() ?? 0,
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
      'userName': instance.userName,
      'starCar': instance.starCar,
      'countReviewCar': instance.countReviewCar,
      'priceCar': instance.priceCar,
    };
