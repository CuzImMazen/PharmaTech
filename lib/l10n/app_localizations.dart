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

  /// No description provided for @error_parsing.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while parsing data.'**
  String get error_parsing;

  /// Error message when the user hits the rate limiter.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please try again in {seconds} seconds.'**
  String error_too_many_attempts(String seconds);

  /// No description provided for @session_expired.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get session_expired;

  /// No description provided for @auth_invalid_credentials.
  ///
  /// In en, this message translates to:
  /// **'The email or password you entered is incorrect.'**
  String get auth_invalid_credentials;

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

  /// No description provided for @auth_email_already_exists.
  ///
  /// In en, this message translates to:
  /// **'This email address is already in use.'**
  String get auth_email_already_exists;

  /// No description provided for @auth_phone_already_exists.
  ///
  /// In en, this message translates to:
  /// **'This phone number is already in use.'**
  String get auth_phone_already_exists;

  /// No description provided for @auth_email_not_verified.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email first. A new activation link has been sent to your inbox.'**
  String get auth_email_not_verified;

  /// No description provided for @auth_invalid_reset_token.
  ///
  /// In en, this message translates to:
  /// **'This password reset token is invalid or has expired.'**
  String get auth_invalid_reset_token;

  /// No description provided for @auth_action_denied.
  ///
  /// In en, this message translates to:
  /// **'This verification link is invalid or has expired.'**
  String get auth_action_denied;

  /// No description provided for @auth_google_sign_in_failed.
  ///
  /// In en, this message translates to:
  /// **'Google sign-in failed. Please try again.'**
  String get auth_google_sign_in_failed;

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

  /// No description provided for @password_atleast_one_letter.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one letter'**
  String get password_atleast_one_letter;

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

  /// No description provided for @auth_confirm_password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password is required'**
  String get auth_confirm_password_is_required;

  /// No description provided for @auth_passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get auth_passwords_do_not_match;

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

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @go_back.
  ///
  /// In en, this message translates to:
  /// **'do you want to go back to the'**
  String get go_back;

  /// No description provided for @login_screen.
  ///
  /// In en, this message translates to:
  /// **'Login Screen'**
  String get login_screen;

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

  /// No description provided for @emailSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get emailSentTitle;

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

  /// No description provided for @didnt_find_email.
  ///
  /// In en, this message translates to:
  /// **'Didn’t find the email? Check your spam folder or try again later'**
  String get didnt_find_email;

  /// No description provided for @continue_btn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_btn;

  /// No description provided for @email_verification_success.
  ///
  /// In en, this message translates to:
  /// **'Email verified successfully. You can now log in.'**
  String get email_verification_success;

  /// Message shown when the user tries to resend the verification email before the cooldown period is over.
  ///
  /// In en, this message translates to:
  /// **'you can resend after {seconds} seconds'**
  String you_can_resend_after(String seconds);

  /// No description provided for @couldnt_resend_link.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t resend the  link. Please try again later.'**
  String get couldnt_resend_link;

  /// No description provided for @resend_link_success.
  ///
  /// In en, this message translates to:
  /// **'Link resent successfully. Please check your email.'**
  String get resend_link_success;

  /// No description provided for @forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot_password_title;

  /// No description provided for @forgot_password_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to receive a password reset link'**
  String get forgot_password_subtitle;

  /// No description provided for @send_reset_password_link.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Password Link'**
  String get send_reset_password_link;

  /// No description provided for @remembered_password.
  ///
  /// In en, this message translates to:
  /// **'Remembered your password? '**
  String get remembered_password;

  /// No description provided for @reset_password_sent_subtitle.
  ///
  /// In en, this message translates to:
  /// **'we have sent reset password link to'**
  String get reset_password_sent_subtitle;

  /// No description provided for @reset_password_sent_instruction.
  ///
  /// In en, this message translates to:
  /// **'Open your email and click the reset password link to continue'**
  String get reset_password_sent_instruction;

  /// No description provided for @reset_password_title.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get reset_password_title;

  /// No description provided for @reset_password_subtitle.
  ///
  /// In en, this message translates to:
  /// **'enter your new password and make sure to choose a strong one to keep your account secure'**
  String get reset_password_subtitle;

  /// No description provided for @new_password_label.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password_label;

  /// No description provided for @reset_password_btn.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password_btn;

  /// No description provided for @reset_password_success.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully. Please SignIn with your new password.'**
  String get reset_password_success;

  /// No description provided for @changed_your_mind.
  ///
  /// In en, this message translates to:
  /// **'Changed your mind? go back to '**
  String get changed_your_mind;

  /// No description provided for @complete_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Complete Profile Details'**
  String get complete_profile_title;

  /// No description provided for @complete_profile_btn.
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get complete_profile_btn;

  /// No description provided for @signin_success_no_details.
  ///
  /// In en, this message translates to:
  /// **'Signed in successfully please complete your profile details to continue'**
  String get signin_success_no_details;

  /// No description provided for @complete_profile_success.
  ///
  /// In en, this message translates to:
  /// **'Profile completed successfully. You can now access the app.'**
  String get complete_profile_success;

  /// No description provided for @coomplete_profile_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while completing your profile. Please try again.'**
  String get coomplete_profile_error;

  /// No description provided for @auth_google_sign_in_canceled.
  ///
  /// In en, this message translates to:
  /// **'Google sign-in was canceled. You can try again if you wish.'**
  String get auth_google_sign_in_canceled;

  /// No description provided for @invalid_password_reset_link.
  ///
  /// In en, this message translates to:
  /// **'This password reset link is invalid or has expired.'**
  String get invalid_password_reset_link;

  /// No description provided for @email_already_verified.
  ///
  /// In en, this message translates to:
  /// **'This email address has already been verified. Please log in.'**
  String get email_already_verified;
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
