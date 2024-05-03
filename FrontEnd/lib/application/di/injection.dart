import 'package:get_it/get_it.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/repositories/user_repository_impl.dart';

import '../../domain/repositories/user_repository.dart';

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
  }
}
