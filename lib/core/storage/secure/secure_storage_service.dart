import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // ---------------- STRING ----------------
  Future<void> setString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    final value = await _storage.read(key: key);
    return value;
  }

  // ---------------- REMOVE ----------------
  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  // ---------------- CLEAR ----------------
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  // ---------------- OPTIONAL SAFETY HELPERS ----------------
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }
}
