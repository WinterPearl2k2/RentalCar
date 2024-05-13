import 'package:get_it/get_it.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/contract_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/repositories/car_repository_impl.dart';
import 'package:rental_car/data/repositories/contract_repository_impl.dart';
import 'package:rental_car/data/repositories/user_repository_impl.dart';
import 'package:rental_car/domain/repositories/car_repository.dart';
import 'package:rental_car/domain/repositories/contract_repository.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';



class Injection {
  GetIt getIt = GetIt.instance;

  void configDependencies() {
    //SharePreference
    getIt.registerSingletonAsync(
      () => PreferenceService.init(),
    );
    //IUserRepository
    getIt.registerLazySingleton<IUserRepository>(
      () => UserRepositoryImpl(),
    );
    //IAuthService
    getIt.registerLazySingleton<IAuthService>(
      () => AuthServiceImpl(
        getIt<IUserRepository>(),
      ),
    );
    //ICarRepository
    getIt.registerLazySingleton<ICarRepository>(
      () => CarRepositoryImpl(),
    );
    //ICarService
    getIt.registerLazySingleton<ICarService>(
      () => CarServiceImpl(
        getIt<ICarRepository>(),
      ),
    );
    //ICarRepository
    getIt.registerLazySingleton<IContractRepository>(
          () => ContractRepositoryImpl(),
    );
    //ICarService
    getIt.registerLazySingleton<IContractService>(
          () => ContractServiceImpl(
        getIt<IContractRepository>(),
      ),
    );
  }
}
