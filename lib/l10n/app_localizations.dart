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
  /// **'Begin your experience with us now.'**
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
  /// **'First name required'**
  String get auth_first_name_is_required;

  /// No description provided for @auth_last_name_is_required.
  ///
  /// In en, this message translates to:
  /// **'Last name required'**
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

  /// No description provided for @gov_rural_damascus.
  ///
  /// In en, this message translates to:
  /// **'Rural Damascus'**
  String get gov_rural_damascus;

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
  /// **'Deir Ezzor'**
  String get gov_deir_ezzor;

  /// No description provided for @gov_raqqa.
  ///
  /// In en, this message translates to:
  /// **'Raqqa'**
  String get gov_raqqa;

  /// No description provided for @gov_hasakah.
  ///
  /// In en, this message translates to:
  /// **'Hasakah'**
  String get gov_hasakah;

  /// No description provided for @city_damascus_mazzeh.
  ///
  /// In en, this message translates to:
  /// **'Mazzeh'**
  String get city_damascus_mazzeh;

  /// No description provided for @city_damascus_kafrsouseh.
  ///
  /// In en, this message translates to:
  /// **'Kafr Souseh'**
  String get city_damascus_kafrsouseh;

  /// No description provided for @city_damascus_barzeh.
  ///
  /// In en, this message translates to:
  /// **'Barzeh'**
  String get city_damascus_barzeh;

  /// No description provided for @city_damascus_meidan.
  ///
  /// In en, this message translates to:
  /// **'Meidan'**
  String get city_damascus_meidan;

  /// No description provided for @city_damascus_ruken_al_din.
  ///
  /// In en, this message translates to:
  /// **'Ruken Al-Din'**
  String get city_damascus_ruken_al_din;

  /// No description provided for @city_damascus_bab_touma.
  ///
  /// In en, this message translates to:
  /// **'Bab Touma'**
  String get city_damascus_bab_touma;

  /// No description provided for @city_damascus_bab_sharqi.
  ///
  /// In en, this message translates to:
  /// **'Bab Sharqi'**
  String get city_damascus_bab_sharqi;

  /// No description provided for @city_damascus_tishreen.
  ///
  /// In en, this message translates to:
  /// **'Tishreen'**
  String get city_damascus_tishreen;

  /// No description provided for @city_damascus_al_qanawat.
  ///
  /// In en, this message translates to:
  /// **'Al-Qanawat'**
  String get city_damascus_al_qanawat;

  /// No description provided for @city_damascus_abu_rummaneh.
  ///
  /// In en, this message translates to:
  /// **'Abu Rummaneh'**
  String get city_damascus_abu_rummaneh;

  /// No description provided for @city_damascus_shaalan.
  ///
  /// In en, this message translates to:
  /// **'Shaalan'**
  String get city_damascus_shaalan;

  /// No description provided for @city_damascus_dummar.
  ///
  /// In en, this message translates to:
  /// **'Dummar'**
  String get city_damascus_dummar;

  /// No description provided for @city_damascus_al_midan.
  ///
  /// In en, this message translates to:
  /// **'Al-Midan'**
  String get city_damascus_al_midan;

  /// No description provided for @city_damascus_kassaa.
  ///
  /// In en, this message translates to:
  /// **'Kassaa'**
  String get city_damascus_kassaa;

  /// No description provided for @city_damascus_old_damascus.
  ///
  /// In en, this message translates to:
  /// **'Old Damascus'**
  String get city_damascus_old_damascus;

  /// No description provided for @city_damascus_qasioun.
  ///
  /// In en, this message translates to:
  /// **'Qasioun'**
  String get city_damascus_qasioun;

  /// No description provided for @city_damascus_adawi.
  ///
  /// In en, this message translates to:
  /// **'Adawi'**
  String get city_damascus_adawi;

  /// No description provided for @city_damascus_al_amara.
  ///
  /// In en, this message translates to:
  /// **'Al-Amara'**
  String get city_damascus_al_amara;

  /// No description provided for @city_damascus_abu_jamal.
  ///
  /// In en, this message translates to:
  /// **'Abu Jamal'**
  String get city_damascus_abu_jamal;

  /// No description provided for @city_damascus_harika.
  ///
  /// In en, this message translates to:
  /// **'Harika'**
  String get city_damascus_harika;

  /// No description provided for @city_rural_damascus_douma.
  ///
  /// In en, this message translates to:
  /// **'Douma'**
  String get city_rural_damascus_douma;

  /// No description provided for @city_rural_damascus_harasta.
  ///
  /// In en, this message translates to:
  /// **'Harasta'**
  String get city_rural_damascus_harasta;

  /// No description provided for @city_rural_damascus_zamalka.
  ///
  /// In en, this message translates to:
  /// **'Zamalka'**
  String get city_rural_damascus_zamalka;

  /// No description provided for @city_rural_damascus_jobar.
  ///
  /// In en, this message translates to:
  /// **'Jobar'**
  String get city_rural_damascus_jobar;

  /// No description provided for @city_rural_damascus_qaboun.
  ///
  /// In en, this message translates to:
  /// **'Qaboun'**
  String get city_rural_damascus_qaboun;

  /// No description provided for @city_rural_damascus_madaya.
  ///
  /// In en, this message translates to:
  /// **'Madaya'**
  String get city_rural_damascus_madaya;

  /// No description provided for @city_rural_damascus_zabadani.
  ///
  /// In en, this message translates to:
  /// **'Zabadani'**
  String get city_rural_damascus_zabadani;

  /// No description provided for @city_rural_damascus_wafideen.
  ///
  /// In en, this message translates to:
  /// **'Wafideen'**
  String get city_rural_damascus_wafideen;

  /// No description provided for @city_rural_damascus_sayyida_zeinab.
  ///
  /// In en, this message translates to:
  /// **'Sayyida Zeinab'**
  String get city_rural_damascus_sayyida_zeinab;

  /// No description provided for @city_rural_damascus_darayya.
  ///
  /// In en, this message translates to:
  /// **'Darayya'**
  String get city_rural_damascus_darayya;

  /// No description provided for @city_rural_damascus_moadamiyeh.
  ///
  /// In en, this message translates to:
  /// **'Moadamiyeh'**
  String get city_rural_damascus_moadamiyeh;

  /// No description provided for @city_rural_damascus_qatana.
  ///
  /// In en, this message translates to:
  /// **'Qatana'**
  String get city_rural_damascus_qatana;

  /// No description provided for @city_rural_damascus_kiswah.
  ///
  /// In en, this message translates to:
  /// **'Kiswah'**
  String get city_rural_damascus_kiswah;

  /// No description provided for @city_rural_damascus_dmeir.
  ///
  /// In en, this message translates to:
  /// **'Dmeir'**
  String get city_rural_damascus_dmeir;

  /// No description provided for @city_rural_damascus_al_tall.
  ///
  /// In en, this message translates to:
  /// **'Al-Tall'**
  String get city_rural_damascus_al_tall;

  /// No description provided for @city_rural_damascus_arbin.
  ///
  /// In en, this message translates to:
  /// **'Arbin'**
  String get city_rural_damascus_arbin;

  /// No description provided for @city_rural_damascus_haran_al_awamid.
  ///
  /// In en, this message translates to:
  /// **'Haran Al-Awamid'**
  String get city_rural_damascus_haran_al_awamid;

  /// No description provided for @city_rural_damascus_yabroud.
  ///
  /// In en, this message translates to:
  /// **'Yabroud'**
  String get city_rural_damascus_yabroud;

  /// No description provided for @city_rural_damascus_an_nabk.
  ///
  /// In en, this message translates to:
  /// **'An-Nabk'**
  String get city_rural_damascus_an_nabk;

  /// No description provided for @city_rural_damascus_deir_atiyah.
  ///
  /// In en, this message translates to:
  /// **'Deir Atiyah'**
  String get city_rural_damascus_deir_atiyah;

  /// No description provided for @city_rural_damascus_jayrud.
  ///
  /// In en, this message translates to:
  /// **'Jayrud'**
  String get city_rural_damascus_jayrud;

  /// No description provided for @city_rural_damascus_assal_al_ward.
  ///
  /// In en, this message translates to:
  /// **'Assal Al-Ward'**
  String get city_rural_damascus_assal_al_ward;

  /// No description provided for @city_aleppo_salah_al_din.
  ///
  /// In en, this message translates to:
  /// **'Salah al-Din'**
  String get city_aleppo_salah_al_din;

  /// No description provided for @city_aleppo_hanano.
  ///
  /// In en, this message translates to:
  /// **'Hanano'**
  String get city_aleppo_hanano;

  /// No description provided for @city_aleppo_ashrafiyeh.
  ///
  /// In en, this message translates to:
  /// **'Ashrafiyeh'**
  String get city_aleppo_ashrafiyeh;

  /// No description provided for @city_aleppo_aziziyeh.
  ///
  /// In en, this message translates to:
  /// **'Aziziyeh'**
  String get city_aleppo_aziziyeh;

  /// No description provided for @city_aleppo_seif_al_dawla.
  ///
  /// In en, this message translates to:
  /// **'Seif al-Dawla'**
  String get city_aleppo_seif_al_dawla;

  /// No description provided for @city_aleppo_al_furqan.
  ///
  /// In en, this message translates to:
  /// **'Al-Furqan'**
  String get city_aleppo_al_furqan;

  /// No description provided for @city_aleppo_al_hamdaniya.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamdaniya'**
  String get city_aleppo_al_hamdaniya;

  /// No description provided for @city_aleppo_al_sukari.
  ///
  /// In en, this message translates to:
  /// **'Al-Sukari'**
  String get city_aleppo_al_sukari;

  /// No description provided for @city_aleppo_al_shaar.
  ///
  /// In en, this message translates to:
  /// **'Al-Shaar'**
  String get city_aleppo_al_shaar;

  /// No description provided for @city_aleppo_al_jamiliyeh.
  ///
  /// In en, this message translates to:
  /// **'Al-Jamiliyeh'**
  String get city_aleppo_al_jamiliyeh;

  /// No description provided for @city_aleppo_karm_al_jabal.
  ///
  /// In en, this message translates to:
  /// **'Karm al-Jabal'**
  String get city_aleppo_karm_al_jabal;

  /// No description provided for @city_aleppo_al_midan.
  ///
  /// In en, this message translates to:
  /// **'Al-Midan'**
  String get city_aleppo_al_midan;

  /// No description provided for @city_aleppo_sheikh_maqsood.
  ///
  /// In en, this message translates to:
  /// **'Sheikh Maqsood'**
  String get city_aleppo_sheikh_maqsood;

  /// No description provided for @city_aleppo_bustan_al_qasr.
  ///
  /// In en, this message translates to:
  /// **'Bustan al-Qasr'**
  String get city_aleppo_bustan_al_qasr;

  /// No description provided for @city_aleppo_al_aziziyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Aziziyah'**
  String get city_aleppo_al_aziziyah;

  /// No description provided for @city_aleppo_new_aleppo.
  ///
  /// In en, this message translates to:
  /// **'New Aleppo'**
  String get city_aleppo_new_aleppo;

  /// No description provided for @city_aleppo_old_city.
  ///
  /// In en, this message translates to:
  /// **'Old City'**
  String get city_aleppo_old_city;

  /// No description provided for @city_aleppo_sheikh_najjar.
  ///
  /// In en, this message translates to:
  /// **'Sheikh Najjar'**
  String get city_aleppo_sheikh_najjar;

  /// No description provided for @city_aleppo_khan_al_asal.
  ///
  /// In en, this message translates to:
  /// **'Khan al-Asal'**
  String get city_aleppo_khan_al_asal;

  /// No description provided for @city_aleppo_ramousah.
  ///
  /// In en, this message translates to:
  /// **'Ramousah'**
  String get city_aleppo_ramousah;

  /// No description provided for @city_aleppo_layramoun.
  ///
  /// In en, this message translates to:
  /// **'Layramoun'**
  String get city_aleppo_layramoun;

  /// No description provided for @city_aleppo_al_layramoun.
  ///
  /// In en, this message translates to:
  /// **'Al-Layramoun'**
  String get city_aleppo_al_layramoun;

  /// No description provided for @city_aleppo_al_haydariyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Haydariyah'**
  String get city_aleppo_al_haydariyah;

  /// No description provided for @city_homs_al_inshaat.
  ///
  /// In en, this message translates to:
  /// **'Al-Inshaat'**
  String get city_homs_al_inshaat;

  /// No description provided for @city_homs_al_waer.
  ///
  /// In en, this message translates to:
  /// **'Al-Waer'**
  String get city_homs_al_waer;

  /// No description provided for @city_homs_al_hamra.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamra'**
  String get city_homs_al_hamra;

  /// No description provided for @city_homs_bab_tadmur.
  ///
  /// In en, this message translates to:
  /// **'Bab Tadmur'**
  String get city_homs_bab_tadmur;

  /// No description provided for @city_homs_al_khaldiyeh.
  ///
  /// In en, this message translates to:
  /// **'Al-Khaldiyeh'**
  String get city_homs_al_khaldiyeh;

  /// No description provided for @city_homs_al_bayada.
  ///
  /// In en, this message translates to:
  /// **'Al-Bayada'**
  String get city_homs_al_bayada;

  /// No description provided for @city_homs_deir_ba_alba.
  ///
  /// In en, this message translates to:
  /// **'Deir Ba-Alba'**
  String get city_homs_deir_ba_alba;

  /// No description provided for @city_homs_ghouta.
  ///
  /// In en, this message translates to:
  /// **'Ghouta'**
  String get city_homs_ghouta;

  /// No description provided for @city_homs_al_qusur.
  ///
  /// In en, this message translates to:
  /// **'Al-Qusur'**
  String get city_homs_al_qusur;

  /// No description provided for @city_homs_al_zahraa.
  ///
  /// In en, this message translates to:
  /// **'Al-Zahraa'**
  String get city_homs_al_zahraa;

  /// No description provided for @city_homs_al_nuzha.
  ///
  /// In en, this message translates to:
  /// **'Al-Nuzha'**
  String get city_homs_al_nuzha;

  /// No description provided for @city_homs_al_sabeel.
  ///
  /// In en, this message translates to:
  /// **'Al-Sabeel'**
  String get city_homs_al_sabeel;

  /// No description provided for @city_homs_al_hamidiyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamidiyah'**
  String get city_homs_al_hamidiyah;

  /// No description provided for @city_homs_al_qarabis.
  ///
  /// In en, this message translates to:
  /// **'Al-Qarabis'**
  String get city_homs_al_qarabis;

  /// No description provided for @city_homs_al_karama.
  ///
  /// In en, this message translates to:
  /// **'Al-Karama'**
  String get city_homs_al_karama;

  /// No description provided for @city_homs_al_salam.
  ///
  /// In en, this message translates to:
  /// **'Al-Salam'**
  String get city_homs_al_salam;

  /// No description provided for @city_homs_al_ghouta.
  ///
  /// In en, this message translates to:
  /// **'Al-Ghouta'**
  String get city_homs_al_ghouta;

  /// No description provided for @city_homs_al_hosn.
  ///
  /// In en, this message translates to:
  /// **'Al-Hosn'**
  String get city_homs_al_hosn;

  /// No description provided for @city_homs_al_qaryatein.
  ///
  /// In en, this message translates to:
  /// **'Al-Qaryatein'**
  String get city_homs_al_qaryatein;

  /// No description provided for @city_homs_palmyra.
  ///
  /// In en, this message translates to:
  /// **'Palmyra'**
  String get city_homs_palmyra;

  /// No description provided for @city_hama_al_arbaeen.
  ///
  /// In en, this message translates to:
  /// **'Al-Arbaeen'**
  String get city_hama_al_arbaeen;

  /// No description provided for @city_hama_al_nasiriya.
  ///
  /// In en, this message translates to:
  /// **'Al-Nasiriya'**
  String get city_hama_al_nasiriya;

  /// No description provided for @city_hama_al_kareem.
  ///
  /// In en, this message translates to:
  /// **'Al-Kareem'**
  String get city_hama_al_kareem;

  /// No description provided for @city_hama_al_saboun.
  ///
  /// In en, this message translates to:
  /// **'Al-Saboun'**
  String get city_hama_al_saboun;

  /// No description provided for @city_hama_al_baath.
  ///
  /// In en, this message translates to:
  /// **'Al-Baath'**
  String get city_hama_al_baath;

  /// No description provided for @city_hama_mhardeh.
  ///
  /// In en, this message translates to:
  /// **'Mhardeh'**
  String get city_hama_mhardeh;

  /// No description provided for @city_hama_slimiyah.
  ///
  /// In en, this message translates to:
  /// **'Salamiyah'**
  String get city_hama_slimiyah;

  /// No description provided for @city_hama_kafr_zita.
  ///
  /// In en, this message translates to:
  /// **'Kafr Zita'**
  String get city_hama_kafr_zita;

  /// No description provided for @city_hama_latamina.
  ///
  /// In en, this message translates to:
  /// **'Latamina'**
  String get city_hama_latamina;

  /// No description provided for @city_hama_taybat_al_imam.
  ///
  /// In en, this message translates to:
  /// **'Taybat al-Imam'**
  String get city_hama_taybat_al_imam;

  /// No description provided for @city_hama_soran.
  ///
  /// In en, this message translates to:
  /// **'Soran'**
  String get city_hama_soran;

  /// No description provided for @city_hama_kafr_nabudah.
  ///
  /// In en, this message translates to:
  /// **'Kafr Nabudah'**
  String get city_hama_kafr_nabudah;

  /// No description provided for @city_hama_halfaya.
  ///
  /// In en, this message translates to:
  /// **'Halfaya'**
  String get city_hama_halfaya;

  /// No description provided for @city_hama_maharda.
  ///
  /// In en, this message translates to:
  /// **'Maharda'**
  String get city_hama_maharda;

  /// No description provided for @city_hama_qamhana.
  ///
  /// In en, this message translates to:
  /// **'Qamhana'**
  String get city_hama_qamhana;

  /// No description provided for @city_hama_al_latamna.
  ///
  /// In en, this message translates to:
  /// **'Al-Latamna'**
  String get city_hama_al_latamna;

  /// No description provided for @city_hama_al_surmaniyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Surmaniyah'**
  String get city_hama_al_surmaniyah;

  /// No description provided for @city_hama_al_mazzeh_hama.
  ///
  /// In en, this message translates to:
  /// **'Al-Mazzeh'**
  String get city_hama_al_mazzeh_hama;

  /// No description provided for @city_hama_al_suqailabiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Suqailabiya'**
  String get city_hama_al_suqailabiya;

  /// No description provided for @city_hama_al_hamraa.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamraa'**
  String get city_hama_al_hamraa;

  /// No description provided for @city_latakia_al_ramleh.
  ///
  /// In en, this message translates to:
  /// **'Al-Ramleh'**
  String get city_latakia_al_ramleh;

  /// No description provided for @city_latakia_al_ziraa.
  ///
  /// In en, this message translates to:
  /// **'Al-Ziraa'**
  String get city_latakia_al_ziraa;

  /// No description provided for @city_latakia_corniche.
  ///
  /// In en, this message translates to:
  /// **'Corniche'**
  String get city_latakia_corniche;

  /// No description provided for @city_latakia_qastal_maaf.
  ///
  /// In en, this message translates to:
  /// **'Qastal Maaf'**
  String get city_latakia_qastal_maaf;

  /// No description provided for @city_latakia_jableh.
  ///
  /// In en, this message translates to:
  /// **'Jableh'**
  String get city_latakia_jableh;

  /// No description provided for @city_latakia_qardaha.
  ///
  /// In en, this message translates to:
  /// **'Qardaha'**
  String get city_latakia_qardaha;

  /// No description provided for @city_latakia_slunfeh.
  ///
  /// In en, this message translates to:
  /// **'Slunfeh'**
  String get city_latakia_slunfeh;

  /// No description provided for @city_latakia_baniyas.
  ///
  /// In en, this message translates to:
  /// **'Baniyas'**
  String get city_latakia_baniyas;

  /// No description provided for @city_latakia_al_haffa.
  ///
  /// In en, this message translates to:
  /// **'Al-Haffa'**
  String get city_latakia_al_haffa;

  /// No description provided for @city_latakia_al_sheikh_daher.
  ///
  /// In en, this message translates to:
  /// **'Al-Sheikh Daher'**
  String get city_latakia_al_sheikh_daher;

  /// No description provided for @city_latakia_al_daatour.
  ///
  /// In en, this message translates to:
  /// **'Al-Daatour'**
  String get city_latakia_al_daatour;

  /// No description provided for @city_latakia_ras_al_basit.
  ///
  /// In en, this message translates to:
  /// **'Ras al-Basit'**
  String get city_latakia_ras_al_basit;

  /// No description provided for @city_latakia_kessab.
  ///
  /// In en, this message translates to:
  /// **'Kessab'**
  String get city_latakia_kessab;

  /// No description provided for @city_latakia_al_sanamayn.
  ///
  /// In en, this message translates to:
  /// **'Al-Sanamayn'**
  String get city_latakia_al_sanamayn;

  /// No description provided for @city_latakia_al_raml.
  ///
  /// In en, this message translates to:
  /// **'Al-Raml'**
  String get city_latakia_al_raml;

  /// No description provided for @city_latakia_al_bayda.
  ///
  /// In en, this message translates to:
  /// **'Al-Bayda'**
  String get city_latakia_al_bayda;

  /// No description provided for @city_latakia_al_shamiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Shamiya'**
  String get city_latakia_al_shamiya;

  /// No description provided for @city_latakia_al_kabir.
  ///
  /// In en, this message translates to:
  /// **'Al-Kabir'**
  String get city_latakia_al_kabir;

  /// No description provided for @city_latakia_al_safa.
  ///
  /// In en, this message translates to:
  /// **'Al-Safa'**
  String get city_latakia_al_safa;

  /// No description provided for @city_latakia_al_midan_latakia.
  ///
  /// In en, this message translates to:
  /// **'Al-Midan'**
  String get city_latakia_al_midan_latakia;

  /// No description provided for @city_tartous_tartous.
  ///
  /// In en, this message translates to:
  /// **'Tartous'**
  String get city_tartous_tartous;

  /// No description provided for @city_tartous_al_sheikh_badr.
  ///
  /// In en, this message translates to:
  /// **'Al-Sheikh Badr'**
  String get city_tartous_al_sheikh_badr;

  /// No description provided for @city_tartous_baniyas.
  ///
  /// In en, this message translates to:
  /// **'Baniyas'**
  String get city_tartous_baniyas;

  /// No description provided for @city_tartous_corniche.
  ///
  /// In en, this message translates to:
  /// **'Corniche'**
  String get city_tartous_corniche;

  /// No description provided for @city_tartous_dreikish.
  ///
  /// In en, this message translates to:
  /// **'Dreikish'**
  String get city_tartous_dreikish;

  /// No description provided for @city_tartous_rabea.
  ///
  /// In en, this message translates to:
  /// **'Rabea'**
  String get city_tartous_rabea;

  /// No description provided for @city_tartous_mashta_al_hilou.
  ///
  /// In en, this message translates to:
  /// **'Mashta al-Hilou'**
  String get city_tartous_mashta_al_hilou;

  /// No description provided for @city_tartous_bechmira.
  ///
  /// In en, this message translates to:
  /// **'Bechmira'**
  String get city_tartous_bechmira;

  /// No description provided for @city_tartous_al_hamidiyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamidiyah'**
  String get city_tartous_al_hamidiyah;

  /// No description provided for @city_tartous_al_dreikish.
  ///
  /// In en, this message translates to:
  /// **'Al-Dreikish'**
  String get city_tartous_al_dreikish;

  /// No description provided for @city_tartous_al_kadmous.
  ///
  /// In en, this message translates to:
  /// **'Al-Kadmous'**
  String get city_tartous_al_kadmous;

  /// No description provided for @city_tartous_al_safsafah.
  ///
  /// In en, this message translates to:
  /// **'Al-Safsafah'**
  String get city_tartous_al_safsafah;

  /// No description provided for @city_tartous_al_sheikh_badr_center.
  ///
  /// In en, this message translates to:
  /// **'Al-Sheikh Badr Center'**
  String get city_tartous_al_sheikh_badr_center;

  /// No description provided for @city_tartous_al_tall.
  ///
  /// In en, this message translates to:
  /// **'Al-Tall'**
  String get city_tartous_al_tall;

  /// No description provided for @city_tartous_al_kadmus.
  ///
  /// In en, this message translates to:
  /// **'Al-Kadmus'**
  String get city_tartous_al_kadmus;

  /// No description provided for @city_tartous_al_rastan_tartous.
  ///
  /// In en, this message translates to:
  /// **'Al-Rastan'**
  String get city_tartous_al_rastan_tartous;

  /// No description provided for @city_tartous_al_sudan.
  ///
  /// In en, this message translates to:
  /// **'Al-Sudan'**
  String get city_tartous_al_sudan;

  /// No description provided for @city_tartous_al_sisiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Sisiya'**
  String get city_tartous_al_sisiya;

  /// No description provided for @city_tartous_al_bayada.
  ///
  /// In en, this message translates to:
  /// **'Al-Bayada'**
  String get city_tartous_al_bayada;

  /// No description provided for @city_tartous_al_hamra_tartous.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamra'**
  String get city_tartous_al_hamra_tartous;

  /// No description provided for @city_idlib_idlib.
  ///
  /// In en, this message translates to:
  /// **'Idlib'**
  String get city_idlib_idlib;

  /// No description provided for @city_idlib_maarret_al_numan.
  ///
  /// In en, this message translates to:
  /// **'Maarret al-Numan'**
  String get city_idlib_maarret_al_numan;

  /// No description provided for @city_idlib_saraqib.
  ///
  /// In en, this message translates to:
  /// **'Saraqib'**
  String get city_idlib_saraqib;

  /// No description provided for @city_idlib_khan_sheikhoun.
  ///
  /// In en, this message translates to:
  /// **'Khan Sheikhoun'**
  String get city_idlib_khan_sheikhoun;

  /// No description provided for @city_idlib_jisir_al_shughur.
  ///
  /// In en, this message translates to:
  /// **'Jisir al-Shughur'**
  String get city_idlib_jisir_al_shughur;

  /// No description provided for @city_idlib_binnish.
  ///
  /// In en, this message translates to:
  /// **'Binnish'**
  String get city_idlib_binnish;

  /// No description provided for @city_idlib_taftanaz.
  ///
  /// In en, this message translates to:
  /// **'Taftanaz'**
  String get city_idlib_taftanaz;

  /// No description provided for @city_idlib_araq.
  ///
  /// In en, this message translates to:
  /// **'Araq'**
  String get city_idlib_araq;

  /// No description provided for @city_idlib_sarmin.
  ///
  /// In en, this message translates to:
  /// **'Sarmin'**
  String get city_idlib_sarmin;

  /// No description provided for @city_idlib_kafr_nabl.
  ///
  /// In en, this message translates to:
  /// **'Kafr Nabl'**
  String get city_idlib_kafr_nabl;

  /// No description provided for @city_idlib_maaret_al_tamasrin.
  ///
  /// In en, this message translates to:
  /// **'Maaret al-Tamasrin'**
  String get city_idlib_maaret_al_tamasrin;

  /// No description provided for @city_idlib_harem.
  ///
  /// In en, this message translates to:
  /// **'Harem'**
  String get city_idlib_harem;

  /// No description provided for @city_idlib_darkosh.
  ///
  /// In en, this message translates to:
  /// **'Darkosh'**
  String get city_idlib_darkosh;

  /// No description provided for @city_idlib_salqin.
  ///
  /// In en, this message translates to:
  /// **'Salqin'**
  String get city_idlib_salqin;

  /// No description provided for @city_idlib_al_dana.
  ///
  /// In en, this message translates to:
  /// **'Al-Dana'**
  String get city_idlib_al_dana;

  /// No description provided for @city_idlib_ram_hamdan.
  ///
  /// In en, this message translates to:
  /// **'Ram Hamdan'**
  String get city_idlib_ram_hamdan;

  /// No description provided for @city_idlib_kafr_aya.
  ///
  /// In en, this message translates to:
  /// **'Kafr Aya'**
  String get city_idlib_kafr_aya;

  /// No description provided for @city_idlib_kafr_sajna.
  ///
  /// In en, this message translates to:
  /// **'Kafr Sajna'**
  String get city_idlib_kafr_sajna;

  /// No description provided for @city_idlib_tal_karah.
  ///
  /// In en, this message translates to:
  /// **'Tal Karah'**
  String get city_idlib_tal_karah;

  /// No description provided for @city_idlib_zardana.
  ///
  /// In en, this message translates to:
  /// **'Zardana'**
  String get city_idlib_zardana;

  /// No description provided for @city_daraa_daraa.
  ///
  /// In en, this message translates to:
  /// **'Daraa'**
  String get city_daraa_daraa;

  /// No description provided for @city_daraa_busra_al_sham.
  ///
  /// In en, this message translates to:
  /// **'Busra al-Sham'**
  String get city_daraa_busra_al_sham;

  /// No description provided for @city_daraa_nawa.
  ///
  /// In en, this message translates to:
  /// **'Nawa'**
  String get city_daraa_nawa;

  /// No description provided for @city_daraa_jasem.
  ///
  /// In en, this message translates to:
  /// **'Jasem'**
  String get city_daraa_jasem;

  /// No description provided for @city_daraa_tafss.
  ///
  /// In en, this message translates to:
  /// **'Tafss'**
  String get city_daraa_tafss;

  /// No description provided for @city_daraa_mzeireb.
  ///
  /// In en, this message translates to:
  /// **'Mzeireb'**
  String get city_daraa_mzeireb;

  /// No description provided for @city_daraa_sanamayn.
  ///
  /// In en, this message translates to:
  /// **'Sanamayn'**
  String get city_daraa_sanamayn;

  /// No description provided for @city_daraa_inkhilal.
  ///
  /// In en, this message translates to:
  /// **'Inkhilal'**
  String get city_daraa_inkhilal;

  /// No description provided for @city_daraa_hirak.
  ///
  /// In en, this message translates to:
  /// **'Hirak'**
  String get city_daraa_hirak;

  /// No description provided for @city_daraa_dael.
  ///
  /// In en, this message translates to:
  /// **'Dael'**
  String get city_daraa_dael;

  /// No description provided for @city_daraa_al_sheikh_maskin.
  ///
  /// In en, this message translates to:
  /// **'Al-Sheikh Maskin'**
  String get city_daraa_al_sheikh_maskin;

  /// No description provided for @city_daraa_namir.
  ///
  /// In en, this message translates to:
  /// **'Namir'**
  String get city_daraa_namir;

  /// No description provided for @city_daraa_ghabgab.
  ///
  /// In en, this message translates to:
  /// **'Ghabgab'**
  String get city_daraa_ghabgab;

  /// No description provided for @city_daraa_al_yadouda.
  ///
  /// In en, this message translates to:
  /// **'Al-Yadouda'**
  String get city_daraa_al_yadouda;

  /// No description provided for @city_daraa_al_tibneh.
  ///
  /// In en, this message translates to:
  /// **'Al-Tibneh'**
  String get city_daraa_al_tibneh;

  /// No description provided for @city_daraa_tal_shihab.
  ///
  /// In en, this message translates to:
  /// **'Tal Shihab'**
  String get city_daraa_tal_shihab;

  /// No description provided for @city_daraa_khirbet_ghazaleh.
  ///
  /// In en, this message translates to:
  /// **'Khirbet Ghazaleh'**
  String get city_daraa_khirbet_ghazaleh;

  /// No description provided for @city_daraa_al_harak.
  ///
  /// In en, this message translates to:
  /// **'Al-Harak'**
  String get city_daraa_al_harak;

  /// No description provided for @city_daraa_al_jiza.
  ///
  /// In en, this message translates to:
  /// **'Al-Jiza'**
  String get city_daraa_al_jiza;

  /// No description provided for @city_daraa_al_manshiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Manshiya'**
  String get city_daraa_al_manshiya;

  /// No description provided for @city_deir_ezzor_deir_ezzor.
  ///
  /// In en, this message translates to:
  /// **'Deir Ezzor'**
  String get city_deir_ezzor_deir_ezzor;

  /// No description provided for @city_deir_ezzor_al_mayadeen.
  ///
  /// In en, this message translates to:
  /// **'Al-Mayadeen'**
  String get city_deir_ezzor_al_mayadeen;

  /// No description provided for @city_deir_ezzor_al_bukamal.
  ///
  /// In en, this message translates to:
  /// **'Al-Bukamal'**
  String get city_deir_ezzor_al_bukamal;

  /// No description provided for @city_deir_ezzor_al_busayra.
  ///
  /// In en, this message translates to:
  /// **'Al-Busayra'**
  String get city_deir_ezzor_al_busayra;

  /// No description provided for @city_deir_ezzor_al_susah.
  ///
  /// In en, this message translates to:
  /// **'Al-Susah'**
  String get city_deir_ezzor_al_susah;

  /// No description provided for @city_deir_ezzor_khasham.
  ///
  /// In en, this message translates to:
  /// **'Khasham'**
  String get city_deir_ezzor_khasham;

  /// No description provided for @city_deir_ezzor_al_husseiniyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Husseiniyah'**
  String get city_deir_ezzor_al_husseiniyah;

  /// No description provided for @city_deir_ezzor_al_jura.
  ///
  /// In en, this message translates to:
  /// **'Al-Jura'**
  String get city_deir_ezzor_al_jura;

  /// No description provided for @city_deir_ezzor_al_quriya.
  ///
  /// In en, this message translates to:
  /// **'Al-Quriya'**
  String get city_deir_ezzor_al_quriya;

  /// No description provided for @city_deir_ezzor_al_hawayej.
  ///
  /// In en, this message translates to:
  /// **'Al-Hawayej'**
  String get city_deir_ezzor_al_hawayej;

  /// No description provided for @city_deir_ezzor_al_tayana.
  ///
  /// In en, this message translates to:
  /// **'Al-Tayana'**
  String get city_deir_ezzor_al_tayana;

  /// No description provided for @city_deir_ezzor_al_tabni.
  ///
  /// In en, this message translates to:
  /// **'Al-Tabni'**
  String get city_deir_ezzor_al_tabni;

  /// No description provided for @city_deir_ezzor_al_shuhail.
  ///
  /// In en, this message translates to:
  /// **'Al-Shuhail'**
  String get city_deir_ezzor_al_shuhail;

  /// No description provided for @city_deir_ezzor_al_abu_kamal.
  ///
  /// In en, this message translates to:
  /// **'Al-Abu Kamal'**
  String get city_deir_ezzor_al_abu_kamal;

  /// No description provided for @city_deir_ezzor_al_husainiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Husainiya'**
  String get city_deir_ezzor_al_husainiya;

  /// No description provided for @city_deir_ezzor_al_jezira.
  ///
  /// In en, this message translates to:
  /// **'Al-Jezira'**
  String get city_deir_ezzor_al_jezira;

  /// No description provided for @city_deir_ezzor_al_dhula.
  ///
  /// In en, this message translates to:
  /// **'Al-Dhula'**
  String get city_deir_ezzor_al_dhula;

  /// No description provided for @city_deir_ezzor_al_baghouz.
  ///
  /// In en, this message translates to:
  /// **'Al-Baghouz'**
  String get city_deir_ezzor_al_baghouz;

  /// No description provided for @city_deir_ezzor_al_salihiyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Salihiyah'**
  String get city_deir_ezzor_al_salihiyah;

  /// No description provided for @city_deir_ezzor_al_omar.
  ///
  /// In en, this message translates to:
  /// **'Al-Omar'**
  String get city_deir_ezzor_al_omar;

  /// No description provided for @city_raqqa_raqqa.
  ///
  /// In en, this message translates to:
  /// **'Raqqa'**
  String get city_raqqa_raqqa;

  /// No description provided for @city_raqqa_tal_abyad.
  ///
  /// In en, this message translates to:
  /// **'Tal Abyad'**
  String get city_raqqa_tal_abyad;

  /// No description provided for @city_raqqa_al_tabqa.
  ///
  /// In en, this message translates to:
  /// **'Al-Tabqa'**
  String get city_raqqa_al_tabqa;

  /// No description provided for @city_raqqa_al_mansoura.
  ///
  /// In en, this message translates to:
  /// **'Al-Mansoura'**
  String get city_raqqa_al_mansoura;

  /// No description provided for @city_raqqa_al_karamah.
  ///
  /// In en, this message translates to:
  /// **'Al-Karamah'**
  String get city_raqqa_al_karamah;

  /// No description provided for @city_raqqa_al_karama.
  ///
  /// In en, this message translates to:
  /// **'Al-Karama'**
  String get city_raqqa_al_karama;

  /// No description provided for @city_raqqa_al_hanida.
  ///
  /// In en, this message translates to:
  /// **'Al-Hanida'**
  String get city_raqqa_al_hanida;

  /// No description provided for @city_raqqa_al_kasrat.
  ///
  /// In en, this message translates to:
  /// **'Al-Kasrat'**
  String get city_raqqa_al_kasrat;

  /// No description provided for @city_raqqa_al_resh.
  ///
  /// In en, this message translates to:
  /// **'Al-Resh'**
  String get city_raqqa_al_resh;

  /// No description provided for @city_raqqa_al_hisba.
  ///
  /// In en, this message translates to:
  /// **'Al-Hisba'**
  String get city_raqqa_al_hisba;

  /// No description provided for @city_raqqa_al_rashid.
  ///
  /// In en, this message translates to:
  /// **'Al-Rashid'**
  String get city_raqqa_al_rashid;

  /// No description provided for @city_raqqa_al_jurneyyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Jurneyyah'**
  String get city_raqqa_al_jurneyyah;

  /// No description provided for @city_raqqa_al_sabkha.
  ///
  /// In en, this message translates to:
  /// **'Al-Sabkha'**
  String get city_raqqa_al_sabkha;

  /// No description provided for @city_raqqa_al_hol.
  ///
  /// In en, this message translates to:
  /// **'Al-Hol'**
  String get city_raqqa_al_hol;

  /// No description provided for @city_raqqa_al_rasafa.
  ///
  /// In en, this message translates to:
  /// **'Al-Rasafa'**
  String get city_raqqa_al_rasafa;

  /// No description provided for @city_raqqa_al_sharakrak.
  ///
  /// In en, this message translates to:
  /// **'Al-Sharakrak'**
  String get city_raqqa_al_sharakrak;

  /// No description provided for @city_raqqa_al_khafsa.
  ///
  /// In en, this message translates to:
  /// **'Al-Khafsa'**
  String get city_raqqa_al_khafsa;

  /// No description provided for @city_raqqa_al_masrab.
  ///
  /// In en, this message translates to:
  /// **'Al-Masrab'**
  String get city_raqqa_al_masrab;

  /// No description provided for @city_raqqa_al_tabaqa_dam.
  ///
  /// In en, this message translates to:
  /// **'Al-Tabaqa Dam'**
  String get city_raqqa_al_tabaqa_dam;

  /// No description provided for @city_raqqa_al_qadisiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Qadisiya'**
  String get city_raqqa_al_qadisiya;

  /// No description provided for @city_hasakah_qamishli.
  ///
  /// In en, this message translates to:
  /// **'Qamishli'**
  String get city_hasakah_qamishli;

  /// No description provided for @city_hasakah_hasakah.
  ///
  /// In en, this message translates to:
  /// **'Hasakah'**
  String get city_hasakah_hasakah;

  /// No description provided for @city_hasakah_malikiya.
  ///
  /// In en, this message translates to:
  /// **'Malikiya'**
  String get city_hasakah_malikiya;

  /// No description provided for @city_hasakah_ras_al_ayn.
  ///
  /// In en, this message translates to:
  /// **'Ras al-Ayn'**
  String get city_hasakah_ras_al_ayn;

  /// No description provided for @city_hasakah_al_shaddadi.
  ///
  /// In en, this message translates to:
  /// **'Al-Shaddadi'**
  String get city_hasakah_al_shaddadi;

  /// No description provided for @city_hasakah_amuda.
  ///
  /// In en, this message translates to:
  /// **'Amuda'**
  String get city_hasakah_amuda;

  /// No description provided for @city_hasakah_derbasiya.
  ///
  /// In en, this message translates to:
  /// **'Derbasiya'**
  String get city_hasakah_derbasiya;

  /// No description provided for @city_hasakah_tirbespi.
  ///
  /// In en, this message translates to:
  /// **'Tirbespi'**
  String get city_hasakah_tirbespi;

  /// No description provided for @city_hasakah_al_mabrouka.
  ///
  /// In en, this message translates to:
  /// **'Al-Mabrouka'**
  String get city_hasakah_al_mabrouka;

  /// No description provided for @city_hasakah_al_yaarubiyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Yaarubiyah'**
  String get city_hasakah_al_yaarubiyah;

  /// No description provided for @city_hasakah_al_hawl.
  ///
  /// In en, this message translates to:
  /// **'Al-Hawl'**
  String get city_hasakah_al_hawl;

  /// No description provided for @city_hasakah_al_himma.
  ///
  /// In en, this message translates to:
  /// **'Al-Himma'**
  String get city_hasakah_al_himma;

  /// No description provided for @city_hasakah_al_ghazl.
  ///
  /// In en, this message translates to:
  /// **'Al-Ghazl'**
  String get city_hasakah_al_ghazl;

  /// No description provided for @city_hasakah_al_kasra.
  ///
  /// In en, this message translates to:
  /// **'Al-Kasra'**
  String get city_hasakah_al_kasra;

  /// No description provided for @city_hasakah_al_markada.
  ///
  /// In en, this message translates to:
  /// **'Al-Markada'**
  String get city_hasakah_al_markada;

  /// No description provided for @city_hasakah_al_tayyana.
  ///
  /// In en, this message translates to:
  /// **'Al-Tayyana'**
  String get city_hasakah_al_tayyana;

  /// No description provided for @city_hasakah_al_sweidiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Sweidiya'**
  String get city_hasakah_al_sweidiya;

  /// No description provided for @city_hasakah_al_khaldiya.
  ///
  /// In en, this message translates to:
  /// **'Al-Khaldiya'**
  String get city_hasakah_al_khaldiya;

  /// No description provided for @city_hasakah_al_jawadiyah.
  ///
  /// In en, this message translates to:
  /// **'Al-Jawadiyah'**
  String get city_hasakah_al_jawadiyah;

  /// No description provided for @city_hasakah_al_talaq.
  ///
  /// In en, this message translates to:
  /// **'Al-Talaq'**
  String get city_hasakah_al_talaq;

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

  /// No description provided for @continue_btn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_btn;
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
