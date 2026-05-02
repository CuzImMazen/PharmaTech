// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get error_network => 'لا يوجد اتصال بالإنترنت';

  @override
  String get error_timeout => 'انتهت مهلة الطلب';

  @override
  String get error_unknown => 'حدث خطأ ما، يرجى المحاولة مرة أخرى';

  @override
  String get splash_title => 'صيدليتي';

  @override
  String get splash_subtitle => 'نظام لإدارة الصيدليات';

  @override
  String get onboarding_skip => 'تخطي';

  @override
  String get onboarding_page1_title => 'إدارة المخزون بسهولة';

  @override
  String get onboarding_page1_desc => 'تتبع الأدوية ومستويات المخزون وتواريخ انتهاء الصلاحية في مكان واحد';

  @override
  String get onboarding_page2_title => 'نظام مبيعات سريع';

  @override
  String get onboarding_page2_desc => 'معالجة المبيعات بسرعة مع دعم المسح الضوئي للباركود';

  @override
  String get onboarding_page3_title => 'تقارير وتحليلات';

  @override
  String get onboarding_page3_desc => 'أحصل على رؤى شاملة حول مبيعاتك ومخزونك';

  @override
  String get onboarding_next => 'التالي';

  @override
  String get onboarding_back => 'السابق';

  @override
  String get onboarding_start => 'ابدأ الآن';

  @override
  String get auth_login_title => 'مرحباً بعودتك';

  @override
  String get auth_login_subtitle => 'سجّل الدخول لمتابعة العمل';

  @override
  String get auth_email_label => 'البريد الإلكتروني';

  @override
  String get auth_password_label => 'كلمة المرور';

  @override
  String get auth_remember_me => 'تذكرني';

  @override
  String get auth_forgot_password => 'نسيت كلمة المرور؟';

  @override
  String get auth_login_button => 'تسجيل الدخول';

  @override
  String get auth_no_account => 'ليس لديك حساب؟ ';

  @override
  String get auth_create_account => 'إنشاء حساب جديد';

  @override
  String get auth_email_is_required => 'البريد الإلكتروني مطلوب';

  @override
  String get auth_password_is_required => 'كلمة المرور مطلوبة';

  @override
  String get auth_invalid_email => 'صيغة البريد الإلكتروني غير صحيحة';

  @override
  String get auth_password_min_length => 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get agree_to => 'أوافق على ';

  @override
  String get terms_and_conditions => 'الشروط والأحكام';

  @override
  String get and => ' و ';

  @override
  String get privacy_policy => 'سياسة الخصوصية';

  @override
  String get auth_email_not_registered => 'البريد الإلكتروني غير مسجل';

  @override
  String get auth_wrong_password => 'كلمة المرور غير صحيحة';

  @override
  String get auth_login_success => 'تم تسجيل الدخول بنجاح';
}
