import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/domain/repositories/home_repository.dart';

abstract class IHomeService {
  Future<List<Car>> getAllCar();

  Future<Car> getCarById({required String idCar});
}

class HomeServiceImpl implements IHomeService {
  final IHomeRepository _homeRepository;

  HomeServiceImpl(this._homeRepository);

  @override
  Future<List<Car>> getAllCar() {
    return _homeRepository.getAllCar();
  }

  @override
  Future<Car> getCarById({required String idCar}) {
    return _homeRepository.getCarById(idCar: idCar);
  }
}
