import 'package:get_it/get_it.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/calling_service.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/contract_service.dart';
import 'package:rental_car/application/services/mapbox_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/repositories/calling_repository_impl.dart';
import 'package:rental_car/data/repositories/car_repository_impl.dart';
import 'package:rental_car/data/repositories/contract_repository_impl.dart';
import 'package:rental_car/data/repositories/mapbox_repository_impl.dart';
import 'package:rental_car/data/repositories/user_repository_impl.dart';
import 'package:rental_car/domain/repositories/calling_repository.dart';
import 'package:rental_car/domain/repositories/car_repository.dart';
import 'package:rental_car/domain/repositories/contract_repository.dart';
import 'package:rental_car/domain/repositories/mapbox_repository.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';
import 'package:rental_car/main.dart';

import '../services/firebase_service.dart';
import '../services/navigation_service.dart';

class Injection {
  GetIt getIt = GetIt.instance;

  void configDependencies() {
    getIt.registerLazySingleton(
      () => NavigationService(navigatorKey: navigatorKey),
    );
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
    //ICallingRepository
    getIt.registerLazySingleton<ICallingRepository>(
      () => CallingRepository(),
    );
    //ICallingService
    getIt.registerLazySingleton<ICallingService>(
      () => CallingServiceImpl(
        getIt<ICallingRepository>(),
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

    getIt.registerSingletonAsync<FirebaseService>(
      () async {
        final firebaseService = FirebaseService();
        await firebaseService.initNotifications();
        return firebaseService;
      },
    );
    //IMapboxRepository
    getIt.registerLazySingleton<IMapboxRepository>(
      () => MapboxRepositoryImpl(),
    );

    //IMapboxService
    getIt.registerLazySingleton<IMapboxService>(
      () => MapboxServiceImpl(
        getIt<IMapboxRepository>(),
      ),
    );
  }
}
