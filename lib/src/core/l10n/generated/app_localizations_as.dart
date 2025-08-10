// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AccessibilityLocalizationsAs extends AccessibilityLocalizations {
  AccessibilityLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get accessibility => 'প্ৰৱেশযোগ্যতা';

  @override
  String get accessibility_settings => 'প্ৰৱেশযোগ্যতা ছেটিংছ';

  @override
  String get adjust_background_colors => 'পৃষ্ঠাৰ পটভূমিৰ ৰং সলনি কৰক';

  @override
  String get adjust_text_colors => 'লিখনৰ ৰং সলনি কৰক';

  @override
  String get align_center => 'মাজত সজাওক';

  @override
  String get align_left => 'বাওঁফালে সজাওক';

  @override
  String get align_right => 'সোঁফালে সজাওক';

  @override
  String get bold_text => 'ডাঠ লিখনী';

  @override
  String get change_bold_text => 'ডাঠ লিখনী সলনি কৰক';

  @override
  String get change_pages_background_color =>
      'পৃষ্ঠাৰ পটভূমিৰ ৰং এইটোলৈ সলনি কৰক: ';

  @override
  String get change_text_color => 'লিখনৰ ৰং এইটোলৈ সলনি কৰক: ';

  @override
  String get change_text_color_shade => 'লিখনৰ ৰংৰ ছাঁ এইটোলৈ সলনি কৰক: ';

  @override
  String get color_adjustment => 'ৰং সমন্বয়';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'সাধাৰণ',
        'lowSaturation': 'কম সম্পৃক্ততা',
        'normal': 'সাধাৰণ',
        'highSaturation': 'বেছি সম্পৃক্ততা',
        'monochrome': 'এক ৰঙা',
        'highContrast': 'বেছি বৈপৰীত্য',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'বৰ্তমান ৰং প্ৰ\'ফাইল হৈছে: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'ৰং চিনাক্ত হোৱা নাই',
        'cF44336': 'ৰঙা',
        'cE91E63': 'গুলাপী',
        'c9C27B0': 'বেঙুনী',
        'c673AB7': 'গাঢ় বেঙুনী',
        'c3F51B5': 'নীলা',
        'c2196F3': 'বগা',
        'c03A9F4': 'হালধীয়া নীলা',
        'c00BCD4': 'চিয়ান',
        'c009688': 'টিল',
        'c4CAF50': 'সেউজীয়া',
        'c8BC34A': 'হালধীয়া সেউজীয়া',
        'cCDDC39': 'নিম',
        'cFFEB3B': 'হালধীয়া',
        'cFFC107': 'এম্বাৰ',
        'cFF9800': 'কমলা',
        'cFF5722': 'গাঢ় কমলা',
        'c795548': 'বাউণী',
        'c9E9E9E': 'ধূসৰ',
        'c607D8B': 'নীলা-ধূসৰ',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'শব্দৰ মাজৰ দূৰত্ব কমাওক';

  @override
  String get decrement_letter_spacing => 'আখৰৰ মাজৰ দূৰত্ব কমাওক';

  @override
  String get decrement_line_height => 'শাৰী উচ্চতা কমাওক';

  @override
  String get decrement_text_scale_factor => 'লিখন স্কেল ফেক্টৰ কমাওক';

  @override
  String get effects => 'প্ৰভাৱসমূহ';

  @override
  String get expand_text => 'লিখনী বিস্তাৰিত কৰক';

  @override
  String get font_size => 'আখৰৰ আকাৰ';

  @override
  String get increase_or_decrease_word_spacing =>
      'শব্দৰ মাজৰ দূৰত্ব বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get increase_or_decrease_letter_spacing =>
      'আখৰৰ মাজৰ দূৰত্ব বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get increase_or_decrease_line_height =>
      'শাৰী উচ্চতা বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get increase_or_decrease_text_size => 'লিখনৰ আকাৰ বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get increment_word_spacing => 'শব্দৰ মাজৰ দূৰত্ব বৃদ্ধি কৰক';

  @override
  String get increment_letter_spacing => 'আখৰৰ মাজৰ দূৰত্ব বৃদ্ধি কৰক';

  @override
  String get increment_line_height => 'শাৰী উচ্চতা বৃদ্ধি কৰক';

  @override
  String get increment_text_scale_factor => 'লিখন স্কেল ফেক্টৰ বৃদ্ধি কৰক';

  @override
  String get less_info => 'তথ্য লুকুৱাওক';

  @override
  String get letter_spacing => 'আখৰৰ মাজৰ দূৰত্ব';

  @override
  String get line_height => 'শাৰী উচ্চতা';

  @override
  String get more_info => 'তথ্য দেখুৱাওক';

  @override
  String get read_less => 'কম পঢ়ক';

  @override
  String get read_more => 'অধিক পঢ়ক';

  @override
  String get reduce_effects => 'স্ক্ৰীনৰ প্ৰভাৱসমূহ হ্ৰাস কৰক';

  @override
  String get reduce_text => 'লিখনী হ্ৰাস কৰক';

  @override
  String get restore_settings => 'ছেটিংছ পুনৰুদ্ধাৰ কৰক';

  @override
  String get restore_main_color => 'মূল ৰং পুনৰুদ্ধাৰ কৰক';

  @override
  String get return_to_main_colors => 'মূল ৰংলৈ উভতি যাওক';

  @override
  String get settings => 'ছেটিংছ';

  @override
  String get size_and_text_display => 'আকাৰ আৰু লিখন প্ৰদর্শন';

  @override
  String get slider_word_spacing => 'শব্দৰ মাজৰ দূৰত্ব সলাই থকা স্লাইডাৰ';

  @override
  String get slider_letter_spacing => 'আখৰৰ মাজৰ দূৰত্ব সলাই থকা স্লাইডাৰ';

  @override
  String get slider_line_height => 'শাৰী উচ্চতা সলাই থকা স্লাইডাৰ';

  @override
  String get theme_mode => 'থীম';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'থীম প্ৰ\'ফাইল চিনাক্ত হোৱা নাই',
        'seizureSafe': 'উপশম-নিরাপদ',
        'visionImpaired': 'দৃষ্টিহীন-সহায়ক',
        'adhdFriendly': 'ADHD-সহায়ক',
        'none': 'ডিফল্ট',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'উপশম-নিরাপদ প্ৰ\'ফাইল';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'প্ৰতিৰূপ আঁতৰাওক আৰু ৰং হ্ৰাস কৰক';

  @override
  String get theme_profile_seizure_safe_description =>
      'এই প্ৰ\'ফাইলটো মৃগী ৰোগী বা উপশমৰ আশংকা থকা ব্যৱহাৰকাৰীসকলৰ বাবে ঝলমলীয়া এনিমেশ্বন আৰু বিপজ্জনক ৰংসমূহ আঁতৰাই নিৰাপদভাৱে ব্যৱহাৰ কৰিবলৈ সহায় কৰে।';

  @override
  String get theme_profile_vision_impaired_title =>
      'দৃষ্টিহীন-সহায়ক প্ৰ\'ফাইল';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'এপ্লিকেশ্যনৰ দৃশ্যতা উন্নত কৰক';

  @override
  String get theme_profile_vision_impaired_description =>
      'এই প্ৰ\'ফাইলটোৱে দৃষ্টিহীনতা, টানেল ভিশন, ছানি, গ্লুকোমা আদি দৃষ্টিসম্বন্ধীয় অসুবিধাসমূহ থকা ব্যৱহাৰকাৰীসকলৰ বাবে এপ্লিকেশ্যনটো অধিক উপযোগী কৰে।';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-সহায়ক প্ৰ\'ফাইল';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'অধিক মনোযোগ আৰু কম বিঘ্নতা';

  @override
  String get theme_profile_adhd_friendly_description =>
      'এই প্ৰ\'ফাইলটোৱে ADHD আৰু নিউৰোডেভেলপমেন্টেল অসুবিধাসমূহ থকা ব্যৱহাৰকাৰীসকলৰ বাবে বিঘ্নতা হ্ৰাস কৰি, সহজে নেভিগেট, পঢ়া আৰু প্ৰয়োজনীয় উপাদানত মনোযোগ দিবলৈ সহায় কৰে।';

  @override
  String get the_settings_have_been_reset => 'ছেটিংছ পুনৰায় সংৰক্ষিত হৈছে।';

  @override
  String get toggle_dark_mode => 'ডাৰ্ক ম\'ড টগল কৰক';

  @override
  String get toggle_effects_mode => 'ইফেক্ট ম\'ড টগল কৰক';

  @override
  String get toggle_font_weight => 'আখৰৰ ওজন টগল কৰক';

  @override
  String get toggle_theme_profile => 'থীম প্ৰ\'ফাইল টগল কৰক';

  @override
  String get word_spacing => 'শব্দৰ মাজৰ দূৰত্ব';
}
