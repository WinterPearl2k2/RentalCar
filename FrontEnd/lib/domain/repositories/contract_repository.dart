import 'package:rental_car/data/dtos/rental_contract_dto.dart';

abstract class IContractRepository {
  Future<void> deleteRentalCar({
    required String idTransaction,
  });

  Future<void> signContract({
    required String idTransaction,
  });

  Future<List<RentalContractDto>> getRentalCar({
    required int offset,
    required int filter,
  });

  Future<List<RentalContractDto>> getLeaseCar({
    required int offset,
    required int filter,
  });
}
