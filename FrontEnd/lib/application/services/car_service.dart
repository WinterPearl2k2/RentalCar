
import 'package:dio/dio.dart';
import 'package:rental_car/data/dtos/all_car_dto.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/data/dtos/car_rental_dto.dart';
import 'package:rental_car/data/dtos/car_review_dto.dart';
import 'package:rental_car/data/dtos/date_time_dto.dart';
import 'package:rental_car/data/dtos/image_dto.dart';
import 'package:rental_car/data/dtos/top_car_dto.dart';
import 'package:rental_car/domain/model/car.dart';

import '../../data/dtos/user_car_rental_dto.dart';
import '../../domain/repositories/car_repository.dart';

abstract class ICarService {
  Future<void> createCar({required CarDTO carDTO});

  Future<void> deleteCar({required String idCar});

  Future<void> updateCar({
    required String idCar,
    required CarDTO carDTO,
  });

  Future<List<UserCarRentalDto>> getRentalCars();

  Future<List<TopCarDTO>> getTopCar();

  Future<List<AllCarDTO>> getAllCar();

  Future<CarDetailDTO> getCarById({
    required String idCar,
    required int page,
    required int pageSize,
  });

  Future<List<Car>> getAllCarByIdUser({required String idUser});

  Future<void> rentalCar({required CarRentalDto carRentalDto});

  Future<List<DateTimeDto>> getDateTimeCar({required String idCar});

  Future<List<AllCarDTO>> getSearchCar({required String nameCar});

  Future<void> createCarReview({required CarReviewDTO carReviewDTO});

  Future<CarReviewDTO> getReviewCar({required String idCar});

  Future<ImageDTO> uploadImage({required MultipartFile imageFile});
}

class CarServiceImpl implements ICarService {
  final ICarRepository _carRepository;

  CarServiceImpl(this._carRepository);

  @override
  Future<void> createCar({required CarDTO carDTO}) {
    return _carRepository.createCar(
      carDTO: carDTO,
    );
  }

  @override
  Future<List<TopCarDTO>> getTopCar() {
    return _carRepository.getTopCar();
  }

  @override
  Future<CarDetailDTO> getCarById({
    required String idCar,
    required int page,
    required int pageSize,
  }) {
    return _carRepository.getCarById(
        idCar: idCar, page: page, pageSize: pageSize);
  }

  @override
  Future<void> deleteCar({required String idCar}) {
    return _carRepository.deleteCar(idCar: idCar);
  }

  @override
  Future<List<Car>> getAllCarByIdUser({required String idUser}) {
    return _carRepository.getAllCarByIdUser(idUser: idUser);
  }

  @override
  Future<void> updateCar({required String idCar, required CarDTO carDTO}) {
    return _carRepository.updateCar(idCar: idCar, carDTO: carDTO);
  }

  @override
  Future<void> rentalCar({required CarRentalDto carRentalDto}) {
    return _carRepository.rentalCar(carRentalDto: carRentalDto);
  }

  @override
  Future<List<UserCarRentalDto>> getRentalCars() {
    return _carRepository.getRentalCars();
  }

  @override
  Future<List<AllCarDTO>> getAllCar() {
    return _carRepository.getAllCar();
  }

  @override
  Future<List<DateTimeDto>> getDateTimeCar({required String idCar}) {
    return _carRepository.getDateTimeCar(idCar: idCar);
  }

  @override
  Future<List<AllCarDTO>> getSearchCar({required String nameCar}) {
    return _carRepository.getSearchCar(nameCar: nameCar);
  }

  @override
  Future<void> createCarReview({required CarReviewDTO carReviewDTO}) {
    return _carRepository.createCarReview(carReviewDTO: carReviewDTO);
  }

  @override
  Future<CarReviewDTO> getReviewCar({required String idCar}) {
    return _carRepository.getReviewCar(idCar: idCar);
  }

  @override
  Future<ImageDTO> uploadImage({required MultipartFile  imageFile}) {
    return _carRepository.uploadImage(imageFile: imageFile);
  }
}
