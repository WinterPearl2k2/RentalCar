import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/data/dtos/user_dto.dart';
import 'package:rental_car/domain/model/token.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends NetworkApi implements IUserRepository {
  @override
  Future<Token> refreshToken({required Token token}) {
    return post<Token>(
      url: EndPoint.restUrlEmpty,
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
}
