import 'package:pharmacy_app/core/repositories/auth/auth_repository.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_keys.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SecureStorageService secureStorageService;
  final SharedPrefsService sharedPrefsService;

  AuthRepositoryImpl({
    required this.secureStorageService,
    required this.sharedPrefsService,
  });
  // *************** Token Management ****************//
  @override
  Future<String?> getToken() {
    return secureStorageService.getString(SecureStorageKeys.token);
  }

  @override
  Future<void> saveToken(String token) {
    return secureStorageService.setString(SecureStorageKeys.token, token);
  }

  @override
  Future<void> clearToken() {
    return secureStorageService.remove(SecureStorageKeys.token);
  }

  // *************** Remember Me ****************//
  @override
  Future<bool> getRememberMe() async {
    return await (sharedPrefsService.getBool(PrefsKeys.rememberMe)) ?? false;
  }

  @override
  Future<void> setRememberMe(bool value) {
    return sharedPrefsService.setBool(PrefsKeys.rememberMe, value);
  }
}
