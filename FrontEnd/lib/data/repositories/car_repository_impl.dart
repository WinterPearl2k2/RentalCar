import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/domain/model/token.dart';

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
  Future<Token> deleteCar({required CarDTO carDTO}) {
    // TODO: implement deleteCar
    throw UnimplementedError();
  }

  @override
  Future<void> updateCar({required CarDTO carDTO}) {
    // TODO: implement updateCar
    throw UnimplementedError();
  }
}
