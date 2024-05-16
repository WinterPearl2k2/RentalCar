import 'package:rental_car/data/dtos/all_car_dto.dart';
import 'package:rental_car/data/dtos/car_rental_dto.dart';
import 'package:rental_car/data/dtos/car_review_dto.dart';
import 'package:rental_car/data/dtos/date_time_dto.dart';
import 'package:rental_car/data/dtos/user_car_rental_dto.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/data/dtos/top_car_dto.dart';
import 'package:rental_car/domain/model/car.dart';

import '../../data/dtos/car_dto.dart';

abstract class ICarRepository{
  Future<void> createCar({required CarDTO carDTO});
  Future<void> updateCar({required String idCar, required CarDTO carDTO});
  Future<void> deleteCar({required String idCar});
  Future<List<TopCarDTO>> getTopCar();
  Future<List<AllCarDTO>> getAllCar({required int page, required int pageSize});
  Future<CarDetailDTO> getCarById({required String idCar,required int page, required int pageSize});
  Future<List<Car>> getAllCarByIdUser({required String idUser});
  Future<void> rentalCar({required CarRentalDto carRentalDto});
  Future<List<UserCarRentalDto>> getRentalCars();
  Future<List<DateTimeDto>> getDateTimeCar({required String idCar});
  Future<List<AllCarDTO>> getSearchCar({required String nameCar});
  Future<void> createCarReview({required CarReviewDTO carReviewDTO});
}