import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';

/// Holds the user's theme choice (System / Light / Dark) and persists it.
///
/// Drives `MaterialApp.router`'s `themeMode` via `context.watch<ThemeCubit>()`.
/// Defaults to [ThemeMode.system]; call [hydrate] once at startup to load the
/// persisted choice (otherwise the system default is used).
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({required SharedPrefsService prefs}) : _prefs = prefs, super(ThemeMode.system);

  final SharedPrefsService _prefs;

  /// Loads the persisted theme choice. Call once during app init.
  Future<void> hydrate() async {
    final stored = await _prefs.getString(PrefsKeys.themeMode);
    if (stored == null) return;
    try {
      emit(ThemeMode.values.byName(stored));
    } catch (_) {
      // Unknown value — keep the default.
    }
  }

  void setThemeMode(ThemeMode mode) {
    emit(mode);
    _prefs.setString(PrefsKeys.themeMode, mode.name);
  }

  void useSystemTheme() => setThemeMode(ThemeMode.system);
  void useLightTheme() => setThemeMode(ThemeMode.light);
  void useDarkTheme() => setThemeMode(ThemeMode.dark);
}
