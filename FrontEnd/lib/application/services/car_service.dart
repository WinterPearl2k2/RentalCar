import 'package:rental_car/data/dtos/car_dto.dart';

import '../../domain/repositories/car_repository.dart';

abstract class ICarService {
  Future<void> createCar({
    required CarDTO carDTO,
  });
}

class CarServiceImpl implements ICarService {
  final ICarRepository _carRepository;

  CarServiceImpl(this._carRepository);

  @override
  Future<void> createCar({required CarDTO carDTO}) async {
    try {
      await _carRepository.createCar(
        carDTO: carDTO,
      );
    } catch (_) {
      rethrow;
    }
  }
}
