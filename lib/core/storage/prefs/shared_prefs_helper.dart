import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  SharedPrefsHelper._();

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String getString(String key, {String defaultValue = ''}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  static Future<void> clear() async {
    await _prefs?.clear();
  }
}
