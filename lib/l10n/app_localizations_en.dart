// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get splash_title => 'Pharmacy App';

  @override
  String get splash_subtitle => 'Pharmacy management system';

  @override
  String get onboarding_skip => 'Skip';

  @override
  String get onboarding_page1_title => 'Manage inventory with ease';

  @override
  String get onboarding_page1_desc => 'Track medications, stock levels, and expiration dates all in one place';

  @override
  String get onboarding_page2_title => 'Fast sales system';

  @override
  String get onboarding_page2_desc => 'Process sales quickly with barcode scanning support';

  @override
  String get onboarding_page3_title => 'Reports and analytics';

  @override
  String get onboarding_page3_desc => 'Get comprehensive insights into your sales and inventory';

  @override
  String get onboarding_next => 'Next';

  @override
  String get onboarding_back => 'Back';

  @override
  String get onboarding_start => 'Start Now';
}
