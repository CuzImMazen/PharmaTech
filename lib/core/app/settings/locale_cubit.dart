import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';

/// Holds the user's language choice as a [Locale], or `null` to follow the
/// device locale. Drives `MaterialApp.router`'s `locale` via
/// `context.watch<LocaleCubit>()` and the `AuthInterceptor`'s `Accept-Language`
/// header via [currentLanguageCode]. Defaults to `null` (system); call
/// [hydrate] once at startup.
class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit({required SharedPrefsService prefs}) : _prefs = prefs, super(null);

  final SharedPrefsService _prefs;

  /// Sentinel stored for the "System" choice (a real `null` state).
  static const String _systemSentinel = 'system';

  /// Loads the persisted locale choice. Call once during app init.
  Future<void> hydrate() async {
    final stored = await _prefs.getString(PrefsKeys.appLocale);
    if (stored == null || stored == _systemSentinel) {
      emit(null);
      return;
    }
    emit(Locale(stored));
  }

  /// The current language code (`'en'`/`'ar'`), or `null` to follow the system.
  String? get currentLanguageCode => state?.languageCode;

  void useSystemLocale() {
    emit(null);
    _prefs.setString(PrefsKeys.appLocale, _systemSentinel);
  }

  void useLocale(Locale locale) {
    emit(locale);
    _prefs.setString(PrefsKeys.appLocale, locale.languageCode);
  }

  void useEnglish() => useLocale(const Locale('en'));
  void useArabic() => useLocale(const Locale('ar'));
}
