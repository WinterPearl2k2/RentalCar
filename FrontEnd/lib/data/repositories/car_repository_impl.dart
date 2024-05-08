import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
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
    return post(
      url: "${EndPoint.restUrlDeleteCar}/$idCar",
      mapper: (_) {},
    );
  }

  @override
  Future<void> updateCar({required String idCar, required CarDTO carDTO}) {
    return post<CarDTO>(
      url:  "${EndPoint.restUrlUpdateCar}/$idCar",
      data: carDTO.toJson(),
      mapper: (response) => CarDTO.fromJson(response.data),
    );
  }

  @override
  Future<List<TopCarDTO>> getAllTopCar() {
    return get<List<TopCarDTO>>(
      url: EndPoint.restUrlGetAllCar,
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
  Future<CarDetailDTO> getCarById({required String idCar}) {
    return get<CarDetailDTO>(
      url:"${EndPoint.restUrlGetCarById}/$idCar",
      mapper: (response) {
        return CarDetailDTO.fromJson(response.data);
      },
    );
  }
}
