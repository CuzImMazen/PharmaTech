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
  String get finance => 'المالية';

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

  @override
  String get yesterday_revenue => 'إيرادات الأمس';

  @override
  String get this_week => 'هذا الأسبوع';

  @override
  String get total_items => 'إجمالي العناصر';

  @override
  String get out_of_stock => 'نفاذ من المخزون';

  @override
  String get items_in_stock => 'العناصر في المخزون';

  @override
  String get total_sales => 'إجمالي المبيعات';

  @override
  String get today_sales => 'مبيعات اليوم';

  @override
  String get stock_alerts => 'تنبيهات المخزون';

  @override
  String get weekly_revenue => 'إيرادات الأسبوع';

  @override
  String get today => 'اليوم';

  @override
  String get prevs_day => 'الأيام السابقة';

  @override
  String get recent_transactions => 'المعاملات الأخيرة';

  @override
  String get view_all => 'عرض الكل';

  @override
  String get stock_alerts_title => 'تنبيهات المخزون';

  @override
  String get manage_inventory => 'إدارة المخزون';

  @override
  String get low => 'منخفض';

  @override
  String get critical => 'حرج';

  @override
  String get out => 'نفاذ';

  @override
  String get inventory_search_hint => 'ابحث بالاسم';

  @override
  String get inventory_unit => 'وحدة';

  @override
  String get inventory_price => 'السعر (ل.س)';

  @override
  String get inventory_expiry => 'تاريخ الانتهاء';

  @override
  String get inventory_stock_level => 'مستوى المخزون :';

  @override
  String get inventory_stock_min_suffix => ' (الحد الأدنى)';

  @override
  String get inventory_no_products => 'لا توجد منتجات.';

  @override
  String get inventory_load_error => 'تعذر تحميل المنتجات حالياً.';

  @override
  String get inventory_retry => 'إعادة المحاولة';

  @override
  String get filter_filters => 'تصفية';

  @override
  String get filter_filters_and_sort => 'تصفية وترتيب';

  @override
  String get filter_reset => 'إعادة تعيين';

  @override
  String get filter_reset_title => 'إعادة تعيين التصفية؟';

  @override
  String get filter_reset_message => 'سيتم مسح كل عوامل التصفية المحددة. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get filter_cancel => 'إلغاء';

  @override
  String get filter_show_results => 'عرض النتائج';

  @override
  String get filter_loading => 'جارٍ تحميل عوامل التصفية...';

  @override
  String get filter_section_failed => 'تعذر التحميل';

  @override
  String get filter_retry => 'إعادة';

  @override
  String get filter_all => 'الكل';

  @override
  String get filter_category => 'الفئة';

  @override
  String get filter_stock_status => 'حالة المخزون';

  @override
  String get filter_price_range => 'نطاق السعر (ل.س)';

  @override
  String get filter_expiry_date => 'تاريخ الانتهاء';

  @override
  String get filter_package_unit => 'وحدة التعبئة';

  @override
  String get filter_company => 'الشركة';

  @override
  String get filter_prescription => 'الوصفة الطبية';

  @override
  String get filter_rx_only => 'بوصفة فقط';

  @override
  String get filter_non_rx => 'بدون وصفة';

  @override
  String get filter_from => 'من';

  @override
  String get filter_to => 'إلى';

  @override
  String get filter_stock_available => 'متوفر';

  @override
  String get filter_stock_low => 'منخفض';

  @override
  String get filter_stock_out => 'نفاذ';

  @override
  String get filter_expiry_expired => 'منتهي';

  @override
  String get filter_expiry_30_days => '30 يوماً';

  @override
  String get filter_expiry_60_days => '60 يوماً';

  @override
  String get filter_expiry_90_days => '90 يوماً';

  @override
  String get filter_expiry_6_months => '6 أشهر';

  @override
  String get sort_name_asc => 'الاسم أ←ي';

  @override
  String get sort_name_desc => 'الاسم ي←أ';

  @override
  String get sort_price_asc => 'السعر ↑';

  @override
  String get sort_price_desc => 'السعر ↓';

  @override
  String get sort_stock_asc => 'المخزون ↑';

  @override
  String get sort_stock_desc => 'المخزون ↓';

  @override
  String get sort_expiry_soon => 'أقرب انتهاء';

  @override
  String get sort_expiry_late => 'أبعد انتهاء';

  @override
  String get stock_status_available => 'متوفر';

  @override
  String get stock_status_low => 'منخفض';

  @override
  String get stock_status_out => 'نفاذ';

  @override
  String get detail_not_available => '—';

  @override
  String get detail_edit => 'تعديل';

  @override
  String get detail_delete => 'حذف';

  @override
  String get detail_tab_overview => 'نظرة عامة';

  @override
  String get detail_tab_batches => 'المخزون';

  @override
  String get detail_tab_medical => 'المعلومات الطبية';

  @override
  String get detail_section_product_info => 'معلومات المنتج';

  @override
  String get detail_section_pricing => 'التسعير';

  @override
  String get detail_section_inventory => 'المخزون';

  @override
  String get detail_barcode => 'الباركود';

  @override
  String get detail_scientific_name => 'الاسم العلمي';

  @override
  String get detail_strength => 'التركيز';

  @override
  String get detail_company => 'الشركة';

  @override
  String get detail_category => 'الفئة';

  @override
  String get detail_shelf => 'الرف';

  @override
  String get detail_prescription => 'يحتاج وصفة';

  @override
  String get detail_yes => 'نعم';

  @override
  String get detail_no => 'لا';

  @override
  String get detail_buying_price => 'سعر الشراء';

  @override
  String get detail_selling_price => 'سعر البيع';

  @override
  String get detail_tax => 'نسبة الضريبة';

  @override
  String get detail_discount => 'نسبة الخصم';

  @override
  String get detail_total_quantity => 'إجمالي الكمية';

  @override
  String get detail_min_stock => 'الحد الأدنى';

  @override
  String get detail_units_per_base => 'الوحدات لكل أساس';

  @override
  String get detail_nearest_expiry => 'أقرب انتهاء';

  @override
  String get detail_allow_partial_selling => 'السماح بالبيع الجزئي';

  @override
  String detail_batches_count(int count) {
    return '$count دفعة';
  }

  @override
  String get detail_add_batch => 'إضافة دفعة';

  @override
  String get detail_no_batches => 'لا توجد دفعات متاحة';

  @override
  String get detail_batch_id => 'الدفعة';

  @override
  String get detail_received_date => 'تاريخ الاستلام';

  @override
  String get detail_expiry => 'تاريخ الانتهاء';

  @override
  String get detail_quantity_on_hand => 'المتوفر';

  @override
  String get detail_purchase_price => 'سعر الشراء';

  @override
  String get detail_batch_selling_price => 'سعر البيع';

  @override
  String get detail_batch_added => 'تمت إضافة الدفعة بنجاح.';

  @override
  String get detail_batch_marked_expired => 'تم تمييز الدفعة كمنتهية.';

  @override
  String get detail_add_batch_title => 'إضافة دفعة جديدة';

  @override
  String get detail_add_batch_subtitle => 'تسجيل عملية إدخال مخزون يدوية لهذا المنتج.';

  @override
  String get detail_add_batch_section => 'تفاصيل الدفعة';

  @override
  String get detail_add_batch_section_sub => 'الكمية والأسعار ومعلومات الدفعة الاختيارية';

  @override
  String get detail_add_batch_notes => 'ملاحظات';

  @override
  String get detail_tab_movements => 'الحركات';

  @override
  String get detail_no_movements => 'لا توجد حركات مخزون بعد.';

  @override
  String get movement_purchase_in => 'إدخال شراء';

  @override
  String get movement_customer_return_in => 'إرجاع عميل';

  @override
  String get movement_adjustment_in => 'تعديل إدخال';

  @override
  String get movement_sale_return_in => 'مرتجع بيع';

  @override
  String get movement_sale_out => 'بيع';

  @override
  String get movement_supplier_return_out => 'إرجاع مورد';

  @override
  String get movement_adjustment_out => 'تعديل إخراج';

  @override
  String get movement_expiry_out => 'إخراج انتهاء';

  @override
  String get stock_alerts_loading => 'جارٍ تحميل تنبيهات المخزون…';

  @override
  String get stock_alerts_error => 'تعذّر تحميل تنبيهات المخزون.';

  @override
  String get stock_alerts_empty => 'جميع المنتجات مخزّنة بشكل جيد.';

  @override
  String stock_alerts_count(int count) {
    return '$count عناصر منخفضة المخزون';
  }

  @override
  String get detail_batch_status_active => 'ساري';

  @override
  String get detail_batch_status_expired => 'منتهي';

  @override
  String get detail_batch_status_depleted => 'مستنزف';

  @override
  String get detail_batch_status_inactive => 'غير مفعّل';

  @override
  String get detail_medical_empty_title => 'لا توجد معلومات طبية';

  @override
  String get detail_medical_empty_subtitle => 'أضف المعلومات الطبية لهذا المنتج لتصبح متاحة هنا.';

  @override
  String get detail_add_medical_info => 'إضافة معلومات طبية';

  @override
  String get detail_medical_indications => 'دواعي الاستعمال';

  @override
  String get detail_medical_contraindications => 'موانع الاستعمال';

  @override
  String get detail_medical_warnings => 'تحذيرات';

  @override
  String get detail_medical_side_effects => 'الآثار الجانبية';

  @override
  String get detail_medical_overdose => 'جرعة زائدة';

  @override
  String get detail_medical_pregnancy_safety => 'الأمان أثناء الحمل';

  @override
  String get detail_medical_lactation_safety => 'الأمان أثناء الرضاعة';

  @override
  String get detail_medical_drug_interactions => 'التفاعلات الدوائية';

  @override
  String get detail_medical_dose_info => 'معلومات الجرعة';

  @override
  String get detail_save => 'حفظ';

  @override
  String get detail_cancel => 'إلغاء';

  @override
  String get product_add_title => 'إضافة منتج';

  @override
  String get product_edit_title => 'تعديل المنتج';

  @override
  String get product_create => 'إنشاء';

  @override
  String get product_created => 'تم إنشاء المنتج بنجاح.';

  @override
  String get product_saved => 'تم تحديث المنتج بنجاح.';

  @override
  String get product_deleted => 'تم حذف المنتج بنجاح.';

  @override
  String get product_delete_title => 'حذف المنتج';

  @override
  String get product_delete_confirm => 'هل أنت متأكد من حذف هذا المنتج؟ يمكن التراجع عن ذلك لاحقًا عبر الاستعادة.';

  @override
  String get product_form_section_basic => 'المعلومات الأساسية';

  @override
  String get product_form_section_basic_sub => 'الهوية والتسمية';

  @override
  String get product_form_section_classification => 'التصنيف';

  @override
  String get product_form_section_classification_sub => 'التصنيف والشركة والوحدات';

  @override
  String get product_form_section_pricing_sub => 'التكلفة والسعر والضريبة والخصم';

  @override
  String get product_form_section_inventory_sub => 'حدود المخزون والتخزين';

  @override
  String get product_form_barcode_hint => 'مثال: 123456789';

  @override
  String get product_form_brand_name => 'الاسم التجاري';

  @override
  String get product_form_brand_name_hint => 'مثال: أموكسيل 500 مغ';

  @override
  String get product_form_ar_name => 'الاسم بالعربية';

  @override
  String get product_form_optional_hint => 'اختياري';

  @override
  String get product_form_select_category => 'اختر تصنيفًا';

  @override
  String get product_form_base_unit => 'وحدة القياس الأساسية';

  @override
  String get product_form_selling_unit => 'وحدة البيع';

  @override
  String get medical_info_edit_title => 'تعديل المعلومات الطبية';

  @override
  String get medical_info_field_hint => 'أدخل التفاصيل (اختياري)';

  @override
  String get medical_info_form_intro => 'املأ التفاصيل الطبية ذات الصلة. جميع الحقول اختيارية — اتركها فارغة لحذفها.';

  @override
  String get medical_info_section_usage => 'الاستخدام والأمان';

  @override
  String get medical_info_section_usage_sub => 'دواعي الاستعمال وموانعه والتحذيرات';

  @override
  String get medical_info_section_effects => 'الآثار والجرعة الزائدة';

  @override
  String get medical_info_section_effects_sub => 'الآثار الجانبية والتعامل مع الجرعة الزائدة';

  @override
  String get medical_info_section_populations => 'الحالات الخاصة';

  @override
  String get medical_info_section_populations_sub => 'الأمان أثناء الحمل والرضاعة';

  @override
  String get medical_info_section_dosage => 'الجرعة والتفاعلات';

  @override
  String get medical_info_section_dosage_sub => 'معلومات الجرعة والتفاعلات الدوائية';

  @override
  String get medical_info_saved => 'تم حفظ المعلومات الطبية بنجاح.';

  @override
  String get medical_info_deleted => 'تم حذف المعلومات الطبية بنجاح.';

  @override
  String get medical_info_delete_title => 'حذف المعلومات الطبية';

  @override
  String get medical_info_delete_confirm => 'هل أنت متأكد من حذف المعلومات الطبية لهذا المنتج؟';

  @override
  String get settings_pharmacy => 'الصيدلية';

  @override
  String get settings_suppliers => 'الموردون';

  @override
  String get suppliers_title => 'الموردون';

  @override
  String get suppliers_search_hint => 'ابحث عن الموردين';

  @override
  String get suppliers_show_deleted => 'عرض المحذوفين';

  @override
  String get suppliers_empty => 'لا يوجد موردون بعد.';

  @override
  String get suppliers_empty_hint => 'أضف أول مورد لبدء عمليات الشراء.';

  @override
  String get suppliers_add => 'إضافة مورد';

  @override
  String get suppliers_load_error => 'تعذّر تحميل الموردين حالياً.';

  @override
  String get supplier_add_title => 'إضافة مورد';

  @override
  String get supplier_edit_title => 'تعديل المورد';

  @override
  String get supplier_section => 'تفاصيل المورد';

  @override
  String get supplier_section_sub => 'الاسم والشركة ومعلومات التواصل';

  @override
  String get supplier_name => 'اسم المورد';

  @override
  String get supplier_company => 'الشركة';

  @override
  String get supplier_phone => 'الهاتف';

  @override
  String get supplier_email => 'البريد الإلكتروني';

  @override
  String get supplier_address => 'العنوان';

  @override
  String get supplier_notes => 'ملاحظات';

  @override
  String get supplier_created => 'تم إنشاء المورد بنجاح.';

  @override
  String get supplier_updated => 'تم تحديث المورد بنجاح.';

  @override
  String get supplier_deleted => 'تم حذف المورد بنجاح.';

  @override
  String get supplier_restored => 'تمت استعادة المورد بنجاح.';

  @override
  String get supplier_restore => 'استعادة';

  @override
  String get supplier_delete_title => 'حذف المورد';

  @override
  String get supplier_delete_confirm => 'هل أنت متأكد من حذف هذا المورد؟';

  @override
  String get settings_appearance => 'المظهر';

  @override
  String get settings_theme => 'السمة';

  @override
  String get settings_language => 'اللغة';

  @override
  String get settings_account => 'الحساب';

  @override
  String get settings_inventory => 'المخزون';

  @override
  String get theme_system => 'النظام';

  @override
  String get theme_light => 'فاتح';

  @override
  String get theme_dark => 'داكن';

  @override
  String get language_system => 'النظام';

  @override
  String get language_english => 'الإنجليزية';

  @override
  String get language_arabic => 'العربية';

  @override
  String get sign_out => 'تسجيل الخروج';

  @override
  String get sign_out_confirm_title => 'تسجيل الخروج؟';

  @override
  String get sign_out_confirm => 'هل أنت متأكد من تسجيل الخروج؟';

  @override
  String get sign_out_failed => 'فشل تسجيل الخروج. حاول مرة أخرى.';

  @override
  String get sign_out_all => 'تسجيل الخروج من كل الأجهزة';

  @override
  String get sign_out_all_confirm_title => 'تسجيل الخروج من كل مكان؟';

  @override
  String get sign_out_all_confirm => 'سيؤدي هذا إلى تسجيل خروجك من كل جهاز وجلسة. ستحتاج إلى تسجيل الدخول مرة أخرى في كل منها. هل تريد المتابعة؟';

  @override
  String get field_required => 'هذا الحقل مطلوب';

  @override
  String get settings_finance => 'العمليات';

  @override
  String get settings_purchase_invoices => 'فواتير الشراء';

  @override
  String get settings_supplier_debts => 'ديون الموردين';

  @override
  String get settings_cash_box => 'الصندوق النقدي';

  @override
  String get settings_stock_adjustments => 'تعديلات المخزون';

  @override
  String get settings_bulk_adjustment => 'تعديل مخزون متعدد';

  @override
  String get cash_box_title => 'الصندوق النقدي';

  @override
  String get cash_box_current_balance => 'الرصيد الحالي';

  @override
  String get cash_box_opening_balance => 'رصيد الافتتاح';

  @override
  String get cash_box_net_change => 'صافي التغير';

  @override
  String get cash_box_create => 'إنشاء الصندوق';

  @override
  String get cash_box_created => 'تم إنشاء الصندوق بنجاح.';

  @override
  String get cash_box_opening_balance_invalid => 'أدخل رصيد افتتاح صحيح (صفر أو أكثر).';

  @override
  String get cash_box_no_box_title => 'لا يوجد صندوق بعد';

  @override
  String get cash_box_no_box_hint => 'أنشئ صندوق الصيدلية لبدء تتبع الحركات النقدية.';

  @override
  String get cash_box_no_transactions => 'لا توجد حركات بعد.';

  @override
  String get cash_box_all_types => 'الكل';

  @override
  String get cash_tx_purchase_out => 'شراء إخراج';

  @override
  String get cash_tx_sale_in => 'بيع إدخال';

  @override
  String get cash_tx_customer_return_out => 'إرجاع عميل إخراج';

  @override
  String get cash_tx_supplier_return_in => 'إرجاع مورد إدخال';

  @override
  String get cash_tx_customer_debt_payment_in => 'سداد دين عميل إدخال';

  @override
  String get cash_tx_supplier_debt_payment_out => 'سداد دين مورد إخراج';

  @override
  String get cash_tx_manual_in => 'إدخال يدوي';

  @override
  String get cash_tx_manual_out => 'إخراج يدوي';

  @override
  String get debts_title => 'ديون الموردين';

  @override
  String get debts_empty => 'لا توجد ديون للموردين.';

  @override
  String get debts_empty_hint => 'تظهر الديون عند تسجيل فاتورة شراء بالأجل.';

  @override
  String get debts_load_error => 'تعذّر تحميل ديون الموردين حالياً.';

  @override
  String get debts_filter_supplier => 'المورد';

  @override
  String get debts_filter_status => 'الحالة';

  @override
  String get stock_adjustments_title => 'تعديلات المخزون';

  @override
  String get stock_adjustments_empty => 'لا توجد تعديلات بعد.';

  @override
  String get stock_adjustments_empty_hint => 'ستظهر هنا التصحيحات اليدوية للمخزون التي تسجلها.';

  @override
  String get stock_adjustments_load_error => 'تعذّر تحميل تعديلات المخزون حالياً.';

  @override
  String get debt_total_amount => 'إجمالي المبلغ';

  @override
  String get debt_paid_amount => 'المدفوع';

  @override
  String get debt_remaining_amount => 'المتبقي';

  @override
  String get debt_due_date => 'تاريخ الاستحقاق';

  @override
  String get debt_no_due_date => 'بدون تاريخ استحقاق';

  @override
  String get debt_status_open => 'مفتوح';

  @override
  String get debt_status_partial => 'جزئي';

  @override
  String get debt_status_paid => 'مدفوع';

  @override
  String get debt_status_overdue => 'متأخر';

  @override
  String get debt_status_cancelled => 'ملغى';

  @override
  String get debt_payments_title => 'الدفعات';

  @override
  String get debt_no_payments => 'لا توجد دفعات مسجلة بعد.';

  @override
  String get debt_payment_date => 'تاريخ الدفعة';

  @override
  String get debt_payment_amount => 'المبلغ';

  @override
  String get invoices_title => 'فواتير الشراء';

  @override
  String get invoices_empty => 'لا توجد فواتير شراء بعد.';

  @override
  String get invoices_empty_hint => 'سجّل أول عملية شراء لبدء تتبع المخزون والتكاليف.';

  @override
  String get invoices_load_error => 'تعذّر تحميل فواتير الشراء حالياً.';

  @override
  String get invoices_search_hint => 'ابحث عن فواتير';

  @override
  String get invoices_add => 'إضافة فاتورة';

  @override
  String get invoice_invoice_number => 'رقم الفاتورة';

  @override
  String get invoice_date => 'تاريخ الفاتورة';

  @override
  String get invoice_supplier => 'المورد';

  @override
  String get invoice_subtotal => 'المجموع الفرعي';

  @override
  String get invoice_tax_total => 'الضريبة';

  @override
  String get invoice_discount_total => 'الخصم';

  @override
  String get invoice_grand_total => 'الإجمالي';

  @override
  String get invoice_amount_paid => 'المبلغ المدفوع';

  @override
  String get invoice_amount_due => 'المبلغ المستحق';

  @override
  String get invoice_payment_method => 'طريقة الدفع';

  @override
  String get invoice_payment_status => 'حالة الدفع';

  @override
  String get invoice_status => 'الحالة';

  @override
  String get invoice_items => 'العناصر';

  @override
  String get invoice_no_items => 'لا توجد عناصر.';

  @override
  String get invoice_notes => 'ملاحظات';

  @override
  String get invoice_cancel => 'إلغاء الفاتورة';

  @override
  String get invoice_cancel_title => 'إلغاء الفاتورة؟';

  @override
  String get invoice_cancel_confirm => 'إلغاء هذه الفاتورة يعكس دفعات المخزون ويعيد أي مبلغ نقدي مدفوع. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get invoice_cancelled => 'تم إلغاء الفاتورة بنجاح.';

  @override
  String get invoice_already_cancelled => 'هذه الفاتورة ملغاة بالفعل.';

  @override
  String get invoice_status_completed => 'مكتملة';

  @override
  String get invoice_status_cancelled => 'ملغاة';

  @override
  String get invoice_status_pending => 'قيد الانتظار';

  @override
  String get invoice_payment_status_paid => 'مدفوعة';

  @override
  String get invoice_payment_status_partial => 'جزئية';

  @override
  String get invoice_payment_status_unpaid => 'غير مدفوعة';

  @override
  String get invoice_payment_method_cash => 'نقدي';

  @override
  String get invoice_payment_method_credit => 'آجل';

  @override
  String get invoice_payment_method_debt => 'دين';

  @override
  String get invoice_add_title => 'فاتورة شراء جديدة';

  @override
  String get invoice_section_main => 'تفاصيل الفاتورة';

  @override
  String get invoice_section_main_sub => 'المورد والتاريخ والدفع';

  @override
  String get invoice_section_items => 'العناصر';

  @override
  String get invoice_section_items_sub => 'المنتجات والكميات والتسعير';

  @override
  String get invoice_select_supplier => 'اختر مورداً';

  @override
  String get invoice_item_product => 'المنتج';

  @override
  String get invoice_item_quantity => 'الكمية';

  @override
  String get invoice_item_wholesale_price => 'سعر الجملة';

  @override
  String get invoice_item_tax => 'الضريبة';

  @override
  String get invoice_item_discount => 'الخصم';

  @override
  String get invoice_item_batch_number => 'رقم الدفعة';

  @override
  String get invoice_item_expiry_date => 'تاريخ الانتهاء';

  @override
  String get invoice_item_selling_price => 'سعر البيع';

  @override
  String get invoice_item_optional => 'اختياري';

  @override
  String get invoice_item_add => 'إضافة عنصر';

  @override
  String get invoice_item_remove => 'إزالة';

  @override
  String get invoice_totals_summary => 'الملخص';

  @override
  String get invoice_amount_paid_hint => 'المبلغ المدفوع';

  @override
  String get invoice_created => 'تم إنشاء فاتورة الشراء بنجاح.';

  @override
  String get invoice_amount_paid_invalid => 'أدخل مبلغاً مدفوعاً صحيحاً (صفر أو أكثر).';

  @override
  String get invoice_amount_paid_exceeds_total => 'المبلغ المدفوع لا يمكن أن يتجاوز الإجمالي.';

  @override
  String get invoice_no_items_added => 'أضف عنصراً واحداً على الأقل.';

  @override
  String get invoice_item_product_required => 'اختر منتجاً لكل عنصر.';

  @override
  String get invoice_item_quantity_required => 'الكمية يجب أن تكون 1 على الأقل.';

  @override
  String get invoice_item_price_required => 'سعر الجملة مطلوب.';

  @override
  String get remove_stock => 'إزالة مخزون';

  @override
  String get remove_stock_title => 'إزالة مخزون';

  @override
  String get remove_stock_subtitle => 'سجّل خصمًا يدويًا من المخزون لهذا المنتج.';

  @override
  String get remove_stock_section => 'الدفعة والكمية';

  @override
  String get remove_stock_section_sub => 'اختر دفعة وكمية للإزالة';

  @override
  String get remove_stock_batch => 'الدفعة';

  @override
  String get remove_stock_quantity => 'الكمية المراد إزالتها';

  @override
  String get remove_stock_notes => 'ملاحظات';

  @override
  String get remove_stock_too_much => 'لا يمكن أن تتجاوز الكمية الكمية المتاحة في الدفعة.';

  @override
  String get remove_stock_no_batches => 'لا توجد دفعات بمخزون متاح.';

  @override
  String get stock_removed => 'تمت إزالة المخزون بنجاح.';

  @override
  String get bulk_adjustment_title => 'تعديل مخزون متعدد';

  @override
  String get bulk_adjustment_subtitle => 'تطبيق عدة تعديلات إضافة/إزالة في معاملة واحدة. يتم تنفيذ كل الصفوف معًا أو لا شيء.';

  @override
  String get bulk_adjustment_section => 'التعديلات';

  @override
  String get bulk_adjustment_section_sub => 'صف لكل منتج';

  @override
  String get bulk_adjustment_saved => 'تم تطبيق التعديل المتعدد بنجاح.';

  @override
  String get bulk_apply => 'تطبيق التعديلات';

  @override
  String get bulk_add => 'إضافة';

  @override
  String get bulk_remove => 'إزالة';

  @override
  String get bulk_no_items => 'أضف تعديلاً واحداً على الأقل.';

  @override
  String get bulk_add_item => 'إضافة تعديل';

  @override
  String get bulk_item_product => 'المنتج';

  @override
  String get bulk_item_product_hint => 'اختر منتجًا';

  @override
  String get bulk_item_product_required => 'اختر منتجًا.';

  @override
  String get bulk_item_quantity => 'الكمية';

  @override
  String get bulk_item_qty_required => 'أدخل كمية صحيحة (1 أو أكثر).';

  @override
  String get bulk_item_purchase_price => 'سعر الشراء';

  @override
  String get bulk_item_selling_price => 'سعر البيع';

  @override
  String get bulk_item_price_required => 'أدخل سعر الشراء وسعر البيع.';

  @override
  String get bulk_item_batch => 'الدفعة';

  @override
  String get bulk_item_no_batches => 'لا توجد دفعات بمخزون متاح.';

  @override
  String get bulk_item_batch_required => 'اختر دفعة.';

  @override
  String get bulk_item_batch_details => 'تفاصيل الدفعة';

  @override
  String get bulk_item_batch_number => 'رقم الدفعة';

  @override
  String get bulk_item_expiry_date => 'تاريخ الانتهاء';

  @override
  String get bulk_item_notes => 'ملاحظات';

  @override
  String get bulk_item_optional => 'اختياري';

  @override
  String get detail_remove_batch => 'إزالة مخزون';

  @override
  String get inventory_show_deleted => 'إظهار المحذوفة';

  @override
  String get restore => 'استعادة';

  @override
  String get restore_product_title => 'استعادة المنتج';

  @override
  String get product_restore => 'استعادة';

  @override
  String get product_restore_confirm => 'استعادة هذا المنتج؟ سيعود متاحًا.';

  @override
  String get product_restored => 'تمت استعادة المنتج بنجاح.';

  @override
  String get product_deleted_pill => 'محذوف';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get profile_title => 'الملف الشخصي';

  @override
  String get profile_verified => 'موثّق';

  @override
  String get profile_not_verified => 'غير موثّق';

  @override
  String get profile_phone => 'الهاتف';

  @override
  String get profile_email => 'البريد الإلكتروني';

  @override
  String get profile_name => 'الاسم';

  @override
  String get profile_load_error => 'تعذّر تحميل الملف الشخصي.';

  @override
  String get scan => 'مسح';

  @override
  String get scan_barcode => 'مسح الباركود';

  @override
  String get scan_title => 'امسح باركود المنتج';

  @override
  String get scan_not_found => 'لم يتم العثور على المنتج';

  @override
  String get scan_not_found_offer_create => 'لا يوجد منتج بهذا الباركود. هل تريد إنشاء منتج جديد بهذا الباركود؟';

  @override
  String get scan_create => 'إنشاء منتج';

  @override
  String get scan_enter_manually => 'إدخال يدوي';

  @override
  String get scan_camera_permission_denied => 'تم رفض إذن الكاميرا. يمكنك إدخال الباركود يدويًا.';

  @override
  String get scan_looking_up => 'جارٍ البحث عن المنتج…';

  @override
  String get scan_action_title => 'المنتج الممسوح';

  @override
  String get scan_action_view => 'عرض المنتج';

  @override
  String get scan_action_add_sale => 'إضافة لفاتورة مبيعات';

  @override
  String get scan_action_add_purchase => 'إضافة لفاتورة مشتريات';

  @override
  String scan_added_to_form(String name) {
    return 'تمت الإضافة: $name';
  }

  @override
  String get finance_title => 'المالية';

  @override
  String get finance_sales => 'المبيعات';

  @override
  String get finance_purchasing => 'المشتريات';

  @override
  String get finance_cash_box => 'الصندوق النقدي';

  @override
  String get settings_customers => 'العملاء';

  @override
  String get settings_sales_invoices => 'فواتير البيع';

  @override
  String get customers_title => 'العملاء';

  @override
  String get customers_search_hint => 'ابحث عن العملاء';

  @override
  String get customers_show_deleted => 'إظهار المحذوفين';

  @override
  String get customers_empty => 'لا يوجد عملاء بعد.';

  @override
  String get customers_empty_hint => 'أضف أول عميل لبدء البيع بالأجل.';

  @override
  String get customers_add => 'إضافة عميل';

  @override
  String get customer_add_title => 'إضافة عميل';

  @override
  String get customer_edit_title => 'تعديل العميل';

  @override
  String get customer_section => 'تفاصيل العميل';

  @override
  String get customer_section_sub => 'الاسم ومعلومات التواصل';

  @override
  String get customer_name => 'اسم العميل';

  @override
  String get customer_phone => 'الهاتف';

  @override
  String get customer_notes => 'ملاحظات';

  @override
  String get customer_created => 'تم إنشاء العميل بنجاح.';

  @override
  String get customer_updated => 'تم تحديث العميل بنجاح.';

  @override
  String get customer_deleted => 'تم حذف العميل بنجاح.';

  @override
  String get customer_restored => 'تمت استعادة العميل بنجاح.';

  @override
  String get customer_restore => 'استعادة';

  @override
  String get customer_delete_title => 'حذف العميل';

  @override
  String get customer_delete_confirm => 'هل أنت متأكد من حذف هذا العميل؟';

  @override
  String get sales_invoices_title => 'فواتير البيع';

  @override
  String get sales_invoices_empty => 'لا توجد فواتير بيع بعد.';

  @override
  String get sales_invoices_empty_hint => 'سجّل أول عملية بيع لبدء تتبع الإيرادات والمخزون.';

  @override
  String get sales_invoices_add => 'بيع جديد';

  @override
  String get sales_invoice_add_title => 'بيع جديد';

  @override
  String get sales_invoice_section_main => 'تفاصيل البيع';

  @override
  String get sales_invoice_section_main_sub => 'العميل والتاريخ والدفع';

  @override
  String get sales_invoice_section_items_sub => 'المنتجات والكميات والتسعير';

  @override
  String get sales_invoice_customer => 'العميل';

  @override
  String get sales_invoice_select_customer => 'اختر عميلاً';

  @override
  String get sales_invoice_due_date => 'تاريخ الاستحقاق';

  @override
  String get sales_invoice_optional => 'اختياري';

  @override
  String get sales_invoice_customer_debt => 'دين العميل';

  @override
  String get sales_invoice_cancelled => 'تم إلغاء الفاتورة بنجاح.';

  @override
  String get sales_invoice_already_cancelled => 'هذه الفاتورة ملغاة بالفعل.';

  @override
  String get sales_invoice_cancel => 'إلغاء الفاتورة';

  @override
  String get sales_invoice_cancel_title => 'إلغاء الفاتورة؟';

  @override
  String get sales_invoice_cancel_confirm => 'إلغاء هذه الفاتورة يعكس خصم المخزون ويعيد أي مبلغ نقدي مدفوع. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get sales_invoice_created => 'تم تسجيل البيع بنجاح.';

  @override
  String get sales_invoice_item_selling_price => 'سعر البيع';

  @override
  String get sales_invoice_no_items_added => 'أضف عنصراً واحداً على الأقل.';

  @override
  String get sales_invoice_item_product_required => 'اختر منتجاً لكل عنصر.';

  @override
  String get sales_invoice_item_quantity_required => 'الكمية يجب أن تكون 1 على الأقل.';

  @override
  String get sales_invoice_item_price_required => 'سعر البيع يجب أن يكون أكبر من 0.';

  @override
  String get sales_invoice_amount_paid_invalid => 'أدخل مبلغاً مدفوعاً صحيحاً (صفر أو أكثر).';

  @override
  String get sales_invoice_amount_paid_exceeds_total => 'المبلغ المدفوع لا يمكن أن يتجاوز الإجمالي.';

  @override
  String get sales_invoice_customer_required_unpaid => 'اختر عميلاً — العميل مطلوب عندما لا يكون البيع مدفوعاً بالكامل.';
}
