import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @error_network.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get error_network;

  /// No description provided for @error_timeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out'**
  String get error_timeout;

  /// No description provided for @error_unknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again'**
  String get error_unknown;

  /// No description provided for @splash_title.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy App'**
  String get splash_title;

  /// No description provided for @splash_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy management system'**
  String get splash_subtitle;

  /// No description provided for @onboarding_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboarding_skip;

  /// No description provided for @onboarding_page1_title.
  ///
  /// In en, this message translates to:
  /// **'Your Smart Pharmacy Partner'**
  String get onboarding_page1_title;

  /// No description provided for @onboarding_page1_desc.
  ///
  /// In en, this message translates to:
  /// **'Focus more on your patients while we handle the paperwork. Automate prescription logging and simplify your daily routine.'**
  String get onboarding_page1_desc;

  /// No description provided for @onboarding_page2_title.
  ///
  /// In en, this message translates to:
  /// **'Real-Time Inventory Insights'**
  String get onboarding_page2_title;

  /// No description provided for @onboarding_page2_desc.
  ///
  /// In en, this message translates to:
  /// **'Never run out of essentials. Monitor stock levels and track sales performance with live analytics and automated alerts.'**
  String get onboarding_page2_desc;

  /// No description provided for @onboarding_page3_title.
  ///
  /// In en, this message translates to:
  /// **'Secure & Organized Workflow'**
  String get onboarding_page3_title;

  /// No description provided for @onboarding_page3_desc.
  ///
  /// In en, this message translates to:
  /// **'Keep patient data protected with high-level encryption while managing your team’s schedule and appointments in one place.'**
  String get onboarding_page3_desc;

  /// No description provided for @onboarding_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboarding_next;

  /// No description provided for @onboarding_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get onboarding_back;

  /// No description provided for @onboarding_start.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get onboarding_start;

  /// No description provided for @auth_login_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get auth_login_title;

  /// No description provided for @auth_login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to continue working'**
  String get auth_login_subtitle;

  /// No description provided for @auth_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get auth_email_label;

  /// No description provided for @auth_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password_label;

  /// No description provided for @auth_remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get auth_remember_me;

  /// No description provided for @auth_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get auth_forgot_password;

  /// No description provided for @auth_login_button.
  ///
  /// In en, this message translates to:
  /// **'SignIn'**
  String get auth_login_button;

  /// No description provided for @auth_no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get auth_no_account;

  /// No description provided for @auth_create_account.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get auth_create_account;

  /// No description provided for @auth_email_is_required.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get auth_email_is_required;

  /// No description provided for @auth_password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get auth_password_is_required;

  /// No description provided for @auth_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get auth_invalid_email;

  /// No description provided for @auth_password_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get auth_password_min_length;

  /// No description provided for @agree_to.
  ///
  /// In en, this message translates to:
  /// **'I agree to '**
  String get agree_to;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_and_conditions;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @auth_email_not_registered.
  ///
  /// In en, this message translates to:
  /// **'Email is not registered'**
  String get auth_email_not_registered;

  /// No description provided for @auth_wrong_password.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password'**
  String get auth_wrong_password;

  /// No description provided for @auth_login_success.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get auth_login_success;

  /// No description provided for @auth_or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get auth_or;

  /// No description provided for @auth_signin_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get auth_signin_with_google;

  /// No description provided for @auth_signup_account_title.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get auth_signup_account_title;

  /// No description provided for @auth_signup_account_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account in just a few clicks.'**
  String get auth_signup_account_subtitle;

  /// No description provided for @auth_confirm_password_label.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get auth_confirm_password_label;

  /// No description provided for @auth_passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get auth_passwords_do_not_match;

  /// No description provided for @auth_confirm_password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password is required'**
  String get auth_confirm_password_is_required;

  /// No description provided for @auth_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get auth_next;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get already_have_account;

  /// No description provided for @auth_signin.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get auth_signin;

  /// No description provided for @auth_signup_subtitle2.
  ///
  /// In en, this message translates to:
  /// **'Personal Information & Licensing'**
  String get auth_signup_subtitle2;

  /// No description provided for @first_name_label.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name_label;

  /// No description provided for @last_name_label.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name_label;

  /// No description provided for @phone_number_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number_label;

  /// No description provided for @first_name_hint.
  ///
  /// In en, this message translates to:
  /// **'John'**
  String get first_name_hint;

  /// No description provided for @last_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Smith'**
  String get last_name_hint;

  /// No description provided for @auth_first_name_is_required.
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get auth_first_name_is_required;

  /// No description provided for @auth_last_name_is_required.
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get auth_last_name_is_required;

  /// No description provided for @auth_phone_is_required.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get auth_phone_is_required;

  /// No description provided for @auth_invalid_phone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get auth_invalid_phone;

  /// No description provided for @phone_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_label;

  /// No description provided for @pharmacy_name_label.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy Name'**
  String get pharmacy_name_label;

  /// No description provided for @pharmacy_name_hint.
  ///
  /// In en, this message translates to:
  /// **'John\'s Pharmacy'**
  String get pharmacy_name_hint;

  /// No description provided for @auth_pharmacy_name_is_required.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy name is required'**
  String get auth_pharmacy_name_is_required;

  /// No description provided for @auth_governorate_is_required.
  ///
  /// In en, this message translates to:
  /// **'Governorate is required'**
  String get auth_governorate_is_required;

  /// No description provided for @auth_city_is_required.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get auth_city_is_required;

  /// No description provided for @auth_governorate_label.
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get auth_governorate_label;

  /// No description provided for @auth_city_label.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get auth_city_label;

  /// No description provided for @gov_damascus.
  ///
  /// In en, this message translates to:
  /// **'Damascus'**
  String get gov_damascus;

  /// No description provided for @gov_aleppo.
  ///
  /// In en, this message translates to:
  /// **'Aleppo'**
  String get gov_aleppo;

  /// No description provided for @gov_homs.
  ///
  /// In en, this message translates to:
  /// **'Homs'**
  String get gov_homs;

  /// No description provided for @gov_hama.
  ///
  /// In en, this message translates to:
  /// **'Hama'**
  String get gov_hama;

  /// No description provided for @gov_latakia.
  ///
  /// In en, this message translates to:
  /// **'Latakia'**
  String get gov_latakia;

  /// No description provided for @gov_tartous.
  ///
  /// In en, this message translates to:
  /// **'Tartous'**
  String get gov_tartous;

  /// No description provided for @gov_idlib.
  ///
  /// In en, this message translates to:
  /// **'Idlib'**
  String get gov_idlib;

  /// No description provided for @gov_daraa.
  ///
  /// In en, this message translates to:
  /// **'Daraa'**
  String get gov_daraa;

  /// No description provided for @gov_deir_ezzor.
  ///
  /// In en, this message translates to:
  /// **'Deir ez-Zor'**
  String get gov_deir_ezzor;

  /// No description provided for @gov_raqqa.
  ///
  /// In en, this message translates to:
  /// **'Raqqa'**
  String get gov_raqqa;

  /// No description provided for @gov_hasakah.
  ///
  /// In en, this message translates to:
  /// **'Al-Hasakah'**
  String get gov_hasakah;

  /// No description provided for @city_mazzeh.
  ///
  /// In en, this message translates to:
  /// **'Mazzeh'**
  String get city_mazzeh;

  /// No description provided for @city_barzeh.
  ///
  /// In en, this message translates to:
  /// **'Barzeh'**
  String get city_barzeh;

  /// No description provided for @city_mezzah_86.
  ///
  /// In en, this message translates to:
  /// **'Mezzeh 86'**
  String get city_mezzah_86;

  /// No description provided for @city_kafrsouseh.
  ///
  /// In en, this message translates to:
  /// **'Kafr Sousa'**
  String get city_kafrsouseh;

  /// No description provided for @city_ruken_al_din.
  ///
  /// In en, this message translates to:
  /// **'Rukn al-Din'**
  String get city_ruken_al_din;

  /// No description provided for @city_old_damascus.
  ///
  /// In en, this message translates to:
  /// **'Old Damascus'**
  String get city_old_damascus;

  /// No description provided for @city_salah_al_din.
  ///
  /// In en, this message translates to:
  /// **'Salah al-Din'**
  String get city_salah_al_din;

  /// No description provided for @city_hanano.
  ///
  /// In en, this message translates to:
  /// **'Hanano'**
  String get city_hanano;

  /// No description provided for @city_ashrafieh.
  ///
  /// In en, this message translates to:
  /// **'Ashrafieh'**
  String get city_ashrafieh;

  /// No description provided for @city_aziziyeh.
  ///
  /// In en, this message translates to:
  /// **'Aziziyeh'**
  String get city_aziziyeh;

  /// No description provided for @city_jamiliyeh.
  ///
  /// In en, this message translates to:
  /// **'Jamiliyeh'**
  String get city_jamiliyeh;

  /// No description provided for @city_seif_al_dawla.
  ///
  /// In en, this message translates to:
  /// **'Seif al-Dawla'**
  String get city_seif_al_dawla;

  /// No description provided for @city_al_inshaat.
  ///
  /// In en, this message translates to:
  /// **'Al-Inshaat'**
  String get city_al_inshaat;

  /// No description provided for @city_al_waer.
  ///
  /// In en, this message translates to:
  /// **'Al-Waer'**
  String get city_al_waer;

  /// No description provided for @city_al_hamra.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamra'**
  String get city_al_hamra;

  /// No description provided for @city_bab_tadmur.
  ///
  /// In en, this message translates to:
  /// **'Bab Tadmur'**
  String get city_bab_tadmur;

  /// No description provided for @city_al_arbaeen.
  ///
  /// In en, this message translates to:
  /// **'Al-Arbaeen'**
  String get city_al_arbaeen;

  /// No description provided for @city_al_nasiriya.
  ///
  /// In en, this message translates to:
  /// **'Al-Nasiriya'**
  String get city_al_nasiriya;

  /// No description provided for @city_al_kareem.
  ///
  /// In en, this message translates to:
  /// **'Al-Kareem'**
  String get city_al_kareem;

  /// No description provided for @city_al_ramleh.
  ///
  /// In en, this message translates to:
  /// **'Al-Ramleh'**
  String get city_al_ramleh;

  /// No description provided for @city_al_ziraa.
  ///
  /// In en, this message translates to:
  /// **'Al-Ziraa'**
  String get city_al_ziraa;

  /// No description provided for @city_corniche.
  ///
  /// In en, this message translates to:
  /// **'Corniche'**
  String get city_corniche;

  /// No description provided for @city_al_sheikh_badr.
  ///
  /// In en, this message translates to:
  /// **'Al-Sheikh Badr'**
  String get city_al_sheikh_badr;

  /// No description provided for @city_baniyas.
  ///
  /// In en, this message translates to:
  /// **'Baniyas'**
  String get city_baniyas;

  /// No description provided for @city_corniche_tartous.
  ///
  /// In en, this message translates to:
  /// **'Tartous Corniche'**
  String get city_corniche_tartous;

  /// No description provided for @city_idlib_center.
  ///
  /// In en, this message translates to:
  /// **'Idlib Center'**
  String get city_idlib_center;

  /// No description provided for @city_maarret_al_numan.
  ///
  /// In en, this message translates to:
  /// **'Maarat al-Numan'**
  String get city_maarret_al_numan;

  /// No description provided for @city_saraqib.
  ///
  /// In en, this message translates to:
  /// **'Saraqib'**
  String get city_saraqib;

  /// No description provided for @city_daraa_city.
  ///
  /// In en, this message translates to:
  /// **'Daraa City'**
  String get city_daraa_city;

  /// No description provided for @city_busra_al_sham.
  ///
  /// In en, this message translates to:
  /// **'Busra al-Sham'**
  String get city_busra_al_sham;

  /// No description provided for @city_nawa.
  ///
  /// In en, this message translates to:
  /// **'Nawa'**
  String get city_nawa;

  /// No description provided for @city_deir_ezzor_city.
  ///
  /// In en, this message translates to:
  /// **'Deir ez-Zor City'**
  String get city_deir_ezzor_city;

  /// No description provided for @city_al_mayadeen.
  ///
  /// In en, this message translates to:
  /// **'Al-Mayadeen'**
  String get city_al_mayadeen;

  /// No description provided for @city_al_bukamal.
  ///
  /// In en, this message translates to:
  /// **'Al-Bukamal'**
  String get city_al_bukamal;

  /// No description provided for @city_raqqa_city.
  ///
  /// In en, this message translates to:
  /// **'Raqqa City'**
  String get city_raqqa_city;

  /// No description provided for @city_tal_abyad.
  ///
  /// In en, this message translates to:
  /// **'Tal Abyad'**
  String get city_tal_abyad;

  /// No description provided for @city_hasakah_city.
  ///
  /// In en, this message translates to:
  /// **'Al-Hasakah City'**
  String get city_hasakah_city;

  /// No description provided for @city_qamishli.
  ///
  /// In en, this message translates to:
  /// **'Qamishli'**
  String get city_qamishli;

  /// No description provided for @city_malikiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Malikiyah'**
  String get city_malikiya;

  /// No description provided for @governorate_required.
  ///
  /// In en, this message translates to:
  /// **'governorate  required'**
  String get governorate_required;

  /// No description provided for @city_required.
  ///
  /// In en, this message translates to:
  /// **'city  required'**
  String get city_required;

  /// No description provided for @detailed_address_label.
  ///
  /// In en, this message translates to:
  /// **'Detailed Address (Optional)'**
  String get detailed_address_label;

  /// No description provided for @detailed_address_hint.
  ///
  /// In en, this message translates to:
  /// **'Downtown, near the main square...'**
  String get detailed_address_hint;

  /// No description provided for @pharmacy_license_label.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy License Number'**
  String get pharmacy_license_label;

  /// No description provided for @pharmacy_license_required.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy license number is required'**
  String get pharmacy_license_required;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @emailVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get emailVerificationTitle;

  /// No description provided for @emailSentTo.
  ///
  /// In en, this message translates to:
  /// **'A verification link was sent to'**
  String get emailSentTo;

  /// No description provided for @emailInstruction.
  ///
  /// In en, this message translates to:
  /// **'Open your email and tap the verification link to complete registration'**
  String get emailInstruction;

  /// No description provided for @resendLink.
  ///
  /// In en, this message translates to:
  /// **'Resend link'**
  String get resendLink;

  /// No description provided for @emailNotFound.
  ///
  /// In en, this message translates to:
  /// **'Didn’t find the email? Check your spam folder'**
  String get emailNotFound;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
