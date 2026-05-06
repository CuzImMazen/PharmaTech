import 'package:pharmacy_app/core/repositories/auth/auth_repository.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_keys.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SecureStorageService secureStorageService;
  final SharedPrefsService sharedPrefsService;

  AuthRepositoryImpl({
    required this.secureStorageService,
    required this.sharedPrefsService,
  });

  // *************** Token Management (Secure Storage) **************** //

  @override
  Future<String?> getToken() async {
    try {
      return await secureStorageService.getString(SecureStorageKeys.token);
    } catch (e) {
      debugPrint('AuthRepo: Error getting token: $e');
      return null;
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await secureStorageService.setString(SecureStorageKeys.token, token);
    } catch (e) {
      debugPrint('AuthRepo: Error saving token: $e');
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await secureStorageService.remove(SecureStorageKeys.token);
    } catch (e) {
      debugPrint('AuthRepo: Error clearing token: $e');
    }
  }

  // *************** Remember Me (Shared Prefs) **************** //

  @override
  Future<bool> getRememberMe() async {
    try {
      final value = await sharedPrefsService.getBool(PrefsKeys.rememberMe);
      return value ?? false;
    } catch (e) {
      debugPrint('AuthRepo: Error getting rememberMe: $e');
      return false;
    }
  }

  @override
  Future<void> setRememberMe(bool value) async {
    try {
      await sharedPrefsService.setBool(PrefsKeys.rememberMe, value);
    } catch (e) {
      debugPrint('AuthRepo: Error setting rememberMe: $e');
    }
  }
}
