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

  /// No description provided for @invalid_link.
  ///
  /// In en, this message translates to:
  /// **'The link is invalid or has expired please try again with new Link.'**
  String get invalid_link;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcome;

  /// No description provided for @here_is_your_pharmacy_summary.
  ///
  /// In en, this message translates to:
  /// **'Here\'s your pharmacy summary for today'**
  String get here_is_your_pharmacy_summary;

  /// No description provided for @today_revenue.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Revenue'**
  String get today_revenue;

  /// No description provided for @from_yesterday.
  ///
  /// In en, this message translates to:
  /// **'from yesterday'**
  String get from_yesterday;

  /// No description provided for @sp.
  ///
  /// In en, this message translates to:
  /// **'SP'**
  String get sp;

  /// No description provided for @invoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoice;

  /// No description provided for @units_sold.
  ///
  /// In en, this message translates to:
  /// **'Units Sold'**
  String get units_sold;

  /// No description provided for @avg_invoice_value.
  ///
  /// In en, this message translates to:
  /// **'Avg. Invoice'**
  String get avg_invoice_value;

  /// No description provided for @yesterday_revenue.
  ///
  /// In en, this message translates to:
  /// **'Yesterday\'s Revenue'**
  String get yesterday_revenue;

  /// No description provided for @this_week.
  ///
  /// In en, this message translates to:
  /// **'this week'**
  String get this_week;

  /// No description provided for @total_items.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get total_items;

  /// No description provided for @out_of_stock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get out_of_stock;

  /// No description provided for @items_in_stock.
  ///
  /// In en, this message translates to:
  /// **'Items in Stock'**
  String get items_in_stock;

  /// No description provided for @total_sales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get total_sales;

  /// No description provided for @today_sales.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Sales'**
  String get today_sales;

  /// No description provided for @stock_alerts.
  ///
  /// In en, this message translates to:
  /// **'Stock Alerts'**
  String get stock_alerts;

  /// No description provided for @weekly_revenue.
  ///
  /// In en, this message translates to:
  /// **'Weekly Revenue'**
  String get weekly_revenue;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @prevs_day.
  ///
  /// In en, this message translates to:
  /// **'Prev. Days'**
  String get prevs_day;

  /// No description provided for @recent_transactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recent_transactions;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @stock_alerts_title.
  ///
  /// In en, this message translates to:
  /// **'Stock Alerts'**
  String get stock_alerts_title;

  /// No description provided for @manage_inventory.
  ///
  /// In en, this message translates to:
  /// **'Manage Inventory'**
  String get manage_inventory;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @critical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get critical;

  /// No description provided for @out.
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get out;

  /// No description provided for @inventory_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search by name'**
  String get inventory_search_hint;

  /// No description provided for @inventory_unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get inventory_unit;

  /// No description provided for @inventory_price.
  ///
  /// In en, this message translates to:
  /// **'Price (SP)'**
  String get inventory_price;

  /// No description provided for @inventory_expiry.
  ///
  /// In en, this message translates to:
  /// **'Expiry'**
  String get inventory_expiry;

  /// No description provided for @inventory_stock_level.
  ///
  /// In en, this message translates to:
  /// **'Stock Level :'**
  String get inventory_stock_level;

  /// No description provided for @inventory_stock_min_suffix.
  ///
  /// In en, this message translates to:
  /// **' (Min)'**
  String get inventory_stock_min_suffix;

  /// No description provided for @inventory_no_products.
  ///
  /// In en, this message translates to:
  /// **'No products found.'**
  String get inventory_no_products;

  /// No description provided for @inventory_load_error.
  ///
  /// In en, this message translates to:
  /// **'Unable to load products right now.'**
  String get inventory_load_error;

  /// No description provided for @inventory_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get inventory_retry;

  /// No description provided for @filter_filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filter_filters;

  /// No description provided for @filter_filters_and_sort.
  ///
  /// In en, this message translates to:
  /// **'Filters & Sort'**
  String get filter_filters_and_sort;

  /// No description provided for @filter_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get filter_reset;

  /// No description provided for @filter_reset_title.
  ///
  /// In en, this message translates to:
  /// **'Reset filters?'**
  String get filter_reset_title;

  /// No description provided for @filter_reset_message.
  ///
  /// In en, this message translates to:
  /// **'This will clear all selected filters. This action cannot be undone.'**
  String get filter_reset_message;

  /// No description provided for @filter_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get filter_cancel;

  /// No description provided for @filter_show_results.
  ///
  /// In en, this message translates to:
  /// **'Show Results'**
  String get filter_show_results;

  /// No description provided for @filter_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading filters...'**
  String get filter_loading;

  /// No description provided for @filter_section_failed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load'**
  String get filter_section_failed;

  /// No description provided for @filter_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get filter_retry;

  /// No description provided for @filter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filter_all;

  /// No description provided for @filter_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get filter_category;

  /// No description provided for @filter_stock_status.
  ///
  /// In en, this message translates to:
  /// **'Stock Status'**
  String get filter_stock_status;

  /// No description provided for @filter_price_range.
  ///
  /// In en, this message translates to:
  /// **'Price Range (SP)'**
  String get filter_price_range;

  /// No description provided for @filter_expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get filter_expiry_date;

  /// No description provided for @filter_package_unit.
  ///
  /// In en, this message translates to:
  /// **'Package Unit'**
  String get filter_package_unit;

  /// No description provided for @filter_company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get filter_company;

  /// No description provided for @filter_prescription.
  ///
  /// In en, this message translates to:
  /// **'Prescription'**
  String get filter_prescription;

  /// No description provided for @filter_rx_only.
  ///
  /// In en, this message translates to:
  /// **'Rx-Only'**
  String get filter_rx_only;

  /// No description provided for @filter_non_rx.
  ///
  /// In en, this message translates to:
  /// **'Non-Rx'**
  String get filter_non_rx;

  /// No description provided for @filter_from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get filter_from;

  /// No description provided for @filter_to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get filter_to;

  /// No description provided for @filter_stock_available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get filter_stock_available;

  /// No description provided for @filter_stock_low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get filter_stock_low;

  /// No description provided for @filter_stock_out.
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get filter_stock_out;

  /// No description provided for @filter_expiry_expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get filter_expiry_expired;

  /// No description provided for @filter_expiry_30_days.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get filter_expiry_30_days;

  /// No description provided for @filter_expiry_60_days.
  ///
  /// In en, this message translates to:
  /// **'60 days'**
  String get filter_expiry_60_days;

  /// No description provided for @filter_expiry_90_days.
  ///
  /// In en, this message translates to:
  /// **'90 days'**
  String get filter_expiry_90_days;

  /// No description provided for @filter_expiry_6_months.
  ///
  /// In en, this message translates to:
  /// **'6 months'**
  String get filter_expiry_6_months;

  /// No description provided for @sort_name_asc.
  ///
  /// In en, this message translates to:
  /// **'Name A→Z'**
  String get sort_name_asc;

  /// No description provided for @sort_name_desc.
  ///
  /// In en, this message translates to:
  /// **'Name Z→A'**
  String get sort_name_desc;

  /// No description provided for @sort_price_asc.
  ///
  /// In en, this message translates to:
  /// **'Price ↑'**
  String get sort_price_asc;

  /// No description provided for @sort_price_desc.
  ///
  /// In en, this message translates to:
  /// **'Price ↓'**
  String get sort_price_desc;

  /// No description provided for @sort_stock_asc.
  ///
  /// In en, this message translates to:
  /// **'Stock ↑'**
  String get sort_stock_asc;

  /// No description provided for @sort_stock_desc.
  ///
  /// In en, this message translates to:
  /// **'Stock ↓'**
  String get sort_stock_desc;

  /// No description provided for @sort_expiry_soon.
  ///
  /// In en, this message translates to:
  /// **'Exp Soon'**
  String get sort_expiry_soon;

  /// No description provided for @sort_expiry_late.
  ///
  /// In en, this message translates to:
  /// **'Exp Late'**
  String get sort_expiry_late;

  /// No description provided for @stock_status_available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get stock_status_available;

  /// No description provided for @stock_status_low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get stock_status_low;

  /// No description provided for @stock_status_out.
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get stock_status_out;

  /// No description provided for @detail_not_available.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get detail_not_available;

  /// No description provided for @detail_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get detail_edit;

  /// No description provided for @detail_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get detail_delete;

  /// No description provided for @detail_tab_overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get detail_tab_overview;

  /// No description provided for @detail_tab_batches.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get detail_tab_batches;

  /// No description provided for @detail_tab_medical.
  ///
  /// In en, this message translates to:
  /// **'Medical Info'**
  String get detail_tab_medical;

  /// No description provided for @detail_section_product_info.
  ///
  /// In en, this message translates to:
  /// **'Product Information'**
  String get detail_section_product_info;

  /// No description provided for @detail_section_pricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get detail_section_pricing;

  /// No description provided for @detail_section_inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get detail_section_inventory;

  /// No description provided for @detail_barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get detail_barcode;

  /// No description provided for @detail_scientific_name.
  ///
  /// In en, this message translates to:
  /// **'Scientific Name'**
  String get detail_scientific_name;

  /// No description provided for @detail_strength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get detail_strength;

  /// No description provided for @detail_company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get detail_company;

  /// No description provided for @detail_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get detail_category;

  /// No description provided for @detail_shelf.
  ///
  /// In en, this message translates to:
  /// **'Shelf'**
  String get detail_shelf;

  /// No description provided for @detail_prescription.
  ///
  /// In en, this message translates to:
  /// **'Prescription'**
  String get detail_prescription;

  /// No description provided for @detail_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get detail_yes;

  /// No description provided for @detail_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get detail_no;

  /// No description provided for @detail_buying_price.
  ///
  /// In en, this message translates to:
  /// **'Buying Price'**
  String get detail_buying_price;

  /// No description provided for @detail_selling_price.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get detail_selling_price;

  /// No description provided for @detail_tax.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate'**
  String get detail_tax;

  /// No description provided for @detail_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount Rate'**
  String get detail_discount;

  /// No description provided for @detail_total_quantity.
  ///
  /// In en, this message translates to:
  /// **'Total Quantity'**
  String get detail_total_quantity;

  /// No description provided for @detail_min_stock.
  ///
  /// In en, this message translates to:
  /// **'Min. Stock'**
  String get detail_min_stock;

  /// No description provided for @detail_units_per_base.
  ///
  /// In en, this message translates to:
  /// **'Units per Base'**
  String get detail_units_per_base;

  /// No description provided for @detail_nearest_expiry.
  ///
  /// In en, this message translates to:
  /// **'Nearest Expiry'**
  String get detail_nearest_expiry;

  /// No description provided for @detail_allow_partial_selling.
  ///
  /// In en, this message translates to:
  /// **'Allow Partial Selling'**
  String get detail_allow_partial_selling;

  /// No description provided for @detail_batches_count.
  ///
  /// In en, this message translates to:
  /// **'{count} batches'**
  String detail_batches_count(int count);

  /// No description provided for @detail_add_batch.
  ///
  /// In en, this message translates to:
  /// **'Add Batch'**
  String get detail_add_batch;

  /// No description provided for @detail_no_batches.
  ///
  /// In en, this message translates to:
  /// **'No batches available'**
  String get detail_no_batches;

  /// No description provided for @detail_batch_id.
  ///
  /// In en, this message translates to:
  /// **'Batch'**
  String get detail_batch_id;

  /// No description provided for @detail_received_date.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get detail_received_date;

  /// No description provided for @detail_expiry.
  ///
  /// In en, this message translates to:
  /// **'Expiry'**
  String get detail_expiry;

  /// No description provided for @detail_quantity_on_hand.
  ///
  /// In en, this message translates to:
  /// **'On Hand'**
  String get detail_quantity_on_hand;

  /// No description provided for @detail_purchase_price.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get detail_purchase_price;

  /// No description provided for @detail_batch_selling_price.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get detail_batch_selling_price;

  /// No description provided for @detail_batch_status_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get detail_batch_status_active;

  /// No description provided for @detail_batch_status_expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get detail_batch_status_expired;

  /// No description provided for @detail_batch_status_depleted.
  ///
  /// In en, this message translates to:
  /// **'Depleted'**
  String get detail_batch_status_depleted;

  /// No description provided for @detail_batch_status_inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get detail_batch_status_inactive;

  /// No description provided for @detail_medical_empty_title.
  ///
  /// In en, this message translates to:
  /// **'No Medical Info'**
  String get detail_medical_empty_title;

  /// No description provided for @detail_medical_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Add medical information for this product to keep it available here.'**
  String get detail_medical_empty_subtitle;

  /// No description provided for @detail_add_medical_info.
  ///
  /// In en, this message translates to:
  /// **'Add Medical Info'**
  String get detail_add_medical_info;

  /// No description provided for @detail_medical_indications.
  ///
  /// In en, this message translates to:
  /// **'Indications'**
  String get detail_medical_indications;

  /// No description provided for @detail_medical_contraindications.
  ///
  /// In en, this message translates to:
  /// **'Contraindications'**
  String get detail_medical_contraindications;

  /// No description provided for @detail_medical_warnings.
  ///
  /// In en, this message translates to:
  /// **'Warnings'**
  String get detail_medical_warnings;

  /// No description provided for @detail_medical_side_effects.
  ///
  /// In en, this message translates to:
  /// **'Side Effects'**
  String get detail_medical_side_effects;

  /// No description provided for @detail_medical_overdose.
  ///
  /// In en, this message translates to:
  /// **'Overdose'**
  String get detail_medical_overdose;

  /// No description provided for @detail_medical_pregnancy_safety.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy Safety'**
  String get detail_medical_pregnancy_safety;

  /// No description provided for @detail_medical_lactation_safety.
  ///
  /// In en, this message translates to:
  /// **'Lactation Safety'**
  String get detail_medical_lactation_safety;

  /// No description provided for @detail_medical_drug_interactions.
  ///
  /// In en, this message translates to:
  /// **'Drug Interactions'**
  String get detail_medical_drug_interactions;

  /// No description provided for @detail_medical_dose_info.
  ///
  /// In en, this message translates to:
  /// **'Dose Info'**
  String get detail_medical_dose_info;

  /// No description provided for @detail_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get detail_save;

  /// No description provided for @detail_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get detail_cancel;

  /// No description provided for @product_add_title.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get product_add_title;

  /// No description provided for @product_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get product_edit_title;

  /// No description provided for @product_create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get product_create;

  /// No description provided for @product_created.
  ///
  /// In en, this message translates to:
  /// **'Product created successfully.'**
  String get product_created;

  /// No description provided for @product_saved.
  ///
  /// In en, this message translates to:
  /// **'Product updated successfully.'**
  String get product_saved;

  /// No description provided for @product_deleted.
  ///
  /// In en, this message translates to:
  /// **'Product deleted successfully.'**
  String get product_deleted;

  /// No description provided for @product_delete_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get product_delete_title;

  /// No description provided for @product_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product? This can be undone by restoring it later.'**
  String get product_delete_confirm;

  /// No description provided for @product_form_section_basic.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get product_form_section_basic;

  /// No description provided for @product_form_section_basic_sub.
  ///
  /// In en, this message translates to:
  /// **'Identity and naming'**
  String get product_form_section_basic_sub;

  /// No description provided for @product_form_section_classification.
  ///
  /// In en, this message translates to:
  /// **'Classification'**
  String get product_form_section_classification;

  /// No description provided for @product_form_section_classification_sub.
  ///
  /// In en, this message translates to:
  /// **'Category, company, and units'**
  String get product_form_section_classification_sub;

  /// No description provided for @product_form_section_pricing_sub.
  ///
  /// In en, this message translates to:
  /// **'Cost, price, tax, and discount'**
  String get product_form_section_pricing_sub;

  /// No description provided for @product_form_section_inventory_sub.
  ///
  /// In en, this message translates to:
  /// **'Stock thresholds and storage'**
  String get product_form_section_inventory_sub;

  /// No description provided for @product_form_barcode_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 123456789'**
  String get product_form_barcode_hint;

  /// No description provided for @product_form_brand_name.
  ///
  /// In en, this message translates to:
  /// **'Brand Name'**
  String get product_form_brand_name;

  /// No description provided for @product_form_brand_name_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Amoxil 500mg'**
  String get product_form_brand_name_hint;

  /// No description provided for @product_form_ar_name.
  ///
  /// In en, this message translates to:
  /// **'Arabic Name'**
  String get product_form_ar_name;

  /// No description provided for @product_form_optional_hint.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get product_form_optional_hint;

  /// No description provided for @product_form_select_category.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get product_form_select_category;

  /// No description provided for @product_form_base_unit.
  ///
  /// In en, this message translates to:
  /// **'Base Unit'**
  String get product_form_base_unit;

  /// No description provided for @product_form_selling_unit.
  ///
  /// In en, this message translates to:
  /// **'Selling Unit'**
  String get product_form_selling_unit;

  /// No description provided for @medical_info_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Medical Info'**
  String get medical_info_edit_title;

  /// No description provided for @medical_info_field_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter details (optional)'**
  String get medical_info_field_hint;

  /// No description provided for @medical_info_form_intro.
  ///
  /// In en, this message translates to:
  /// **'Fill in the relevant medical details. All fields are optional — leave any blank to omit.'**
  String get medical_info_form_intro;

  /// No description provided for @medical_info_section_usage.
  ///
  /// In en, this message translates to:
  /// **'Usage & Safety'**
  String get medical_info_section_usage;

  /// No description provided for @medical_info_section_usage_sub.
  ///
  /// In en, this message translates to:
  /// **'Indications, contraindications, and warnings'**
  String get medical_info_section_usage_sub;

  /// No description provided for @medical_info_section_effects.
  ///
  /// In en, this message translates to:
  /// **'Effects & Overdose'**
  String get medical_info_section_effects;

  /// No description provided for @medical_info_section_effects_sub.
  ///
  /// In en, this message translates to:
  /// **'Side effects and overdose handling'**
  String get medical_info_section_effects_sub;

  /// No description provided for @medical_info_section_populations.
  ///
  /// In en, this message translates to:
  /// **'Special Populations'**
  String get medical_info_section_populations;

  /// No description provided for @medical_info_section_populations_sub.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy and lactation safety'**
  String get medical_info_section_populations_sub;

  /// No description provided for @medical_info_section_dosage.
  ///
  /// In en, this message translates to:
  /// **'Dosage & Interactions'**
  String get medical_info_section_dosage;

  /// No description provided for @medical_info_section_dosage_sub.
  ///
  /// In en, this message translates to:
  /// **'Dose info and drug interactions'**
  String get medical_info_section_dosage_sub;

  /// No description provided for @medical_info_saved.
  ///
  /// In en, this message translates to:
  /// **'Medical info saved successfully.'**
  String get medical_info_saved;

  /// No description provided for @medical_info_deleted.
  ///
  /// In en, this message translates to:
  /// **'Medical info deleted successfully.'**
  String get medical_info_deleted;

  /// No description provided for @medical_info_delete_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Medical Info'**
  String get medical_info_delete_title;

  /// No description provided for @medical_info_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the medical info for this product?'**
  String get medical_info_delete_confirm;

  /// No description provided for @field_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get field_required;
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
