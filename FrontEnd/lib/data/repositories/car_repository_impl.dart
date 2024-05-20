

import 'package:dio/dio.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/data/dtos/all_car_dto.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/data/dtos/car_rental_dto.dart';
import 'package:rental_car/data/dtos/car_review_dto.dart';
import 'package:rental_car/data/dtos/date_time_dto.dart';
import 'package:rental_car/data/dtos/image_dto.dart';
import 'package:rental_car/data/dtos/user_car_rental_dto.dart';
import 'package:rental_car/data/dtos/top_car_dto.dart';
import 'package:rental_car/domain/model/car.dart';
import '../../domain/repositories/car_repository.dart';

class CarRepositoryImpl extends NetworkApi implements ICarRepository {
  @override
  Future<void> createCar({required CarDTO carDTO}) {
    return post<CarDTO>(
      url: EndPoint.restUrlCreateCar,
      data: carDTO.toJson(),
      mapper: (response) => CarDTO.fromJson(response.data),
    );
  }

  @override
  Future<void> deleteCar({required String idCar}) {
    return delete(
      url: "${EndPoint.restUrlDeleteCar}/$idCar",
      mapper: (_) {},
    );
  }

  @override
  Future<void> updateCar({required String idCar, required CarDTO carDTO}) {
    return put<CarDTO>(
      url: "${EndPoint.restUrlUpdateCar}/$idCar",
      data: carDTO.toJson(),
      mapper: (response) => CarDTO.fromJson(response.data),
    );
  }

  @override
  Future<List<Car>> getAllCarByIdUser({required String idUser}) {
    return get<List<Car>>(
      url: "${EndPoint.restUrlGetAllCarByIdUser}/$idUser",
      mapper: (response) {
        return (response.data as List)
            .map(
              (json) => Car.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<CarDetailDTO> getCarById(
      {required String idCar, required int page, required int pageSize}) {
    return get<CarDetailDTO>(
      url: "${EndPoint.restUrlGetCarById}/$idCar?page=$page&pageSize=$pageSize",
      mapper: (response) {
        return CarDetailDTO.fromJson(response.data);
      },
    );
  }

  @override
  Future<void> rentalCar({required CarRentalDto carRentalDto}) {
    return post<void>(
      url: EndPoint.restUrlRentalCar,
      data: carRentalDto.toJson(),
      mapper: (_) {},
    );
  }

  @override
  Future<List<UserCarRentalDto>> getRentalCars() {
    return get(
      url: EndPoint.restUrlGetRentalCars,
      mapper: (response) {
        if (response.data == null) {
          return [];
        }
        return (response.data as List)
            .map(
              (json) => UserCarRentalDto.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<AllCarDTO>> getAllCar(
      {required int page, required int pageSize}) {
    return get<List<AllCarDTO>>(
      url: '${EndPoint.restUrlGetAllCar}'
          '?userID=${PreferenceService.getUUID()}'
          '&page=$page&pageSize=$pageSize'
          '&latitude=${PreferenceService.getLocation().latitude}'
          '&longitude=${PreferenceService.getLocation().longitude}',
      mapper: (response) {
        return (response.data as List)
            .map(
              (json) => AllCarDTO.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<TopCarDTO>> getTopCar() {
    return get<List<TopCarDTO>>(
      url: EndPoint.restUrlGetTopCar,
      mapper: (response) {
        return (response.data as List)
            .map(
              (json) => TopCarDTO.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<DateTimeDto>> getDateTimeCar({required String idCar}) {
    return get(
      url: '${EndPoint.restUrlGetDateTimeCar}/$idCar',
      mapper: (response) {
        if (response.data == null) {
          return [];
        }
        return (response.data as List)
            .map(
              (json) => DateTimeDto.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<AllCarDTO>> getSearchCar({required String nameCar}) {
    return get<List<AllCarDTO>>(
      url:
          '${EndPoint.restUrlGetSearchCar}$nameCar&userID=${PreferenceService.getUUID()}',
      mapper: (response) {
        return (response.data as List)
            .map(
              (json) => AllCarDTO.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<void> createCarReview({required CarReviewDTO carReviewDTO}) {
    return post<void>(
      url: EndPoint.restUrlCreateCarReview,
      data: carReviewDTO.toJson(),
      mapper: (response) => CarReviewDTO.fromJson(response.data),
    );
  }

  @override
  Future<CarReviewDTO> getReviewCar({required String idCar}) {
    return get<CarReviewDTO>(
      url: '${EndPoint.restUrlGetCarReview}/$idCar',
      mapper: (response) => CarReviewDTO.fromJson(response.data),
    );
  }

  @override
  Future<ImageDTO> uploadImage({required MultipartFile imageFile}) {
    return post<ImageDTO>(
      url: EndPoint.restUrlUploadImage,
      data: FormData.fromMap({
        "file": imageFile,
      }),
      mapper: (response) => ImageDTO.fromJson(response.data),
    );
  }
}
