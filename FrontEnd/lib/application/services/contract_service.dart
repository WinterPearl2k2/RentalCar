import 'package:rental_car/data/dtos/rental_contract_dto.dart';
import 'package:rental_car/domain/repositories/contract_repository.dart';

abstract class IContractService {
  Future<void> cancelRentalCar({required String idTransaction});

  Future<void> signContract({required String idTransaction});

  Future<List<RentalContractDto>> getRentalContract({
    required int offset,
    required int filter,
  });

  Future<int> getNotification();

  Future<List<RentalContractDto>> getLeaseContract({
    required int offset,
    required int filter,
  });
}

class ContractServiceImpl implements IContractService {
  final IContractRepository _contractRepository;

  ContractServiceImpl(this._contractRepository);

  @override
  Future<void> cancelRentalCar({required String idTransaction}) {
    return _contractRepository.deleteRentalCar(
      idTransaction: idTransaction,
    );
  }

  @override
  Future<List<RentalContractDto>> getRentalContract({
    required int offset,
    required int filter,
  }) {
    return _contractRepository.getRentalCar(
      offset: offset,
      filter: filter,
    );
  }

  @override
  Future<void> signContract({required String idTransaction}) {
    return _contractRepository.signContract(
      idTransaction: idTransaction,
    );
  }

  @override
  Future<List<RentalContractDto>> getLeaseContract({
    required int offset,
    required int filter,
  }) {
    return _contractRepository.getLeaseCar(
      offset: offset,
      filter: filter,
    );
  }

  @override
  Future<int> getNotification() {
    return _contractRepository.getNotification();
  }
}
