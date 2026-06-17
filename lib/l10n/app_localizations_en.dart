// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get error_network => 'No internet connection';

  @override
  String get error_timeout => 'Request timed out';

  @override
  String get error_unknown => 'Something went wrong, please try again';

  @override
  String get error_parsing => 'An error occurred while parsing data.';

  @override
  String error_too_many_attempts(String seconds) {
    return 'Too many attempts. Please try again in $seconds seconds.';
  }

  @override
  String get session_expired => 'Your session has expired. Please sign in again.';

  @override
  String get auth_invalid_credentials => 'The email or password you entered is incorrect.';

  @override
  String get auth_email_not_registered => 'Email is not registered';

  @override
  String get auth_wrong_password => 'Incorrect password';

  @override
  String get auth_email_already_exists => 'This email address is already in use.';

  @override
  String get auth_phone_already_exists => 'This phone number is already in use.';

  @override
  String get auth_email_not_verified => 'Please verify your email first. A new activation link has been sent to your inbox.';

  @override
  String get auth_invalid_reset_token => 'This password reset token is invalid or has expired.';

  @override
  String get auth_action_denied => 'This verification link is invalid or has expired.';

  @override
  String get auth_google_sign_in_failed => 'Google sign-in failed. Please try again.';

  @override
  String get splash_title => 'Pharmacy App';

  @override
  String get splash_subtitle => 'Pharmacy management system';

  @override
  String get onboarding_skip => 'Skip';

  @override
  String get onboarding_page1_title => 'Your Smart Pharmacy Partner';

  @override
  String get onboarding_page1_desc => 'Focus more on your patients while we handle the paperwork. Automate prescription logging and simplify your daily routine.';

  @override
  String get onboarding_page2_title => 'Real-Time Inventory Insights';

  @override
  String get onboarding_page2_desc => 'Never run out of essentials. Monitor stock levels and track sales performance with live analytics and automated alerts.';

  @override
  String get onboarding_page3_title => 'Secure & Organized Workflow';

  @override
  String get onboarding_page3_desc => 'Keep patient data protected with high-level encryption while managing your team’s schedule and appointments in one place.';

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

  @override
  String get password_atleast_one_letter => 'Password must contain at least one letter';

  @override
  String get agree_to => 'I agree to ';

  @override
  String get terms_and_conditions => 'Terms and Conditions';

  @override
  String get and => ' and ';

  @override
  String get privacy_policy => 'Privacy Policy';

  @override
  String get auth_login_success => 'Logged in successfully';

  @override
  String get auth_or => 'OR';

  @override
  String get auth_signin_with_google => 'Sign in with Google';

  @override
  String get auth_signup_account_title => 'Create a new account';

  @override
  String get auth_signup_account_subtitle => 'Begin your experience with us now.';

  @override
  String get auth_confirm_password_label => 'Confirm Password';

  @override
  String get auth_confirm_password_is_required => 'Confirm Password is required';

  @override
  String get auth_passwords_do_not_match => 'Passwords do not match';

  @override
  String get auth_next => 'Next';

  @override
  String get already_have_account => 'Already have an account? ';

  @override
  String get auth_signin => 'Sign In';

  @override
  String get auth_signup_subtitle2 => 'Personal Information & Licensing';

  @override
  String get first_name_label => 'First Name';

  @override
  String get last_name_label => 'Last Name';

  @override
  String get phone_number_label => 'Phone Number';

  @override
  String get first_name_hint => 'John';

  @override
  String get last_name_hint => 'Smith';

  @override
  String get auth_first_name_is_required => 'First name required';

  @override
  String get auth_last_name_is_required => 'Last name required';

  @override
  String get auth_phone_is_required => 'Phone number is required';

  @override
  String get auth_invalid_phone => 'Invalid phone number format';

  @override
  String get phone_label => 'Phone Number';

  @override
  String get pharmacy_name_label => 'Pharmacy Name';

  @override
  String get pharmacy_name_hint => 'John\'s Pharmacy';

  @override
  String get auth_pharmacy_name_is_required => 'Pharmacy name is required';

  @override
  String get auth_governorate_is_required => 'Governorate is required';

  @override
  String get auth_city_is_required => 'City is required';

  @override
  String get auth_governorate_label => 'Governorate';

  @override
  String get auth_city_label => 'City';

  @override
  String get create_account => 'Create Account';

  @override
  String get go_back => 'do you want to go back to the';

  @override
  String get login_screen => 'Login Screen';

  @override
  String get governorate_required => 'governorate  required';

  @override
  String get city_required => 'city  required';

  @override
  String get detailed_address_label => 'Detailed Address (Optional)';

  @override
  String get detailed_address_hint => 'Downtown, near the main square...';

  @override
  String get pharmacy_license_label => 'Pharmacy License Number';

  @override
  String get pharmacy_license_required => 'Pharmacy license number is required';

  @override
  String get emailSentTitle => 'Verify your email';

  @override
  String get emailSentTo => 'A verification link was sent to';

  @override
  String get emailInstruction => 'Open your email and tap the verification link to complete registration';

  @override
  String get resendLink => 'Resend link';

  @override
  String get didnt_find_email => 'Didn’t find the email? Check your spam folder or try again later';

  @override
  String get continue_btn => 'Continue';

  @override
  String get email_verification_success => 'Email verified successfully. You can now log in.';

  @override
  String you_can_resend_after(String seconds) {
    return 'you can resend after $seconds seconds';
  }

  @override
  String get couldnt_resend_link => 'Couldn\'t resend the  link. Please try again later.';

  @override
  String get resend_link_success => 'Link resent successfully. Please check your email.';

  @override
  String get forgot_password_title => 'Forgot your password?';

  @override
  String get forgot_password_subtitle => 'Enter your email to receive a password reset link';

  @override
  String get send_reset_password_link => 'Send Reset Password Link';

  @override
  String get remembered_password => 'Remembered your password? ';

  @override
  String get reset_password_sent_subtitle => 'we have sent reset password link to';

  @override
  String get reset_password_sent_instruction => 'Open your email and click the reset password link to continue';

  @override
  String get reset_password_title => 'Reset your password';

  @override
  String get reset_password_subtitle => 'enter your new password and make sure to choose a strong one to keep your account secure';

  @override
  String get new_password_label => 'New Password';

  @override
  String get reset_password_btn => 'Reset Password';

  @override
  String get reset_password_success => 'Password reset successfully. Please SignIn with your new password.';

  @override
  String get changed_your_mind => 'Changed your mind? go back to ';

  @override
  String get complete_profile_title => 'Complete Profile Details';

  @override
  String get complete_profile_btn => 'Complete Profile';

  @override
  String get signin_success_no_details => 'Signed in successfully please complete your profile details to continue';

  @override
  String get complete_profile_success => 'Profile completed successfully. You can now access the app.';

  @override
  String get coomplete_profile_error => 'An error occurred while completing your profile. Please try again.';

  @override
  String get auth_google_sign_in_canceled => 'Google sign-in was canceled. You can try again if you wish.';

  @override
  String get invalid_password_reset_link => 'This password reset link is invalid or has expired.';

  @override
  String get email_already_verified => 'This email address has already been verified. Please log in.';

  @override
  String get invalid_link => 'The link is invalid or has expired please try again with new Link.';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get sales => 'Sales';

  @override
  String get inventory => 'Inventory';

  @override
  String get reports => 'Reports';

  @override
  String get settings => 'Settings';

  @override
  String get welcome => 'Welcome back';

  @override
  String get here_is_your_pharmacy_summary => 'Here\'s your pharmacy summary for today';

  @override
  String get today_revenue => 'Today\'s Revenue';

  @override
  String get from_yesterday => 'from yesterday';

  @override
  String get sp => 'SP';

  @override
  String get invoice => 'Invoice';

  @override
  String get units_sold => 'Units Sold';

  @override
  String get avg_invoice_value => 'Avg. Invoice';

  @override
  String get yesterday_revenue => 'Yesterday\'s Revenue';

  @override
  String get this_week => 'this week';

  @override
  String get total_items => 'Total Items';

  @override
  String get out_of_stock => 'Out of Stock';

  @override
  String get items_in_stock => 'Items in Stock';

  @override
  String get total_sales => 'Total Sales';

  @override
  String get today_sales => 'Today\'s Sales';

  @override
  String get stock_alerts => 'Stock Alerts';

  @override
  String get weekly_revenue => 'Weekly Revenue';

  @override
  String get today => 'Today';

  @override
  String get prevs_day => 'Prev. Days';

  @override
  String get recent_transactions => 'Recent Transactions';

  @override
  String get view_all => 'View All';

  @override
  String get stock_alerts_title => 'Stock Alerts';

  @override
  String get manage_inventory => 'Manage Inventory';

  @override
  String get low => 'Low';

  @override
  String get critical => 'Critical';

  @override
  String get out => 'Out';
}
