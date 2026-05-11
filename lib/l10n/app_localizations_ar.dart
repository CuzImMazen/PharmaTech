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
  String get onboarding_page1_title => 'شريكك الذكي في الصيدلية';

  @override
  String get onboarding_page1_desc => 'ركّز أكتر على مرضاتك وترك المهام الورقية علينا. أتمتة تسجيل الوصفات وتسهيل روتينك اليومي صار بلمسة وحدة.';

  @override
  String get onboarding_page2_title => 'رؤية شاملة للمخزون';

  @override
  String get onboarding_page2_desc => 'لا تقلق من نقص الأدوية بعد اليوم. تابع مستويات المخزون وحلل أداء المبيعات بتقارير مباشرة وتنبيهات تلقائية.';

  @override
  String get onboarding_page3_title => 'بيئة عمل آمنة ومنظمة';

  @override
  String get onboarding_page3_desc => 'بيانات مرضاتك محمية بأعلى مستويات التشفير، مع إمكانية تنظيم جداول الموظفين والمواعيد بمكان واحد وبكل بساطة.';

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

  @override
  String get auth_or => 'أو';

  @override
  String get auth_signin_with_google => 'تسجيل الدخول باستخدام Google';

  @override
  String get auth_signup_account_title => 'إنشاء حساب جديد';

  @override
  String get auth_signup_account_subtitle => ' أنشئ حسابك في خطوات بسيطة';

  @override
  String get auth_confirm_password_label => 'تأكيد كلمة المرور';

  @override
  String get auth_passwords_do_not_match => 'كلمات المرور غير متطابقة';

  @override
  String get auth_confirm_password_is_required => 'تأكيد كلمة المرور مطلوب';

  @override
  String get auth_next => 'التالي';

  @override
  String get already_have_account => 'هل لديك حساب بالفعل؟ ';

  @override
  String get auth_signin => 'تسجيل الدخول';

  @override
  String get auth_signup_subtitle2 => 'المعلومات الشخصية والترخيص';

  @override
  String get first_name_label => 'الاسم الأول';

  @override
  String get last_name_label => 'الاسم الأخير';

  @override
  String get phone_number_label => 'رقم الهاتف';

  @override
  String get first_name_hint => 'نور';

  @override
  String get last_name_hint => 'المصري';

  @override
  String get auth_first_name_is_required => 'الاسم الأول مطلوب';

  @override
  String get auth_last_name_is_required => 'الاسم الأخير مطلوب';

  @override
  String get auth_phone_is_required => 'رقم الهاتف مطلوب';

  @override
  String get auth_invalid_phone => 'صيغة رقم الهاتف غير صحيحة';

  @override
  String get phone_label => 'رقم الهاتف';

  @override
  String get pharmacy_name_label => 'اسم الصيدلية';

  @override
  String get pharmacy_name_hint => 'صيدلية نور';

  @override
  String get auth_pharmacy_name_is_required => 'اسم الصيدلية مطلوب';

  @override
  String get auth_governorate_is_required => 'المحافظة مطلوبة';

  @override
  String get auth_city_is_required => 'المدينة مطلوبة';

  @override
  String get auth_governorate_label => 'المحافظة';

  @override
  String get auth_city_label => 'المدينة';

  @override
  String get gov_damascus => 'دمشق';

  @override
  String get gov_aleppo => 'حلب';

  @override
  String get gov_homs => 'حمص';

  @override
  String get gov_hama => 'حماة';

  @override
  String get gov_latakia => 'اللاذقية';

  @override
  String get gov_tartous => 'طرطوس';

  @override
  String get gov_idlib => 'إدلب';

  @override
  String get gov_daraa => 'درعا';

  @override
  String get gov_deir_ezzor => 'دير الزور';

  @override
  String get gov_raqqa => 'الرقة';

  @override
  String get gov_hasakah => 'الحسكة';

  @override
  String get city_mazzeh => 'المزة';

  @override
  String get city_barzeh => 'برزة';

  @override
  String get city_mezzah_86 => 'المزة 86';

  @override
  String get city_kafrsouseh => 'كفرسوسة';

  @override
  String get city_ruken_al_din => 'ركن الدين';

  @override
  String get city_old_damascus => 'دمشق القديمة';

  @override
  String get city_salah_al_din => 'صلاح الدين';

  @override
  String get city_hanano => 'الحمدانية';

  @override
  String get city_ashrafieh => 'الأشرفية';

  @override
  String get city_aziziyeh => 'العزيزية';

  @override
  String get city_jamiliyeh => 'الجمعيلية';

  @override
  String get city_seif_al_dawla => 'سيف الدولة';

  @override
  String get city_al_inshaat => 'الإنشاءات';

  @override
  String get city_al_waer => 'الوعر';

  @override
  String get city_al_hamra => 'الحمراء';

  @override
  String get city_bab_tadmur => 'باب تدمر';

  @override
  String get city_al_arbaeen => 'الأربعين';

  @override
  String get city_al_nasiriya => 'الناصرية';

  @override
  String get city_al_kareem => 'الكريم';

  @override
  String get city_al_ramleh => 'الرمل الجنوبي';

  @override
  String get city_al_ziraa => 'الزراعة';

  @override
  String get city_corniche => 'الكورنيش';

  @override
  String get city_al_sheikh_badr => 'الشيخ بدر';

  @override
  String get city_baniyas => 'بانياس';

  @override
  String get city_corniche_tartous => 'كورنيش طرطوس';

  @override
  String get city_idlib_center => 'مركز إدلب';

  @override
  String get city_maarret_al_numan => 'معرة النعمان';

  @override
  String get city_saraqib => 'سراقب';

  @override
  String get city_daraa_city => 'مدينة درعا';

  @override
  String get city_busra_al_sham => 'بصرى الشام';

  @override
  String get city_nawa => 'نوى';

  @override
  String get city_deir_ezzor_city => 'مدينة دير الزور';

  @override
  String get city_al_mayadeen => 'الميادين';

  @override
  String get city_al_bukamal => 'البوكمال';

  @override
  String get city_raqqa_city => 'مدينة الرقة';

  @override
  String get city_tal_abyad => 'تل أبيض';

  @override
  String get city_hasakah_city => 'مدينة الحسكة';

  @override
  String get city_qamishli => 'القامشلي';

  @override
  String get city_malikiya => 'المالكية';

  @override
  String get governorate_required => 'المحافظة مطلوبة';

  @override
  String get city_required => 'المدينة مطلوبة';

  @override
  String get detailed_address_label => 'العنوان التفصيلي (اختياري)';

  @override
  String get detailed_address_hint => 'شارع العابد مقابل مسجد النور...';

  @override
  String get pharmacy_license_label => 'رقم ترخيص الصيدلية';

  @override
  String get pharmacy_license_required => 'رقم ترخيص الصيدلية مطلوب';

  @override
  String get create_account => 'إنشاء الحساب';

  @override
  String get emailVerificationTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get emailSentTo => 'تم إرسال رابط التفعيل إلى';

  @override
  String get emailInstruction => 'افتح بريدك الإلكتروني وانقر على رابط التفعيل لإكمال التسجيل';

  @override
  String get resendLink => 'إعادة إرسال الرابط';

  @override
  String get emailNotFound => 'لم تجد الرسالة؟ تحقق من مجلد الرسائل الغير مرغوبة';
}
