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

  @override
  String get auth_login_title => 'Welcome back';

  @override
  String get auth_login_subtitle => 'Log in to continue working';

  @override
  String get auth_email_label => 'Email';

  @override
  String get auth_password_label => 'Password';

  @override
  String get auth_remember_me => 'Remember me';

  @override
  String get auth_forgot_password => 'Forgot password?';

  @override
  String get auth_login_button => 'SignIn';

  @override
  String get auth_no_account => 'Don\'t have an account? ';

  @override
  String get auth_create_account => 'Create a new account';

  @override
  String get auth_email_is_required => 'Email is required';

  @override
  String get auth_password_is_required => 'Password is required';

  @override
  String get auth_invalid_email => 'Invalid email format';

  @override
  String get auth_password_min_length => 'Password must be at least 8 characters';
}
