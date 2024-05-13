import 'package:rental_car/data/dtos/rental_contract_dto.dart';

import '../../domain/repositories/contract_repository.dart';
import '../data_sources/remote/api/end_point.dart';
import '../data_sources/remote/api/network_api.dart';

class ContractRepositoryImpl extends NetworkApi implements IContractRepository {
  @override
  Future<void> deleteRentalCar({required String idTransaction}) {
    return delete(
      url: '${EndPoint.restUrlCancelRentalCar}/$idTransaction',
      mapper: (_) => {},
    );
  }

  @override
  Future<List<RentalContractDto>> getRentalCar(
      {required int offset, required int filter}) {
    return get(
      url: '${EndPoint.restUrlGetRentalContract}/$offset/$filter',
      mapper: (response) {
        if (response.data == null) {
          return [];
        }
        return (response.data as List)
            .map(
              (json) => RentalContractDto.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<void> signContract({required String idTransaction}) {
    return put(
      url: '${EndPoint.restUrlSignContract}/$idTransaction',
      mapper: (_) => {},
    );
  }

  @override
  Future<List<RentalContractDto>> getLeaseCar(
      {required int offset, required int filter}) {
    return get(
      url: '${EndPoint.restUrlGetLeaseContract}/$offset/$filter',
      mapper: (response) {
        if (response.data == null) {
          return [];
        }
        return (response.data as List)
            .map(
              (json) => RentalContractDto.fromJson(json),
            )
            .toList();
      },
    );
  }
}
