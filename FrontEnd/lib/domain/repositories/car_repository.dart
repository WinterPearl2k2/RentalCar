import '../../data/dtos/car_dto.dart';
import '../model/token.dart';

abstract class ICarRepository{
  Future<void> createCar({required CarDTO carDTO});
  Future<void> updateCar({required CarDTO carDTO});
  Future<Token> deleteCar({required CarDTO carDTO});
}