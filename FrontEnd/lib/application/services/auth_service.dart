import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';

abstract class IAuthService {
  Future<void> refreshToken();
}

class AuthServiceImpl implements IAuthService {
  final IUserRepository _userRepository;

  AuthServiceImpl(this._userRepository);

  @override
  Future<void> refreshToken() async {
    try {
      final token = await _userRepository.refreshToken(
        token: PreferenceService.getToken(),
      );
    } catch (_) {
      PreferenceService.clearToken();
      rethrow;
    }
  }
}
