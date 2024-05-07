import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends NetworkApi implements IHomeRepository {
  @override
  Future<List<Car>> getAllCar() {
    return get<List<Car>>(
      url: EndPoint.restUrlGetAllCar,
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
  Future<Car> getCarById({required String idCar}) {
    return get<Car>(
      url:"${EndPoint.restUrlGetCarById}/$idCar",
      mapper: (response) {
        return Car.fromJson(response.data);
      },
    );
  }
}
