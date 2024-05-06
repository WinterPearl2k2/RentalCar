import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/dtos/login_dto.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';

import '../../data/dtos/user_dto.dart';

abstract class IAuthService {
  Future<void> refreshToken();

  Future<void> registerUser({
    required UserDTO userDTO,
  });

  Future<void> loginUser({
    required LoginDTO loginDTO,
  });

  Future<String> forgotPassword({
    required String email,
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

  @override
  Future<void> loginUser({required LoginDTO loginDTO}) async {
    try {
      final token = await _userRepository.loginUser(
        loginDTO: loginDTO,
      );
      PreferenceService.setToken(token.accessToken, token.refreshToken);
    } catch (_) {
      PreferenceService.clearToken();
      rethrow;
    }
  }

  @override
  Future<String> forgotPassword({required String email}) async {
    try {
      final response = await _userRepository.forgotPassword(email: email);
      final String expiration = response.data['expiration'];
      return expiration;
    } catch (_) {
      rethrow;
    }
  }
}
