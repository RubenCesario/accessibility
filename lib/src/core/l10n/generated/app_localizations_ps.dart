// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pushto Pashto (`ps`).
class AccessibilityLocalizationsPs extends AccessibilityLocalizations {
  AccessibilityLocalizationsPs([String locale = 'ps']) : super(locale);

  @override
  String get accessibility => 'لاسرسی';

  @override
  String get accessibility_settings => 'د لاسرسي تنظیمات';

  @override
  String get adjust_background_colors => 'د شاته رنگونه تنظیم کړئ';

  @override
  String get adjust_text_colors => 'د متن رنگونه تنظیم کړئ';

  @override
  String get align_center => 'منځ ته برابر کړئ';

  @override
  String get align_left => 'کیڼ ته برابر کړئ';

  @override
  String get align_right => 'ښي ته برابر کړئ';

  @override
  String get bold_text => 'پنډ متن';

  @override
  String get change_bold_text => 'پنډ متن بدل کړئ';

  @override
  String get change_pages_background_color => 'د پاڼو د شاته رنگ بدل کړئ په: ';

  @override
  String get change_text_color => 'د متن رنگ بدل کړئ په: ';

  @override
  String get change_text_color_shade => 'د رنگ سيوری بدل کړئ په: ';

  @override
  String get color_adjustment => 'د رنگ تنظیم';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'نورمال',
        'lowSaturation': 'ٺيٺ مشبوعيت',
        'normal': 'نورمال',
        'highSaturation': 'لوړ مشبوعيت',
        'monochrome': 'يو رنگه',
        'highContrast': 'لوړ تضاد',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'اوسنی د رنگ پروفايل دی: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'رنگ نه دی پېژندل شوی',
        'cF44336': 'سور',
        'cE91E63': 'گلابي',
        'c9C27B0': 'ارغواني',
        'c673AB7': 'ژور ارغواني',
        'c3F51B5': 'نيلي',
        'c2196F3': 'شين',
        'c03A9F4': 'روښانه شين',
        'c00BCD4': 'آسماني',
        'c009688': 'شين شين',
        'c4CAF50': 'شين',
        'c8BC34A': 'روښانه شين',
        'cCDDC39': 'ليمويي',
        'cFFEB3B': 'ژيړ',
        'cFFC107': 'کهربايي',
        'cFF9800': 'نارنجي',
        'cFF5722': 'ژور نارنجي',
        'c795548': 'نسواري',
        'c9E9E9E': 'خړ',
        'c607D8B': 'شين خړ',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'د کلمو ترمنځ واټن کم کړئ';

  @override
  String get decrement_letter_spacing => 'د تورو ترمنځ واټن کم کړئ';

  @override
  String get decrement_line_height => 'د کرښې لوړوالی کم کړئ';

  @override
  String get decrement_text_scale_factor => 'د متن د مقياس فکټور کم کړئ';

  @override
  String get effects => 'اغېزې';

  @override
  String get expand_text => 'متن پراخ کړئ';

  @override
  String get font_size => 'د ليک اندازه';

  @override
  String get increase_or_decrease_word_spacing =>
      'د کلمو ترمنځ واټن زيات يا کم کړئ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'د تورو ترمنځ واټن زيات يا کم کړئ';

  @override
  String get increase_or_decrease_line_height =>
      'د کرښې لوړوالی زيات يا کم کړئ';

  @override
  String get increase_or_decrease_text_size => 'د متن اندازه زيات يا کم کړئ';

  @override
  String get increment_word_spacing => 'د کلمو ترمنځ واټن زيات کړئ';

  @override
  String get increment_letter_spacing => 'د تورو ترمنځ واټن زيات کړئ';

  @override
  String get increment_line_height => 'د کرښې لوړوالی زيات کړئ';

  @override
  String get increment_text_scale_factor => 'د متن د مقياس فکټور زيات کړئ';

  @override
  String get less_info => 'معلومات پټ کړئ';

  @override
  String get letter_spacing => 'د تورو ترمنځ واټن';

  @override
  String get line_height => 'د کرښې لوړوالی';

