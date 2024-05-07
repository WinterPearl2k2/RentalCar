import 'package:rental_car/data/dtos/login_dto.dart';
import 'package:rental_car/data/dtos/reset_password_dto.dart';
import 'package:rental_car/data/dtos/verify_code_dto.dart';

import '../../data/dtos/user_dto.dart';
import '../model/token.dart';

abstract class IUserRepository{
  Future<Token> refreshToken({required Token token});
  Future<void> registerUser({required UserDTO userDTO});
  Future<Map> loginUser({required LoginDTO loginDTO});
  Future<void> forgotPassword({required String email});
  Future<void> verifyCode({required VerifyCodeDto codeDto});
  Future<void> resetPassword({required ResetPasswordDto resetPasswordDto});
}