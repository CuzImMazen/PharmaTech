abstract class AuthRepository {
  //***************** Token Management ****************//

  Future<String?> getToken();

  Future<void> saveToken(String token);

  Future<void> clearToken();

  //***************** Remember Me ****************//
  Future<bool> getRememberMe();

  Future<void> setRememberMe(bool value);
}
