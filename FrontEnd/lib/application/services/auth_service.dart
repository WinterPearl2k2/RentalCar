import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/domain/model/token.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';

import '../../data/dtos/user_dto.dart';

abstract class IAuthService {
  Future<void> refreshToken();

  Future<void> registerUser({
    required UserDTO userDTO,
  });
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
      PreferenceService.setToken(token.accessToken, token.refreshToken);
    } catch (_) {
      PreferenceService.clearToken();
      rethrow;
    }
  }

  @override
  Future<void> registerUser({required UserDTO userDTO}) {
    return _userRepository.registerUser(
      userDTO: userDTO,
    );
  }
}
