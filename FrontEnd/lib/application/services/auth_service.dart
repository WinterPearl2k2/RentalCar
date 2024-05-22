import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/dtos/login_dto.dart';
import 'package:rental_car/data/dtos/password_dto.dart';
import 'package:rental_car/data/dtos/reset_password_dto.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';
import 'package:rental_car/data/dtos/verify_code_dto.dart';
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

  Future<void> forgotPassword({
    required String email,
  });

  Future<void> verifyCode({
    required VerifyCodeDto codeDto,
  });

  Future<void> resetPassword({
    required ResetPasswordDto resetPassword,
  });

  Future<UserProfileDTO> getUser();
  Future<void> checkAuthentication();
  Future<void> logout({required String deviceToken});

  Future<UserProfileDTO> updateUser({
    required UserProfileDTO userDTO,
  });

  Future<void> changePassword({
    required PasswordDto passwordDto,
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
      PreferenceService.clearUUID();
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
  Future<void> loginUser({
    required LoginDTO loginDTO,
  }) async {
    try {
      final data = await _userRepository.loginUser(
        loginDTO: loginDTO,
      );
      PreferenceService.setToken(data['accessToken'], data['refreshToken']);
      PreferenceService.setUUID(data['userId']);
    } catch (_) {
      PreferenceService.clearToken();
      PreferenceService.clearUUID();
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    required String email,
  }) {
    return _userRepository.forgotPassword(email: email);
  }

  @override
  Future<void> verifyCode({
    required VerifyCodeDto codeDto,
  }) {
    return _userRepository.verifyCode(codeDto: codeDto);
  }

  @override
  Future<void> resetPassword({
    required ResetPasswordDto resetPassword,
  }) {
    return _userRepository.resetPassword(resetPasswordDto: resetPassword);
  }

  @override
  Future<UserProfileDTO> getUser() {
    return _userRepository.getUser();
  }

  @override
  Future<UserProfileDTO> updateUser({
    required UserProfileDTO userDTO,
  }) {
    return _userRepository.updateUser(
      userDTO: userDTO,
    );
  }

  @override
  Future<void> changePassword({
    required PasswordDto passwordDto,
  }) {
    return _userRepository.changePassword(
      passwordDto: passwordDto,
    );
  }

  @override
  Future<void> logout({required String deviceToken}) {
    return _userRepository.logout(deviceToken: deviceToken);
  }

  @override
  Future<void> checkAuthentication() {
    return _userRepository.checkAuthentication();
  }
}
