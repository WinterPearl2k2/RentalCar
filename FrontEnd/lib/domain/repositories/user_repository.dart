import '../model/token.dart';

abstract class IUserRepository{
  Future<void> refreshToken({required Token token});
}