import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/data/dtos/car_rental_dto.dart';
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
  Future<List<TopCarDTO>> getAllTopCar();

  Future<CarDetailDTO> getCarById({required String idCar});

  Future<List<Car>> getAllCarByIdUser({required String idUser});

  Future<void> rentalCar({required CarRentalDto carRentalDto});
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
  Future<List<TopCarDTO>> getAllTopCar() {
    return _carRepository.getAllTopCar();
  }

  @override
  Future<CarDetailDTO> getCarById({required String idCar}) {
    return _carRepository.getCarById(idCar: idCar);
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
}
