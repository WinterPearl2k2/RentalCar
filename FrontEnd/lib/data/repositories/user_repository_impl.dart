import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/domain/model/token.dart';
import 'package:rental_car/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends NetworkApi implements IUserRepository {
  @override
  Future<void> refreshToken({required Token token}) {
    return post<Token>(
      url: 'none',
      data: token.toJson(),
      mapper: (response) => Token.fromJson(response.data),
    );
  }
}
