abstract class ICallingRepository {
  Future<void> callingToUser({
    required String idUser,
    required String key,
  });

  Future<String> getKey();
}
