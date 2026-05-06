import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  late final SharedPreferences _prefs;

  Future<SharedPrefsService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // ---------------- BOOL ----------------
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final value = _prefs.getBool(key);
    return value;
  }

  // ---------------- STRING ----------------
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final value = _prefs.getString(key);
    return value;
  }

  // ---------------- INT ----------------
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final value = _prefs.getInt(key);
    return value;
  }

  // ---------------- REMOVE / CLEAR ----------------
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
