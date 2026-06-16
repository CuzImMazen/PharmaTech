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
  String get error_timeout => 'انتهت مهلة الطلب، يرجى المحاولة لاحقاً';

  @override
  String get error_unknown => 'حدث خطأ ما، يرجى المحاولة مرة أخرى';

  @override
  String get error_parsing => 'حدث خطأ أثناء تحليل البيانات.';

  @override
  String error_too_many_attempts(String seconds) {
    return 'عدد محاولات كثيرة. يرجى المحاولة مرة أخرى بعد $seconds ثانية.';
  }

  @override
  String get session_expired => 'انتهت صلاحية الجلسة. يرجى تسجيل الدخول مجدداً.';

  @override
  String get auth_invalid_credentials => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get auth_email_not_registered => 'البريد الإلكتروني غير مسجل';

  @override
  String get auth_wrong_password => 'كلمة المرور غير صحيحة';

  @override
  String get auth_email_already_exists => 'البريد الإلكتروني مستخدم بالفعل.';

  @override
  String get auth_phone_already_exists => 'رقم الهاتف مستخدم بالفعل.';

  @override
  String get auth_email_not_verified => 'يرجى تأكيد بريدك الإلكتروني أولاً. تم إرسال رابط تفعيل جديد إلى صندوق الوارد الخاص بك.';

  @override
  String get auth_invalid_reset_token => 'رابط إعادة تعيين كلمة المرور هذا غير صالح أو انتهت صلاحيته.';

  @override
  String get auth_action_denied => 'رابط التحقق هذا غير صالح أو انتهت صلاحيته.';

  @override
  String get auth_google_sign_in_failed => 'فشل تسجيل الدخول باستخدام Google. يرجى المحاولة مرة أخرى.';

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
  String get password_atleast_one_letter => 'يجب أن تحتوي كلمة المرور على حرف واحد على الأقل';

  @override
  String get agree_to => 'أوافق على ';

  @override
  String get terms_and_conditions => 'الشروط والأحكام';

  @override
  String get and => ' و ';

  @override
  String get privacy_policy => 'سياسة الخصوصية';

  @override
  String get auth_login_success => 'تم تسجيل الدخول بنجاح';

  @override
  String get auth_or => 'أو';

  @override
  String get auth_signin_with_google => 'تسجيل الدخول باستخدام Google';

  @override
  String get auth_signup_account_title => 'إنشاء حساب جديد';

  @override
  String get auth_signup_account_subtitle => ' ابدأ تجربتك معنا الآن.';

  @override
  String get auth_confirm_password_label => 'تأكيد كلمة المرور';

  @override
  String get auth_confirm_password_is_required => 'تأكيد كلمة المرور مطلوب';

  @override
  String get auth_passwords_do_not_match => 'كلمات المرور غير متطابقة';

  @override
  String get auth_next => 'التالي';

  @override
  String get already_have_account => 'هل لديك حساب بالفعل？ ';

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
  String get create_account => 'إنشاء الحساب';

  @override
  String get go_back => 'هل تريد العودة إلى';

  @override
  String get login_screen => 'شاشة تسجيل الدخول';

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
  String get emailSentTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get emailSentTo => 'تم إرسال رابط التفعيل إلى';

  @override
  String get emailInstruction => 'افتح بريدك الإلكتروني وانقر على رابط التفعيل لإكمال التسجيل';

  @override
  String get resendLink => 'إعادة إرسال الرابط';

  @override
  String get didnt_find_email => 'لم تجد الرسالة؟ تحقق من مجلد الرسائل الغير مرغوبة أو حاول مرة أخرى لاحقاً';

  @override
  String get continue_btn => 'متابعة';

  @override
  String get email_verification_success => 'تم تأكيد البريد الإلكتروني بنجاح. يمكنك الآن تسجيل الدخول.';

  @override
  String you_can_resend_after(String seconds) {
    return 'يمكنك إعادة الإرسال بعد $seconds ثانية';
  }

  @override
  String get couldnt_resend_link => 'تعذر إعادة إرسال الرابط. يرجى المحاولة مرة أخرى لاحقاً.';

  @override
  String get resend_link_success => 'تم إعادة إرسال الرابط بنجاح. يرجى التحقق من بريدك الإلكتروني.';

  @override
  String get forgot_password_title => 'هل نسيت كلمة المرور؟';

  @override
  String get forgot_password_subtitle => 'أدخل بريدك الإلكتروني لتلقي رابط إعادة تعيين كلمة المرور';

  @override
  String get send_reset_password_link => 'إرسال رابط إعادة تعيين كلمة المرور';

  @override
  String get remembered_password => 'هل تذكرت كلمة المرور؟ ';

  @override
  String get reset_password_sent_subtitle => 'لقد أرسلنا رابط إعادة تعيين كلمة المرور إلى';

  @override
  String get reset_password_sent_instruction => 'افتح بريدك الإلكتروني وانقر على رابط إعادة تعيين كلمة المرور للمتابعة';

  @override
  String get reset_password_title => 'إعادة تعيين كلمة المرور ';

  @override
  String get reset_password_subtitle => 'أدخل كلمة المرور الجديدة وتأكد من اختيار كلمة قوية للحفاظ على أمان حسابك';

  @override
  String get new_password_label => 'كلمة المرور الجديدة';

  @override
  String get reset_password_btn => 'إعادة تعيين كلمة المرور';

  @override
  String get reset_password_success => 'تم إعادة تعيين كلمة المرور بنجاح. يرجى تسجيل الدخول باستخدام كلمة المرور الجديدة.';

  @override
  String get changed_your_mind => 'غيرت رأيك؟ اذهب إلى ';

  @override
  String get complete_profile_title => 'أكمل تفاصيل حسابك';

  @override
  String get complete_profile_btn => 'أكمل الملف الشخصي';

  @override
  String get signin_success_no_details => 'تم تسجيل الدخول بنجاح يرجى إكمال تفاصيل حسابك للمتابعة';

  @override
  String get complete_profile_success => 'تم إكمال الملف الشخصي بنجاح. يمكنك الآن الوصول إلى التطبيق.';

  @override
  String get coomplete_profile_error => 'حدث خطأ أثناء إكمال ملفك الشخصي. يرجى المحاولة مرة أخرى.';

  @override
  String get auth_google_sign_in_canceled => 'تم إلغاء تسجيل الدخول باستخدام Google. يمكنك المحاولة مرة أخرى إذا كنت ترغب في ذلك.';

  @override
  String get invalid_password_reset_link => 'رابط إعادة تعيين كلمة المرور هذا غير صالح أو انتهت صلاحيته.';

  @override
  String get email_already_verified => 'تم تأكيد هذا البريد الإلكتروني بالفعل. يرجى تسجيل الدخول.';

  @override
  String get invalid_link => 'الرابط غير صالح أو انتهت صلاحيته، يرجى المحاولة مرة أخرى برابط جديد.';

  @override
  String get dashboard => 'الرئيسية';

  @override
  String get sales => 'المبيعات';

  @override
  String get inventory => 'المخزون';

  @override
  String get reports => 'التقارير';

  @override
  String get settings => 'الإعدادات';

  @override
  String get welcome => 'أهلاً بك';

  @override
  String get here_is_your_pharmacy_summary => 'إليك ملخص صيدلتك لليوم';

  @override
  String get today_revenue => 'إيرادات اليوم';

  @override
  String get from_yesterday => 'منذ أمس';

  @override
  String get sp => 'ل.س';

  @override
  String get invoice => 'فاتورة';

  @override
  String get units_sold => 'وحدة مُباعة';

  @override
  String get avg_invoice_value => 'متوسط الفاتورة';
}
