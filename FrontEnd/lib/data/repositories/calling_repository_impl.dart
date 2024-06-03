import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/domain/repositories/calling_repository.dart';

class CallingRepository extends NetworkApi implements ICallingRepository {
  @override
  Future<void> callingToUser({required String idUser, required String key}) {
    // TODO: implement callingToUser
    throw UnimplementedError();
  }

  @override
  Future<String> getKey() {
    return getKeyCall(
      url: 'https://api.videosdk.live/v2/rooms',
      mapper: (response) {
        final data = response.data as Map<String, dynamic>;
        return data['roomId'];
      },
    );
  }
}