  @override
  String get more_info => 'معلومات ښکاره کړئ';

  @override
  String get read_less => 'لږ ولولئ';

  @override
  String get read_more => 'نور ولولئ';

  @override
  String get reduce_effects => 'په سکرين باندې اغېزې کمې کړئ';

  @override
  String get reduce_text => 'متن کم کړئ';

  @override
  String get restore_settings => 'تنظیمات بیا په خپل حالت راولئ';

  @override
  String get restore_main_color => 'اصلي رنگ بیا په خپل حالت راولئ';

  @override
  String get return_to_main_colors => 'اصلي رنگونو ته بېرته راوګرځئ';

  @override
  String get settings => 'تنظیمات';

  @override
  String get size_and_text_display => 'د اندازې او متن ښودل';

  @override
  String get slider_word_spacing => 'د کلمو ترمنځ واټن سلايډر';

  @override
  String get slider_letter_spacing => 'د تورو ترمنځ واټن سلايډر';

  @override
  String get slider_line_height => 'د کرښې لوړوالي سلايډر';

  @override
  String get theme_mode => 'تهیم';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'د تهیم پروفايل نه دی پېژندل شوی',
        'seizureSafe': 'د ميرګي لپاره خوندي',
        'visionImpaired': 'د ليد معذوريت لپاره',
        'adhdFriendly': 'د ADHD لپاره مناسب',
        'none': 'اصلي',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'د ميرگي لپاره خوندي پروفايل';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'انعکاسات لرې کړئ او رنگ کم کړئ';

  @override
  String get theme_profile_seizure_safe_description =>
      'دا پروفايل هغه کاروونکي ته اجازه ورکوي چې ميرگي لري او د ميرگي د حملو په خطر کې دي چې په خوندي توګه براوز وکړي په دې توګه چې د ځلېدونکو انیمیشنونو او خطرناکه رنگ ترکيبونو له امله د ميرگي د حملو خطر له منځه وړي.';

  @override
  String get theme_profile_vision_impaired_title => 'د ليد معذوريت پروفايل';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'د اپلیکېشن د ليدلو وړتيا ښه کړئ';

  @override
  String get theme_profile_vision_impaired_description =>
      'دا پروفايل اپلیکېشن داسې عياروي چې د زياتره ليدلو معذوريتونو لپاره د لاسرسي وړ وي، لکه د ليدلو معذوريت، تونل ليد، مرواريد، گلوکوما او نور.';

  @override
  String get theme_profile_adhd_friendly_title => 'د ADHD لپاره مناسب پروفايل';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'زيات تمرکز او لږ حواس پرتي';

  @override
  String get theme_profile_adhd_friendly_description =>
      'دا پروفايل په پام وړ توګه حواس پرتي کموي، ترڅو د ADHD او عصبي پرمختیايي اختلالاتو لرونکو خلکو سره مرسته وکړي چې نيويګيټ کړي، ولولي، او په اسانۍ سره د اپلیکېشن په اساسي برخو تمرکز وکړي.';

  @override
  String get the_settings_have_been_reset => 'تنظیمات بیا تنظیم شوي دي.';

  @override
  String get toggle_dark_mode => 'تور حالت بدل کړئ';

  @override
  String get toggle_effects_mode => 'د اغېزو حالت بدل کړئ';

  @override
  String get toggle_font_weight => 'د ليک وزن بدل کړئ';

  @override
  String get toggle_theme_profile => 'د تهیم پروفايل بدل کړئ';

  @override
  String get word_spacing => 'د کلمو ترمنځ واټن';

  @override
  String get accessible_font => 'د لاسرسي وړ لیک';

  @override
  String get accessible_font_subtitle => 'د ښه لوستلو لپاره Verdana لیک وکاروئ';

  @override
  String get accessible_font_enabled => 'د لاسرسي وړ لیک فعال شو';

  @override
  String get accessible_font_disabled => 'د لاسرسي وړ لیک غیرفعال شو';

  @override
  String get toggle_accessible_font => 'د لاسرسي وړ لیک بدل کړئ';
}
