abstract class AuthRepository {
  // *************** Authentication Actions **************** //

  //***************** Token Management ****************//

  Future<String?> getToken();

  Future<void> saveToken(String token);

  Future<void> clearToken();
}
