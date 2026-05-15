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
  String error_too_many_attempts(String seconds) {
    return 'Too many attempts. Please try again in $seconds seconds.';
  }

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
  String get auth_passwords_do_not_match => 'Passwords do not match';

  @override
  String get auth_confirm_password_is_required => 'Confirm Password is required';

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
  String get gov_damascus => 'Damascus';

  @override
  String get gov_rural_damascus => 'Rural Damascus';

  @override
  String get gov_aleppo => 'Aleppo';

  @override
  String get gov_homs => 'Homs';

  @override
  String get gov_hama => 'Hama';

  @override
  String get gov_latakia => 'Latakia';

  @override
  String get gov_tartous => 'Tartous';

  @override
  String get gov_idlib => 'Idlib';

  @override
  String get gov_daraa => 'Daraa';

  @override
  String get gov_deir_ezzor => 'Deir Ezzor';

  @override
  String get gov_raqqa => 'Raqqa';

  @override
  String get gov_hasakah => 'Hasakah';

  @override
  String get city_damascus_mazzeh => 'Mazzeh';

  @override
  String get city_damascus_kafrsouseh => 'Kafr Souseh';

  @override
  String get city_damascus_barzeh => 'Barzeh';

  @override
  String get city_damascus_meidan => 'Meidan';

  @override
  String get city_damascus_ruken_al_din => 'Ruken Al-Din';

  @override
  String get city_damascus_bab_touma => 'Bab Touma';

  @override
  String get city_damascus_bab_sharqi => 'Bab Sharqi';

  @override
  String get city_damascus_tishreen => 'Tishreen';

  @override
  String get city_damascus_al_qanawat => 'Al-Qanawat';

  @override
  String get city_damascus_abu_rummaneh => 'Abu Rummaneh';

  @override
  String get city_damascus_shaalan => 'Shaalan';

  @override
  String get city_damascus_dummar => 'Dummar';

  @override
  String get city_damascus_al_midan => 'Al-Midan';

  @override
  String get city_damascus_kassaa => 'Kassaa';

  @override
  String get city_damascus_old_damascus => 'Old Damascus';

  @override
  String get city_damascus_qasioun => 'Qasioun';

  @override
  String get city_damascus_adawi => 'Adawi';

  @override
  String get city_damascus_al_amara => 'Al-Amara';

  @override
  String get city_damascus_abu_jamal => 'Abu Jamal';

  @override
  String get city_damascus_harika => 'Harika';

  @override
  String get city_rural_damascus_douma => 'Douma';

  @override
  String get city_rural_damascus_harasta => 'Harasta';

  @override
  String get city_rural_damascus_zamalka => 'Zamalka';

  @override
  String get city_rural_damascus_jobar => 'Jobar';

  @override
  String get city_rural_damascus_qaboun => 'Qaboun';

  @override
  String get city_rural_damascus_madaya => 'Madaya';

  @override
  String get city_rural_damascus_zabadani => 'Zabadani';

  @override
  String get city_rural_damascus_wafideen => 'Wafideen';

  @override
  String get city_rural_damascus_sayyida_zeinab => 'Sayyida Zeinab';

  @override
  String get city_rural_damascus_darayya => 'Darayya';

  @override
  String get city_rural_damascus_moadamiyeh => 'Moadamiyeh';

  @override
  String get city_rural_damascus_qatana => 'Qatana';

  @override
  String get city_rural_damascus_kiswah => 'Kiswah';

  @override
  String get city_rural_damascus_dmeir => 'Dmeir';

  @override
  String get city_rural_damascus_al_tall => 'Al-Tall';

  @override
  String get city_rural_damascus_arbin => 'Arbin';

  @override
  String get city_rural_damascus_haran_al_awamid => 'Haran Al-Awamid';

  @override
  String get city_rural_damascus_yabroud => 'Yabroud';

  @override
  String get city_rural_damascus_an_nabk => 'An-Nabk';

  @override
  String get city_rural_damascus_deir_atiyah => 'Deir Atiyah';

  @override
  String get city_rural_damascus_jayrud => 'Jayrud';

  @override
  String get city_rural_damascus_assal_al_ward => 'Assal Al-Ward';

  @override
  String get city_aleppo_salah_al_din => 'Salah al-Din';

  @override
  String get city_aleppo_hanano => 'Hanano';

  @override
  String get city_aleppo_ashrafiyeh => 'Ashrafiyeh';

  @override
  String get city_aleppo_aziziyeh => 'Aziziyeh';

  @override
  String get city_aleppo_seif_al_dawla => 'Seif al-Dawla';

  @override
  String get city_aleppo_al_furqan => 'Al-Furqan';

  @override
  String get city_aleppo_al_hamdaniya => 'Al-Hamdaniya';

  @override
  String get city_aleppo_al_sukari => 'Al-Sukari';

  @override
  String get city_aleppo_al_shaar => 'Al-Shaar';

  @override
  String get city_aleppo_al_jamiliyeh => 'Al-Jamiliyeh';

  @override
  String get city_aleppo_karm_al_jabal => 'Karm al-Jabal';

  @override
  String get city_aleppo_al_midan => 'Al-Midan';

  @override
  String get city_aleppo_sheikh_maqsood => 'Sheikh Maqsood';

  @override
  String get city_aleppo_bustan_al_qasr => 'Bustan al-Qasr';

  @override
  String get city_aleppo_al_aziziyah => 'Al-Aziziyah';

  @override
  String get city_aleppo_new_aleppo => 'New Aleppo';

  @override
  String get city_aleppo_old_city => 'Old City';

  @override
  String get city_aleppo_sheikh_najjar => 'Sheikh Najjar';

  @override
  String get city_aleppo_khan_al_asal => 'Khan al-Asal';

  @override
  String get city_aleppo_ramousah => 'Ramousah';

  @override
  String get city_aleppo_layramoun => 'Layramoun';

  @override
  String get city_aleppo_al_layramoun => 'Al-Layramoun';

  @override
  String get city_aleppo_al_haydariyah => 'Al-Haydariyah';

  @override
  String get city_homs_al_inshaat => 'Al-Inshaat';

  @override
  String get city_homs_al_waer => 'Al-Waer';

  @override
  String get city_homs_al_hamra => 'Al-Hamra';

  @override
  String get city_homs_bab_tadmur => 'Bab Tadmur';

  @override
  String get city_homs_al_khaldiyeh => 'Al-Khaldiyeh';

  @override
  String get city_homs_al_bayada => 'Al-Bayada';

  @override
  String get city_homs_deir_ba_alba => 'Deir Ba-Alba';

  @override
  String get city_homs_ghouta => 'Ghouta';

  @override
  String get city_homs_al_qusur => 'Al-Qusur';

  @override
  String get city_homs_al_zahraa => 'Al-Zahraa';

  @override
  String get city_homs_al_nuzha => 'Al-Nuzha';

  @override
  String get city_homs_al_sabeel => 'Al-Sabeel';

  @override
  String get city_homs_al_hamidiyah => 'Al-Hamidiyah';

  @override
  String get city_homs_al_qarabis => 'Al-Qarabis';

  @override
  String get city_homs_al_karama => 'Al-Karama';

  @override
  String get city_homs_al_salam => 'Al-Salam';

  @override
  String get city_homs_al_ghouta => 'Al-Ghouta';

  @override
  String get city_homs_al_hosn => 'Al-Hosn';

  @override
  String get city_homs_al_qaryatein => 'Al-Qaryatein';

  @override
  String get city_homs_palmyra => 'Palmyra';

  @override
  String get city_hama_al_arbaeen => 'Al-Arbaeen';

  @override
  String get city_hama_al_nasiriya => 'Al-Nasiriya';

  @override
  String get city_hama_al_kareem => 'Al-Kareem';

  @override
  String get city_hama_al_saboun => 'Al-Saboun';

  @override
  String get city_hama_al_baath => 'Al-Baath';

  @override
  String get city_hama_mhardeh => 'Mhardeh';

  @override
  String get city_hama_slimiyah => 'Salamiyah';

  @override
  String get city_hama_kafr_zita => 'Kafr Zita';

  @override
  String get city_hama_latamina => 'Latamina';

  @override
  String get city_hama_taybat_al_imam => 'Taybat al-Imam';

  @override
  String get city_hama_soran => 'Soran';

  @override
  String get city_hama_kafr_nabudah => 'Kafr Nabudah';

  @override
  String get city_hama_halfaya => 'Halfaya';

  @override
  String get city_hama_maharda => 'Maharda';

  @override
  String get city_hama_qamhana => 'Qamhana';

  @override
  String get city_hama_al_latamna => 'Al-Latamna';

  @override
  String get city_hama_al_surmaniyah => 'Al-Surmaniyah';

  @override
  String get city_hama_al_mazzeh_hama => 'Al-Mazzeh';

  @override
  String get city_hama_al_suqailabiya => 'Al-Suqailabiya';

  @override
  String get city_hama_al_hamraa => 'Al-Hamraa';

  @override
  String get city_latakia_al_ramleh => 'Al-Ramleh';

  @override
  String get city_latakia_al_ziraa => 'Al-Ziraa';

  @override
  String get city_latakia_corniche => 'Corniche';

  @override
  String get city_latakia_qastal_maaf => 'Qastal Maaf';

  @override
  String get city_latakia_jableh => 'Jableh';

  @override
  String get city_latakia_qardaha => 'Qardaha';

  @override
  String get city_latakia_slunfeh => 'Slunfeh';

  @override
  String get city_latakia_baniyas => 'Baniyas';

  @override
  String get city_latakia_al_haffa => 'Al-Haffa';

  @override
  String get city_latakia_al_sheikh_daher => 'Al-Sheikh Daher';

  @override
  String get city_latakia_al_daatour => 'Al-Daatour';

  @override
  String get city_latakia_ras_al_basit => 'Ras al-Basit';

  @override
  String get city_latakia_kessab => 'Kessab';

  @override
  String get city_latakia_al_sanamayn => 'Al-Sanamayn';

  @override
  String get city_latakia_al_raml => 'Al-Raml';

  @override
  String get city_latakia_al_bayda => 'Al-Bayda';

  @override
  String get city_latakia_al_shamiya => 'Al-Shamiya';

  @override
  String get city_latakia_al_kabir => 'Al-Kabir';

  @override
  String get city_latakia_al_safa => 'Al-Safa';

  @override
  String get city_latakia_al_midan_latakia => 'Al-Midan';

  @override
  String get city_tartous_tartous => 'Tartous';

  @override
  String get city_tartous_al_sheikh_badr => 'Al-Sheikh Badr';

  @override
  String get city_tartous_baniyas => 'Baniyas';

  @override
  String get city_tartous_corniche => 'Corniche';

  @override
  String get city_tartous_dreikish => 'Dreikish';

  @override
  String get city_tartous_rabea => 'Rabea';

  @override
  String get city_tartous_mashta_al_hilou => 'Mashta al-Hilou';

  @override
  String get city_tartous_bechmira => 'Bechmira';

  @override
  String get city_tartous_al_hamidiyah => 'Al-Hamidiyah';

  @override
  String get city_tartous_al_dreikish => 'Al-Dreikish';

  @override
  String get city_tartous_al_kadmous => 'Al-Kadmous';

  @override
  String get city_tartous_al_safsafah => 'Al-Safsafah';

  @override
  String get city_tartous_al_sheikh_badr_center => 'Al-Sheikh Badr Center';

  @override
  String get city_tartous_al_tall => 'Al-Tall';

  @override
  String get city_tartous_al_kadmus => 'Al-Kadmus';

  @override
  String get city_tartous_al_rastan_tartous => 'Al-Rastan';

  @override
  String get city_tartous_al_sudan => 'Al-Sudan';

  @override
  String get city_tartous_al_sisiya => 'Al-Sisiya';

  @override
  String get city_tartous_al_bayada => 'Al-Bayada';

  @override
  String get city_tartous_al_hamra_tartous => 'Al-Hamra';

  @override
  String get city_idlib_idlib => 'Idlib';

  @override
  String get city_idlib_maarret_al_numan => 'Maarret al-Numan';

  @override
  String get city_idlib_saraqib => 'Saraqib';

  @override
  String get city_idlib_khan_sheikhoun => 'Khan Sheikhoun';

  @override
  String get city_idlib_jisir_al_shughur => 'Jisir al-Shughur';

  @override
  String get city_idlib_binnish => 'Binnish';

  @override
  String get city_idlib_taftanaz => 'Taftanaz';

  @override
  String get city_idlib_araq => 'Araq';

  @override
  String get city_idlib_sarmin => 'Sarmin';

  @override
  String get city_idlib_kafr_nabl => 'Kafr Nabl';

  @override
  String get city_idlib_maaret_al_tamasrin => 'Maaret al-Tamasrin';

  @override
  String get city_idlib_harem => 'Harem';

  @override
  String get city_idlib_darkosh => 'Darkosh';

  @override
  String get city_idlib_salqin => 'Salqin';

  @override
  String get city_idlib_al_dana => 'Al-Dana';

  @override
  String get city_idlib_ram_hamdan => 'Ram Hamdan';

  @override
  String get city_idlib_kafr_aya => 'Kafr Aya';

  @override
  String get city_idlib_kafr_sajna => 'Kafr Sajna';

  @override
  String get city_idlib_tal_karah => 'Tal Karah';

  @override
  String get city_idlib_zardana => 'Zardana';

  @override
  String get city_daraa_daraa => 'Daraa';

  @override
  String get city_daraa_busra_al_sham => 'Busra al-Sham';

  @override
  String get city_daraa_nawa => 'Nawa';

  @override
  String get city_daraa_jasem => 'Jasem';

  @override
  String get city_daraa_tafss => 'Tafss';

  @override
  String get city_daraa_mzeireb => 'Mzeireb';

  @override
  String get city_daraa_sanamayn => 'Sanamayn';

  @override
  String get city_daraa_inkhilal => 'Inkhilal';

  @override
  String get city_daraa_hirak => 'Hirak';

  @override
  String get city_daraa_dael => 'Dael';

  @override
  String get city_daraa_al_sheikh_maskin => 'Al-Sheikh Maskin';

  @override
  String get city_daraa_namir => 'Namir';

  @override
  String get city_daraa_ghabgab => 'Ghabgab';

  @override
  String get city_daraa_al_yadouda => 'Al-Yadouda';

  @override
  String get city_daraa_al_tibneh => 'Al-Tibneh';

  @override
  String get city_daraa_tal_shihab => 'Tal Shihab';

  @override
  String get city_daraa_khirbet_ghazaleh => 'Khirbet Ghazaleh';

  @override
  String get city_daraa_al_harak => 'Al-Harak';

  @override
  String get city_daraa_al_jiza => 'Al-Jiza';

  @override
  String get city_daraa_al_manshiya => 'Al-Manshiya';

  @override
  String get city_deir_ezzor_deir_ezzor => 'Deir Ezzor';

  @override
  String get city_deir_ezzor_al_mayadeen => 'Al-Mayadeen';

  @override
  String get city_deir_ezzor_al_bukamal => 'Al-Bukamal';

  @override
  String get city_deir_ezzor_al_busayra => 'Al-Busayra';

  @override
  String get city_deir_ezzor_al_susah => 'Al-Susah';

  @override
  String get city_deir_ezzor_khasham => 'Khasham';

  @override
  String get city_deir_ezzor_al_husseiniyah => 'Al-Husseiniyah';

  @override
  String get city_deir_ezzor_al_jura => 'Al-Jura';

  @override
  String get city_deir_ezzor_al_quriya => 'Al-Quriya';

  @override
  String get city_deir_ezzor_al_hawayej => 'Al-Hawayej';

  @override
  String get city_deir_ezzor_al_tayana => 'Al-Tayana';

  @override
  String get city_deir_ezzor_al_tabni => 'Al-Tabni';

  @override
  String get city_deir_ezzor_al_shuhail => 'Al-Shuhail';

  @override
  String get city_deir_ezzor_al_abu_kamal => 'Al-Abu Kamal';

  @override
  String get city_deir_ezzor_al_husainiya => 'Al-Husainiya';

  @override
  String get city_deir_ezzor_al_jezira => 'Al-Jezira';

  @override
  String get city_deir_ezzor_al_dhula => 'Al-Dhula';

  @override
  String get city_deir_ezzor_al_baghouz => 'Al-Baghouz';

  @override
  String get city_deir_ezzor_al_salihiyah => 'Al-Salihiyah';

  @override
  String get city_deir_ezzor_al_omar => 'Al-Omar';

  @override
  String get city_raqqa_raqqa => 'Raqqa';

  @override
  String get city_raqqa_tal_abyad => 'Tal Abyad';

  @override
  String get city_raqqa_al_tabqa => 'Al-Tabqa';

  @override
  String get city_raqqa_al_mansoura => 'Al-Mansoura';

  @override
  String get city_raqqa_al_karamah => 'Al-Karamah';

  @override
  String get city_raqqa_al_karama => 'Al-Karama';

  @override
  String get city_raqqa_al_hanida => 'Al-Hanida';

  @override
  String get city_raqqa_al_kasrat => 'Al-Kasrat';

  @override
  String get city_raqqa_al_resh => 'Al-Resh';

  @override
  String get city_raqqa_al_hisba => 'Al-Hisba';

  @override
  String get city_raqqa_al_rashid => 'Al-Rashid';

  @override
  String get city_raqqa_al_jurneyyah => 'Al-Jurneyyah';

  @override
  String get city_raqqa_al_sabkha => 'Al-Sabkha';

  @override
  String get city_raqqa_al_hol => 'Al-Hol';

  @override
  String get city_raqqa_al_rasafa => 'Al-Rasafa';

  @override
  String get city_raqqa_al_sharakrak => 'Al-Sharakrak';

  @override
  String get city_raqqa_al_khafsa => 'Al-Khafsa';

  @override
  String get city_raqqa_al_masrab => 'Al-Masrab';

  @override
  String get city_raqqa_al_tabaqa_dam => 'Al-Tabaqa Dam';

  @override
  String get city_raqqa_al_qadisiya => 'Al-Qadisiya';

  @override
  String get city_hasakah_qamishli => 'Qamishli';

  @override
  String get city_hasakah_hasakah => 'Hasakah';

  @override
  String get city_hasakah_malikiya => 'Malikiya';

  @override
  String get city_hasakah_ras_al_ayn => 'Ras al-Ayn';

  @override
  String get city_hasakah_al_shaddadi => 'Al-Shaddadi';

  @override
  String get city_hasakah_amuda => 'Amuda';

  @override
  String get city_hasakah_derbasiya => 'Derbasiya';

  @override
  String get city_hasakah_tirbespi => 'Tirbespi';

  @override
  String get city_hasakah_al_mabrouka => 'Al-Mabrouka';

  @override
  String get city_hasakah_al_yaarubiyah => 'Al-Yaarubiyah';

  @override
  String get city_hasakah_al_hawl => 'Al-Hawl';

  @override
  String get city_hasakah_al_himma => 'Al-Himma';

  @override
  String get city_hasakah_al_ghazl => 'Al-Ghazl';

  @override
  String get city_hasakah_al_kasra => 'Al-Kasra';

  @override
  String get city_hasakah_al_markada => 'Al-Markada';

  @override
  String get city_hasakah_al_tayyana => 'Al-Tayyana';

  @override
  String get city_hasakah_al_sweidiya => 'Al-Sweidiya';

  @override
  String get city_hasakah_al_khaldiya => 'Al-Khaldiya';

  @override
  String get city_hasakah_al_jawadiyah => 'Al-Jawadiyah';

  @override
  String get city_hasakah_al_talaq => 'Al-Talaq';

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
  String get create_account => 'Create Account';

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
  String get go_back => 'do you want to go back to the';

  @override
  String get login_screen => 'Login Screen';

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
  String get changed_your_mind => 'Changed your mind? go back to ';
}
