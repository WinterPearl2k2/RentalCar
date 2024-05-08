import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/data/dtos/login_dto.dart';
import 'package:rental_car/data/dtos/password_dto.dart';
import 'package:rental_car/data/dtos/reset_password_dto.dart';
import 'package:rental_car/data/dtos/user_dto.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';
import 'package:rental_car/data/dtos/verify_code_dto.dart';
import 'package:rental_car/domain/model/token.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends NetworkApi implements IUserRepository {
  @override
  Future<Token> refreshToken({required Token token}) {
    return post<Token>(
      url: EndPoint.restUrlRefreshToken,
      data: token.toJson(),
      mapper: (response) => Token.fromJson(response.data),
    );
  }

  @override
  Future<void> registerUser({required UserDTO userDTO}) {
    return post(
      url: EndPoint.restUrlRegister,
      data: userDTO.toJson(),
      mapper: (_) {},
    );
  }

  @override
  Future<Map> loginUser({required LoginDTO loginDTO}) {
    return post<Map>(
      url: EndPoint.restUrlLogin,
      data: loginDTO.toJson(),
      mapper: (response) => response.data,
    );
  }

  @override
  Future<void> forgotPassword({required String email}) {
    return post(
      url: '${EndPoint.restUrlForgotPassword}/$email',
      mapper: (response) => response,
    );
  }

  @override
  Future<void> verifyCode({required VerifyCodeDto codeDto}) {
    return post(
      url: EndPoint.restUrlVerifyCode,
      data: codeDto.toJson(),
      mapper: (_) {},
    );
  }

  @override
  Future<void> resetPassword({required ResetPasswordDto resetPasswordDto}) {
    return post(
      url: EndPoint.restUrlResetPassword,
      data: resetPasswordDto.toJson(),
      mapper: (_) {},
    );
  }

  @override
  Future<UserProfileDTO> getUser() {
    return get<UserProfileDTO>(
      url: EndPoint.restUrlGetUser,
      mapper: (response) => UserProfileDTO.fromJson(
        response.data,
      ),
    );
  }

  @override
  Future<UserProfileDTO> updateUser({
    required UserProfileDTO userDTO,
  }) {
    return put<UserProfileDTO>(
      url: EndPoint.restUrlUpdateUser,
      data: userDTO.toJson(),
      mapper: (response) => UserProfileDTO.fromJson(
        response.data,
      ),
    );
  }

  @override
  Future<void> changePassword({
    required PasswordDto passwordDto,
  }) {
    return put<void>(
      url: EndPoint.restUrlChangePassword,
      data: passwordDto.toJson(),
      mapper: (_) {},
    );
  }
}
