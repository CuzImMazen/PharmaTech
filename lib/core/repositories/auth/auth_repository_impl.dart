import 'package:flutter/foundation.dart';
import 'package:pharmacy_app/core/repositories/auth/auth_repository.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_keys.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.secureStorageService});
  final SecureStorageService secureStorageService;

  /// ********** Token Management ********** //

  @override
  Future<void> clearToken() async {
    try {
      await secureStorageService.remove(SecureStorageKeys.token);
    } catch (e) {
      debugPrint('AuthRepo: Error clearing token: $e');
    }
  }

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
}
