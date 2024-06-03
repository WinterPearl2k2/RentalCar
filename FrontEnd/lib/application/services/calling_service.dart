import 'package:rental_car/domain/repositories/calling_repository.dart';

abstract class ICallingService {
  Future<String> getKeyCall();
}


class CallingServiceImpl implements ICallingService {
  final ICallingRepository _callingRepository;

  CallingServiceImpl(this._callingRepository);

  @override
  Future<String> getKeyCall() {
    return _callingRepository.getKey();
  }
}