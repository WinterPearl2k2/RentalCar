import '../../data/dtos/user_dto.dart';
import '../model/token.dart';

abstract class IUserRepository{
  Future<Token> refreshToken({required Token token});
  Future<void> registerUser({required UserDTO userDTO});
}