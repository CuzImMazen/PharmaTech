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

  @override
  String get inventory_search_hint => 'Search by name';

  @override
  String get inventory_unit => 'Unit';

  @override
  String get inventory_price => 'Price (SP)';

  @override
  String get inventory_expiry => 'Expiry';

  @override
  String get inventory_stock_level => 'Stock Level :';

  @override
  String get inventory_stock_min_suffix => ' (Min)';

  @override
  String get inventory_no_products => 'No products found.';

  @override
  String get inventory_load_error => 'Unable to load products right now.';

  @override
  String get inventory_retry => 'Retry';

  @override
  String get filter_filters => 'Filters';

  @override
  String get filter_filters_and_sort => 'Filters & Sort';

  @override
  String get filter_reset => 'Reset';

  @override
  String get filter_reset_title => 'Reset filters?';

  @override
  String get filter_reset_message => 'This will clear all selected filters. This action cannot be undone.';

  @override
  String get filter_cancel => 'Cancel';

  @override
  String get filter_show_results => 'Show Results';

  @override
  String get filter_loading => 'Loading filters...';

  @override
  String get filter_section_failed => 'Couldn\'t load';

  @override
  String get filter_retry => 'Retry';

  @override
  String get filter_all => 'All';

  @override
  String get filter_category => 'Category';

  @override
  String get filter_stock_status => 'Stock Status';

  @override
  String get filter_price_range => 'Price Range (SP)';

  @override
  String get filter_expiry_date => 'Expiry Date';

  @override
  String get filter_package_unit => 'Package Unit';

  @override
  String get filter_company => 'Company';

  @override
  String get filter_prescription => 'Prescription';

  @override
  String get filter_rx_only => 'Rx-Only';

  @override
  String get filter_non_rx => 'Non-Rx';

  @override
  String get filter_from => 'From';

  @override
  String get filter_to => 'To';

  @override
  String get filter_stock_available => 'Available';

  @override
  String get filter_stock_low => 'Low';

  @override
  String get filter_stock_out => 'Out';

  @override
  String get filter_expiry_expired => 'Expired';

  @override
  String get filter_expiry_30_days => '30 days';

  @override
  String get filter_expiry_60_days => '60 days';

  @override
  String get filter_expiry_90_days => '90 days';

  @override
  String get filter_expiry_6_months => '6 months';

  @override
  String get sort_name_asc => 'Name A→Z';

  @override
  String get sort_name_desc => 'Name Z→A';

  @override
  String get sort_price_asc => 'Price ↑';

  @override
  String get sort_price_desc => 'Price ↓';

  @override
  String get sort_stock_asc => 'Stock ↑';

  @override
  String get sort_stock_desc => 'Stock ↓';

  @override
  String get sort_expiry_soon => 'Exp Soon';

  @override
  String get sort_expiry_late => 'Exp Late';

  @override
  String get stock_status_available => 'Available';

  @override
  String get stock_status_low => 'Low';

  @override
  String get stock_status_out => 'Out';

  @override
  String get detail_not_available => '—';

  @override
  String get detail_edit => 'Edit';

  @override
  String get detail_delete => 'Delete';

  @override
  String get detail_tab_overview => 'Overview';

  @override
  String get detail_tab_batches => 'Stock';

  @override
  String get detail_tab_medical => 'Medical Info';

  @override
  String get detail_section_product_info => 'Product Information';

  @override
  String get detail_section_pricing => 'Pricing';

  @override
  String get detail_section_inventory => 'Inventory';

  @override
  String get detail_barcode => 'Barcode';

  @override
  String get detail_scientific_name => 'Scientific Name';

  @override
  String get detail_strength => 'Strength';

  @override
  String get detail_company => 'Company';

  @override
  String get detail_category => 'Category';

  @override
  String get detail_shelf => 'Shelf';

  @override
  String get detail_prescription => 'Prescription';

  @override
  String get detail_yes => 'Yes';

  @override
  String get detail_no => 'No';

  @override
  String get detail_buying_price => 'Buying Price';

  @override
  String get detail_selling_price => 'Selling Price';

  @override
  String get detail_tax => 'Tax Rate';

  @override
  String get detail_discount => 'Discount Rate';

  @override
  String get detail_total_quantity => 'Total Quantity';

  @override
  String get detail_min_stock => 'Min. Stock';

  @override
  String get detail_units_per_base => 'Units per Base';

  @override
  String get detail_nearest_expiry => 'Nearest Expiry';

  @override
  String get detail_allow_partial_selling => 'Allow Partial Selling';

  @override
  String detail_batches_count(int count) {
    return '$count batches';
  }

  @override
  String get detail_add_batch => 'Add Batch';

  @override
  String get detail_no_batches => 'No batches available';

  @override
  String get detail_batch_id => 'Batch';

  @override
  String get detail_received_date => 'Received';

  @override
  String get detail_expiry => 'Expiry';

  @override
  String get detail_quantity_on_hand => 'On Hand';

  @override
  String get detail_purchase_price => 'Purchase Price';

  @override
  String get detail_batch_selling_price => 'Selling Price';

  @override
  String get detail_batch_added => 'Batch added successfully.';

  @override
  String get detail_batch_marked_expired => 'Batch marked as expired.';

  @override
  String get detail_add_batch_title => 'Add New Batch';

  @override
  String get detail_add_batch_subtitle => 'Record a manual stock-in adjustment for this product.';

  @override
  String get detail_add_batch_section => 'Batch Details';

  @override
  String get detail_add_batch_section_sub => 'Quantity, pricing, and optional batch info';

  @override
  String get detail_add_batch_notes => 'Notes';

  @override
  String get detail_tab_movements => 'Movements';

  @override
  String get detail_no_movements => 'No stock movements yet.';

  @override
  String get movement_purchase_in => 'Purchase In';

  @override
  String get movement_customer_return_in => 'Customer Return In';

  @override
  String get movement_adjustment_in => 'Adjustment In';

  @override
  String get movement_sale_return_in => 'Sale Return In';

  @override
  String get movement_sale_out => 'Sale Out';

  @override
  String get movement_supplier_return_out => 'Supplier Return Out';

  @override
  String get movement_adjustment_out => 'Adjustment Out';

  @override
  String get movement_expiry_out => 'Expiry Out';

  @override
  String get stock_alerts_loading => 'Loading stock alerts…';

  @override
  String get stock_alerts_error => 'Couldn\'t load stock alerts.';

  @override
  String get stock_alerts_empty => 'All products are well stocked.';

  @override
  String stock_alerts_count(int count) {
    return '$count low-stock items';
  }

  @override
  String get detail_batch_status_active => 'Active';

  @override
  String get detail_batch_status_expired => 'Expired';

  @override
  String get detail_batch_status_depleted => 'Depleted';

  @override
  String get detail_batch_status_inactive => 'Inactive';

  @override
  String get detail_medical_empty_title => 'No Medical Info';

  @override
  String get detail_medical_empty_subtitle => 'Add medical information for this product to keep it available here.';

  @override
  String get detail_add_medical_info => 'Add Medical Info';

  @override
  String get detail_medical_indications => 'Indications';

  @override
  String get detail_medical_contraindications => 'Contraindications';

  @override
  String get detail_medical_warnings => 'Warnings';

  @override
  String get detail_medical_side_effects => 'Side Effects';

  @override
  String get detail_medical_overdose => 'Overdose';

  @override
  String get detail_medical_pregnancy_safety => 'Pregnancy Safety';

  @override
  String get detail_medical_lactation_safety => 'Lactation Safety';

  @override
  String get detail_medical_drug_interactions => 'Drug Interactions';

  @override
  String get detail_medical_dose_info => 'Dose Info';

  @override
  String get detail_save => 'Save';

  @override
  String get detail_cancel => 'Cancel';

  @override
  String get product_add_title => 'Add Product';

  @override
  String get product_edit_title => 'Edit Product';

  @override
  String get product_create => 'Create';

  @override
  String get product_created => 'Product created successfully.';

  @override
  String get product_saved => 'Product updated successfully.';

  @override
  String get product_deleted => 'Product deleted successfully.';

  @override
  String get product_delete_title => 'Delete Product';

  @override
  String get product_delete_confirm => 'Are you sure you want to delete this product? This can be undone by restoring it later.';

  @override
  String get product_form_section_basic => 'Basic Information';

  @override
  String get product_form_section_basic_sub => 'Identity and naming';

  @override
  String get product_form_section_classification => 'Classification';

  @override
  String get product_form_section_classification_sub => 'Category, company, and units';

  @override
  String get product_form_section_pricing_sub => 'Cost, price, tax, and discount';

  @override
  String get product_form_section_inventory_sub => 'Stock thresholds and storage';

  @override
  String get product_form_barcode_hint => 'e.g. 123456789';

  @override
  String get product_form_brand_name => 'Brand Name';

  @override
  String get product_form_brand_name_hint => 'e.g. Amoxil 500mg';

  @override
  String get product_form_ar_name => 'Arabic Name';

  @override
  String get product_form_optional_hint => 'Optional';

  @override
  String get product_form_select_category => 'Select a category';

  @override
  String get product_form_base_unit => 'Base Unit';

  @override
  String get product_form_selling_unit => 'Selling Unit';

  @override
  String get medical_info_edit_title => 'Edit Medical Info';

  @override
  String get medical_info_field_hint => 'Enter details (optional)';

  @override
  String get medical_info_form_intro => 'Fill in the relevant medical details. All fields are optional — leave any blank to omit.';

  @override
  String get medical_info_section_usage => 'Usage & Safety';

  @override
  String get medical_info_section_usage_sub => 'Indications, contraindications, and warnings';

  @override
  String get medical_info_section_effects => 'Effects & Overdose';

  @override
  String get medical_info_section_effects_sub => 'Side effects and overdose handling';

  @override
  String get medical_info_section_populations => 'Special Populations';

  @override
  String get medical_info_section_populations_sub => 'Pregnancy and lactation safety';

  @override
  String get medical_info_section_dosage => 'Dosage & Interactions';

  @override
  String get medical_info_section_dosage_sub => 'Dose info and drug interactions';

  @override
  String get medical_info_saved => 'Medical info saved successfully.';

  @override
  String get medical_info_deleted => 'Medical info deleted successfully.';

  @override
  String get medical_info_delete_title => 'Delete Medical Info';

  @override
  String get medical_info_delete_confirm => 'Are you sure you want to delete the medical info for this product?';

  @override
  String get settings_pharmacy => 'Pharmacy';

  @override
  String get settings_suppliers => 'Suppliers';

  @override
  String get suppliers_title => 'Suppliers';

  @override
  String get suppliers_search_hint => 'Search suppliers';

  @override
  String get suppliers_show_deleted => 'Show deleted';

  @override
  String get suppliers_empty => 'No suppliers yet.';

  @override
  String get suppliers_empty_hint => 'Add your first supplier to start purchasing.';

  @override
  String get suppliers_add => 'Add Supplier';

  @override
  String get suppliers_load_error => 'Unable to load suppliers right now.';

  @override
  String get supplier_add_title => 'Add Supplier';

  @override
  String get supplier_edit_title => 'Edit Supplier';

  @override
  String get supplier_section => 'Supplier Details';

  @override
  String get supplier_section_sub => 'Name, company, and contact info';

  @override
  String get supplier_name => 'Supplier Name';

  @override
  String get supplier_company => 'Company';

  @override
  String get supplier_phone => 'Phone';

  @override
  String get supplier_email => 'Email';

  @override
  String get supplier_address => 'Address';

  @override
  String get supplier_notes => 'Notes';

  @override
  String get supplier_created => 'Supplier created successfully.';

  @override
  String get supplier_updated => 'Supplier updated successfully.';

  @override
  String get supplier_deleted => 'Supplier deleted successfully.';

  @override
  String get supplier_restored => 'Supplier restored successfully.';

  @override
  String get supplier_restore => 'Restore';

  @override
  String get supplier_delete_title => 'Delete Supplier';

  @override
  String get supplier_delete_confirm => 'Are you sure you want to delete this supplier?';

  @override
  String get settings_appearance => 'Appearance';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_account => 'Account';

  @override
  String get theme_system => 'System';

  @override
  String get theme_light => 'Light';

  @override
  String get theme_dark => 'Dark';

  @override
  String get language_system => 'System';

  @override
  String get language_english => 'English';

  @override
  String get language_arabic => 'Arabic';

  @override
  String get sign_out => 'Sign Out';

  @override
  String get sign_out_confirm_title => 'Sign Out?';

  @override
  String get sign_out_confirm => 'Are you sure you want to sign out?';

  @override
  String get sign_out_failed => 'Sign out failed. Please try again.';

  @override
  String get sign_out_all => 'Log out of all devices';

  @override
  String get sign_out_all_confirm_title => 'Log out everywhere?';

  @override
  String get sign_out_all_confirm => 'This signs you out of every device and session. You\'ll need to sign in again on all of them. Continue?';

  @override
  String get field_required => 'This field is required';

  @override
  String get settings_operations => 'Operations';

  @override
  String get settings_purchase_invoices => 'Purchase Invoices';

  @override
  String get settings_supplier_debts => 'Supplier Debts';

  @override
  String get settings_cash_box => 'Cash Box';

  @override
  String get settings_stock_adjustments => 'Stock Adjustments';

  @override
  String get settings_bulk_adjustment => 'Bulk Stock Adjustment';

  @override
  String get cash_box_title => 'Cash Box';

  @override
  String get cash_box_current_balance => 'Current Balance';

  @override
  String get cash_box_opening_balance => 'Opening Balance';

  @override
  String get cash_box_net_change => 'Net Change';

  @override
  String get cash_box_create => 'Create Cash Box';

  @override
  String get cash_box_created => 'Cash box created successfully.';

  @override
  String get cash_box_opening_balance_invalid => 'Enter a valid opening balance (0 or more).';

  @override
  String get cash_box_no_box_title => 'No Cash Box Yet';

  @override
  String get cash_box_no_box_hint => 'Create your pharmacy\'s cash box to start tracking cash movements.';

  @override
  String get cash_box_no_transactions => 'No transactions yet.';

  @override
  String get cash_box_all_types => 'All';

  @override
  String get cash_tx_purchase_out => 'Purchase Out';

  @override
  String get cash_tx_sale_in => 'Sale In';

  @override
  String get cash_tx_customer_return_out => 'Customer Return Out';

  @override
  String get cash_tx_supplier_return_in => 'Supplier Return In';

  @override
  String get cash_tx_customer_debt_payment_in => 'Customer Debt Payment In';

  @override
  String get cash_tx_supplier_debt_payment_out => 'Supplier Debt Payment Out';

  @override
  String get cash_tx_manual_in => 'Manual In';

  @override
  String get cash_tx_manual_out => 'Manual Out';

  @override
  String get debts_title => 'Supplier Debts';

  @override
  String get debts_empty => 'No supplier debts.';

  @override
  String get debts_empty_hint => 'Debts appear when you record a purchase invoice on credit.';

  @override
  String get debts_load_error => 'Unable to load supplier debts right now.';

  @override
  String get debts_filter_supplier => 'Supplier';

  @override
  String get debts_filter_status => 'Status';

  @override
  String get stock_adjustments_title => 'Stock Adjustments';

  @override
  String get stock_adjustments_empty => 'No stock adjustments yet.';

  @override
  String get stock_adjustments_empty_hint => 'Manual stock corrections you record will appear here.';

  @override
  String get stock_adjustments_load_error => 'Unable to load stock adjustments right now.';

  @override
  String get debt_total_amount => 'Total Amount';

  @override
  String get debt_paid_amount => 'Paid';

  @override
  String get debt_remaining_amount => 'Remaining';

  @override
  String get debt_due_date => 'Due Date';

  @override
  String get debt_no_due_date => 'No due date';

  @override
  String get debt_status_open => 'Open';

  @override
  String get debt_status_partial => 'Partial';

  @override
  String get debt_status_paid => 'Paid';

  @override
  String get debt_status_overdue => 'Overdue';

  @override
  String get debt_status_cancelled => 'Cancelled';

  @override
  String get debt_payments_title => 'Payments';

  @override
  String get debt_no_payments => 'No payments recorded yet.';

  @override
  String get debt_payment_date => 'Payment Date';

  @override
  String get debt_payment_amount => 'Amount';

  @override
  String get invoices_title => 'Purchase Invoices';

  @override
  String get invoices_empty => 'No purchase invoices yet.';

  @override
  String get invoices_empty_hint => 'Record your first purchase to start tracking stock and costs.';

  @override
  String get invoices_load_error => 'Unable to load purchase invoices right now.';

  @override
  String get invoices_search_hint => 'Search invoices';

  @override
  String get invoices_add => 'Add Invoice';

  @override
  String get invoice_invoice_number => 'Invoice No.';

  @override
  String get invoice_date => 'Invoice Date';

  @override
  String get invoice_supplier => 'Supplier';

  @override
  String get invoice_subtotal => 'Subtotal';

  @override
  String get invoice_tax_total => 'Tax';

  @override
  String get invoice_discount_total => 'Discount';

  @override
  String get invoice_grand_total => 'Grand Total';

  @override
  String get invoice_amount_paid => 'Amount Paid';

  @override
  String get invoice_amount_due => 'Amount Due';

  @override
  String get invoice_payment_method => 'Payment Method';

  @override
  String get invoice_payment_status => 'Payment Status';

  @override
  String get invoice_status => 'Status';

  @override
  String get invoice_items => 'Items';

  @override
  String get invoice_no_items => 'No items.';

  @override
  String get invoice_notes => 'Notes';

  @override
  String get invoice_cancel => 'Cancel Invoice';

  @override
  String get invoice_cancel_title => 'Cancel Invoice?';

  @override
  String get invoice_cancel_confirm => 'Cancelling this invoice reverses its stock batches and refunds any cash paid. This cannot be undone.';

  @override
  String get invoice_cancelled => 'Invoice cancelled successfully.';

  @override
  String get invoice_already_cancelled => 'This invoice is already cancelled.';

  @override
  String get invoice_status_completed => 'Completed';

  @override
  String get invoice_status_cancelled => 'Cancelled';

  @override
  String get invoice_status_pending => 'Pending';

  @override
  String get invoice_payment_status_paid => 'Paid';

  @override
  String get invoice_payment_status_partial => 'Partial';

  @override
  String get invoice_payment_status_unpaid => 'Unpaid';

  @override
  String get invoice_payment_method_cash => 'Cash';

  @override
  String get invoice_payment_method_credit => 'Credit';

  @override
  String get invoice_payment_method_debt => 'Debt';

  @override
  String get invoice_add_title => 'New Purchase Invoice';

  @override
  String get invoice_section_main => 'Invoice Details';

  @override
  String get invoice_section_main_sub => 'Supplier, date, and payment';

  @override
  String get invoice_section_items => 'Items';

  @override
  String get invoice_section_items_sub => 'Products, quantities, and pricing';

  @override
  String get invoice_select_supplier => 'Select a supplier';

  @override
  String get invoice_item_product => 'Product';

  @override
  String get invoice_item_quantity => 'Quantity';

  @override
  String get invoice_item_wholesale_price => 'Wholesale Price';

  @override
  String get invoice_item_tax => 'Tax';

  @override
  String get invoice_item_discount => 'Discount';

  @override
  String get invoice_item_batch_number => 'Batch No.';

  @override
  String get invoice_item_expiry_date => 'Expiry Date';

  @override
  String get invoice_item_selling_price => 'Selling Price';

  @override
  String get invoice_item_optional => 'Optional';

  @override
  String get invoice_item_add => 'Add Item';

  @override
  String get invoice_item_remove => 'Remove';

  @override
  String get invoice_totals_summary => 'Summary';

  @override
  String get invoice_amount_paid_hint => 'Amount paid now (cannot exceed grand total)';

  @override
  String get invoice_created => 'Purchase invoice created successfully.';

  @override
  String get invoice_amount_paid_invalid => 'Enter a valid amount paid (0 or more).';

  @override
  String get invoice_amount_paid_exceeds_total => 'Amount paid cannot exceed the grand total.';

  @override
  String get invoice_no_items_added => 'Add at least one item.';

  @override
  String get invoice_item_product_required => 'Select a product for each item.';

  @override
  String get invoice_item_quantity_required => 'Quantity must be at least 1.';

  @override
  String get invoice_item_price_required => 'Wholesale price is required.';

  @override
  String get remove_stock => 'Remove Stock';

  @override
  String get remove_stock_title => 'Remove Stock';

  @override
  String get remove_stock_subtitle => 'Record a manual stock-out adjustment for this product.';

  @override
  String get remove_stock_section => 'Batch & Quantity';

  @override
  String get remove_stock_section_sub => 'Select a batch and the quantity to remove';

  @override
  String get remove_stock_batch => 'Batch';

  @override
  String get remove_stock_quantity => 'Quantity to remove';

  @override
  String get remove_stock_notes => 'Notes';

  @override
  String get remove_stock_too_much => 'Quantity cannot exceed the batch on-hand quantity.';

  @override
  String get remove_stock_no_batches => 'No batches with available stock.';

  @override
  String get stock_removed => 'Stock removed successfully.';

  @override
  String get bulk_adjustment_title => 'Bulk Stock Adjustment';

  @override
  String get bulk_adjustment_subtitle => 'Apply several add/remove adjustments in one transaction. All rows commit together or none do.';

  @override
  String get bulk_adjustment_section => 'Adjustments';

  @override
  String get bulk_adjustment_section_sub => 'One row per product';

  @override
  String get bulk_adjustment_saved => 'Bulk adjustment applied successfully.';

  @override
  String get bulk_apply => 'Apply Adjustments';

  @override
  String get bulk_add => 'Add';

  @override
  String get bulk_remove => 'Remove';

  @override
  String get bulk_no_items => 'Add at least one adjustment.';

  @override
  String get bulk_add_item => 'Add adjustment';

  @override
  String get bulk_item_product => 'Product';

  @override
  String get bulk_item_product_hint => 'Select product';

  @override
  String get bulk_item_product_required => 'Select a product.';

  @override
  String get bulk_item_quantity => 'Quantity';

  @override
  String get bulk_item_qty_required => 'Enter a valid quantity (1 or more).';

  @override
  String get bulk_item_purchase_price => 'Purchase price';

  @override
  String get bulk_item_selling_price => 'Selling price';

  @override
  String get bulk_item_price_required => 'Enter purchase and selling price.';

  @override
  String get bulk_item_batch => 'Batch';

  @override
  String get bulk_item_no_batches => 'No batches with available stock.';

  @override
  String get bulk_item_batch_required => 'Select a batch.';

  @override
  String get bulk_item_batch_details => 'Batch details';

  @override
  String get bulk_item_batch_number => 'Batch number';

  @override
  String get bulk_item_expiry_date => 'Expiry date';

  @override
  String get bulk_item_notes => 'Notes';

  @override
  String get bulk_item_optional => 'optional';

  @override
  String get detail_remove_batch => 'Remove Stock';

  @override
  String get inventory_show_deleted => 'Show deleted';

  @override
  String get restore => 'Restore';

  @override
  String get restore_product_title => 'Restore Product';

  @override
  String get product_restore => 'Restore';

  @override
  String get product_restore_confirm => 'Restore this product? It will become active again.';

  @override
  String get product_restored => 'Product restored successfully.';

  @override
  String get product_deleted_pill => 'Deleted';

  @override
  String get profile => 'Profile';

  @override
  String get profile_title => 'Profile';

  @override
  String get profile_verified => 'Verified';

  @override
  String get profile_not_verified => 'Not verified';

  @override
  String get profile_phone => 'Phone';

  @override
  String get profile_email => 'Email';

  @override
  String get profile_name => 'Name';

  @override
  String get profile_load_error => 'Could not load profile.';

  @override
  String get scan => 'Scan';

  @override
  String get scan_barcode => 'Scan Barcode';

  @override
  String get scan_title => 'Scan a product barcode';

  @override
  String get scan_not_found => 'No product found';

  @override
  String get scan_not_found_offer_create => 'No product matches this barcode. Would you like to create a new product with this barcode?';

  @override
  String get scan_create => 'Create Product';

  @override
  String get scan_enter_manually => 'Enter manually';

  @override
  String get scan_camera_permission_denied => 'Camera permission was denied. You can enter the barcode manually.';

  @override
  String get scan_looking_up => 'Looking up product…';

  @override
  String get operations_title => 'Operations';

  @override
  String get operations_sales => 'Sales';

  @override
  String get operations_purchasing => 'Purchasing';

  @override
  String get operations_cash_and_stock => 'Cash & Stock';

  @override
  String get settings_customers => 'Customers';

  @override
  String get settings_sales_invoices => 'Sales Invoices';

  @override
  String get customers_title => 'Customers';

  @override
  String get customers_search_hint => 'Search customers';

  @override
  String get customers_show_deleted => 'Show deleted';

  @override
  String get customers_empty => 'No customers yet.';

  @override
  String get customers_empty_hint => 'Add your first customer to start selling on credit.';

  @override
  String get customers_add => 'Add Customer';

  @override
  String get customer_add_title => 'Add Customer';

  @override
  String get customer_edit_title => 'Edit Customer';

  @override
  String get customer_section => 'Customer Details';

  @override
  String get customer_section_sub => 'Name and contact info';

  @override
  String get customer_name => 'Customer Name';

  @override
  String get customer_phone => 'Phone';

  @override
  String get customer_notes => 'Notes';

  @override
  String get customer_created => 'Customer created successfully.';

  @override
  String get customer_updated => 'Customer updated successfully.';

  @override
  String get customer_deleted => 'Customer deleted successfully.';

  @override
  String get customer_restored => 'Customer restored successfully.';

  @override
  String get customer_restore => 'Restore';

  @override
  String get customer_delete_title => 'Delete Customer';

  @override
  String get customer_delete_confirm => 'Are you sure you want to delete this customer?';

  @override
  String get sales_invoices_title => 'Sales Invoices';

  @override
  String get sales_invoices_empty => 'No sales invoices yet.';

  @override
  String get sales_invoices_empty_hint => 'Record your first sale to start tracking revenue and stock.';

  @override
  String get sales_invoices_add => 'New Sale';

  @override
  String get sales_invoice_add_title => 'New Sale';

  @override
  String get sales_invoice_section_main => 'Sale Details';

  @override
  String get sales_invoice_section_main_sub => 'Customer, date, and payment';

  @override
  String get sales_invoice_section_items_sub => 'Products, quantities, and pricing';

  @override
  String get sales_invoice_customer => 'Customer';

  @override
  String get sales_invoice_select_customer => 'Select a customer (required if not fully paid)';

  @override
  String get sales_invoice_due_date => 'Due Date';

  @override
  String get sales_invoice_optional => 'Optional';

  @override
  String get sales_invoice_customer_debt => 'Customer Debt';

  @override
  String get sales_invoice_cancelled => 'Invoice cancelled successfully.';

  @override
  String get sales_invoice_already_cancelled => 'This invoice is already cancelled.';

  @override
  String get sales_invoice_cancel => 'Cancel Invoice';

  @override
  String get sales_invoice_cancel_title => 'Cancel Invoice?';

  @override
  String get sales_invoice_cancel_confirm => 'Cancelling this sale reverses its stock decrement and refunds any cash paid. This cannot be undone.';

  @override
  String get sales_invoice_created => 'Sale recorded successfully.';

  @override
  String get sales_invoice_item_selling_price => 'Selling Price';

  @override
  String get sales_invoice_no_items_added => 'Add at least one item.';

  @override
  String get sales_invoice_item_product_required => 'Select a product for each item.';

  @override
  String get sales_invoice_item_quantity_required => 'Quantity must be at least 1.';

  @override
  String get sales_invoice_item_price_required => 'Selling price must be greater than 0.';

  @override
  String get sales_invoice_amount_paid_invalid => 'Enter a valid amount paid (0 or more).';

  @override
  String get sales_invoice_amount_paid_exceeds_total => 'Amount paid cannot exceed the grand total.';

  @override
  String get sales_invoice_customer_required_unpaid => 'Select a customer — a customer is required when the sale isn\'t fully paid.';
}
