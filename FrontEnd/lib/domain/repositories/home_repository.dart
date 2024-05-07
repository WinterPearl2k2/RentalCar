  import 'package:rental_car/domain/model/car.dart';

abstract class IHomeRepository{
  Future<List<Car>> getAllCar();
  Future<Car> getCarById({required String idCar});
}