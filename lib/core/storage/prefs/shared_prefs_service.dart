import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  late final SharedPreferences _prefs;

  /// Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ---------------- BOOL ----------------
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  // ---------------- STRING ----------------
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  // ---------------- INT ----------------
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  // ---------------- REMOVE / CLEAR ----------------
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
