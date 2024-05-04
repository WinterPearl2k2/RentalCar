import 'package:rental_car/data/dtos/login_dto.dart';

import '../../data/dtos/user_dto.dart';
import '../model/token.dart';

abstract class IUserRepository{
  Future<Token> refreshToken({required Token token});
  Future<void> registerUser({required UserDTO userDTO});
  Future<Token> loginUser({required LoginDTO loginDTO});
}