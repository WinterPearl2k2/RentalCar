import 'package:rental_car/domain/model/car.dart';

import '../../data/dtos/car_dto.dart';

abstract class ICarRepository{
  Future<void> createCar({required CarDTO carDTO});
  Future<void> updateCar({required String idCar, required CarDTO carDTO});
  Future<void> deleteCar({required String idCar});
  Future<List<Car>> getAllCar();
  Future<Car> getCarById({required String idCar});
  Future<List<Car>> getAllCarByIdUser({required String idUser});
}