// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AccessibilityLocalizationsBn extends AccessibilityLocalizations {
  AccessibilityLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get accessibility => 'প্রবেশযোগ্যতা';

  @override
  String get accessibility_settings => 'প্রবেশযোগ্যতার সেটিংস';

  @override
  String get adjust_background_colors => 'পটভূমির রঙ সামঞ্জস্য করুন';

  @override
  String get adjust_text_colors => 'লেখার রঙ সামঞ্জস্য করুন';

  @override
  String get align_center => 'কেন্দ্রে সারিবদ্ধ করুন';

  @override
  String get align_left => 'বামে সারিবদ্ধ করুন';

  @override
  String get align_right => 'ডানে সারিবদ্ধ করুন';

  @override
  String get bold_text => 'গাঢ় লেখা';

  @override
  String get change_bold_text => 'গাঢ় লেখার ধরন পরিবর্তন করুন';

  @override
  String get change_pages_background_color =>
      'পৃষ্ঠার পটভূমির রঙ পরিবর্তন করুন: ';

  @override
  String get change_text_color => 'লেখার রঙ পরিবর্তন করুন: ';

  @override
  String get change_text_color_shade => 'রঙের ছায়া পরিবর্তন করুন: ';

  @override
  String get color_adjustment => 'রঙ সামঞ্জস্য';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'স্বাভাবিক',
        'lowSaturation': 'কম স্যাচুরেশন',
        'normal': 'স্বাভাবিক',
        'highSaturation': 'উচ্চ স্যাচুরেশন',
        'monochrome': 'মনোক্রোম',
        'highContrast': 'উচ্চ কনট্রাস্ট',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'বর্তমান রঙ প্রোফাইল: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'রঙ শনাক্ত করা যায়নি',
        'cF44336': 'লাল',
        'cE91E63': 'গোলাপি',
        'c9C27B0': 'বেগুনি',
        'c673AB7': 'গাঢ় বেগুনি',
        'c3F51B5': 'ইন্ডিগো',
        'c2196F3': 'নীল',
        'c03A9F4': 'হালকা নীল',
        'c00BCD4': 'সায়ান',
        'c009688': 'টিল',
        'c4CAF50': 'সবুজ',
        'c8BC34A': 'হালকা সবুজ',
        'cCDDC39': 'লেম',
        'cFFEB3B': 'হলুদ',
        'cFFC107': 'অ্যাম্বার',
        'cFF9800': 'কমলা',
        'cFF5722': 'গাঢ় কমলা',
        'c795548': 'বাদামী',
        'c9E9E9E': 'ধূসর',
        'c607D8B': 'নীল-ধূসর',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'শব্দের ব্যবধান কমান';

  @override
  String get decrement_letter_spacing => 'অক্ষরের ব্যবধান কমান';

  @override
  String get decrement_line_height => 'লাইনের উচ্চতা কমান';

  @override
  String get decrement_text_scale_factor => 'টেক্সট স্কেল ফ্যাক্টর কমান';

  @override
  String get effects => 'প্রভাবসমূহ';

  @override
  String get expand_text => 'টেক্সট প্রসারিত করুন';

  @override
  String get font_size => 'ফন্টের আকার';

  @override
  String get increase_or_decrease_word_spacing =>
      'শব্দের ব্যবধান বাড়ান বা কমান';

  @override
  String get increase_or_decrease_letter_spacing =>
      'অক্ষরের ব্যবধান বাড়ান বা কমান';

  @override
  String get increase_or_decrease_line_height => 'লাইনের উচ্চতা বাড়ান বা কমান';

  @override
  String get increase_or_decrease_text_size => 'লেখার আকার বাড়ান বা কমান';

  @override
  String get increment_word_spacing => 'শব্দের ব্যবধান বাড়ান';

  @override
  String get increment_letter_spacing => 'অক্ষরের ব্যবধান বাড়ান';

  @override
  String get increment_line_height => 'লাইনের উচ্চতা বাড়ান';

  @override
  String get increment_text_scale_factor => 'টেক্সট স্কেল ফ্যাক্টর বাড়ান';

  @override
  String get less_info => 'তথ্য লুকান';

  @override
  String get letter_spacing => 'অক্ষরের ব্যবধান';

  @override
  String get line_height => 'লাইনের উচ্চতা';

  @override
  String get more_info => 'তথ্য দেখান';

  @override
  String get read_less => 'কম পড়ুন';

  @override
  String get read_more => 'আরও পড়ুন';

  @override
  String get reduce_effects => 'স্ক্রিনে প্রভাব কমান';

  @override
  String get reduce_text => 'লেখা সংক্ষিপ্ত করুন';

  @override
  String get restore_settings => 'সেটিংস পুনরুদ্ধার করুন';

  @override
  String get restore_main_color => 'মূল রঙ পুনরুদ্ধার করুন';

  @override
  String get return_to_main_colors => 'মূল রঙে ফিরে যান';

  @override
  String get settings => 'সেটিংস';

  @override
  String get size_and_text_display => 'আকার ও টেক্সট প্রদর্শন';

  @override
  String get slider_word_spacing => 'শব্দ ব্যবধান স্লাইডার';

  @override
  String get slider_letter_spacing => 'অক্ষর ব্যবধান স্লাইডার';

  @override
  String get slider_line_height => 'লাইন উচ্চতা স্লাইডার';

  @override
  String get theme_mode => 'থিম';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'থিম প্রোফাইল সনাক্ত করা যায়নি',
        'seizureSafe': 'সিজার-নিরাপদ',
        'visionImpaired': 'দৃষ্টিপ্রতিবন্ধী',
        'adhdFriendly': 'ADHD-বান্ধব',
        'none': 'ডিফল্ট',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'সিজার-নিরাপদ প্রোফাইল';

  @override
  String get theme_profile_seizure_safe_subtitle => 'প্রতিফলন সরান এবং রঙ কমান';

  @override
  String get theme_profile_seizure_safe_description =>
      'এই প্রোফাইলটি মৃগী বা খিঁচুনি ঝুঁকিপূর্ণ ব্যবহারকারীদের জন্য নিরাপদ ব্রাউজিং নিশ্চিত করে, ঝলমলে অ্যানিমেশন ও বিপজ্জনক রঙের সংমিশ্রণ সরিয়ে।';

  @override
  String get theme_profile_vision_impaired_title => 'দৃষ্টিপ্রতিবন্ধী প্রোফাইল';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'অ্যাপ্লিকেশনের দৃশ্যমানতা উন্নত করুন';

  @override
  String get theme_profile_vision_impaired_description =>
      'এই প্রোফাইলটি অ্যাপ্লিকেশনকে বিভিন্ন দৃষ্টিপ্রতিবন্ধকতা, যেমন টানেল ভিশন, ক্যাটারাক্ট, গ্লুকোমা ইত্যাদির জন্য আরও প্রবেশযোগ্য করে তোলে।';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-বান্ধব প্রোফাইল';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'বেশি মনোযোগ, কম বিভ্রান্তি';

  @override
  String get theme_profile_adhd_friendly_description =>
      'এই প্রোফাইলটি ADHD ও নিউরোডেভেলপমেন্টাল ডিসঅর্ডারযুক্ত ব্যক্তিদের জন্য বিভ্রান্তি কমিয়ে, অ্যাপের গুরুত্বপূর্ণ অংশে মনোযোগ দিতে সহায়তা করে।';

  @override
  String get the_settings_have_been_reset => 'সেটিংস রিসেট করা হয়েছে।';

  @override
  String get toggle_dark_mode => 'ডার্ক মোড চালু/বন্ধ করুন';

  @override
  String get toggle_effects_mode => 'ইফেক্ট মোড চালু/বন্ধ করুন';

  @override
  String get toggle_font_weight => 'ফন্টের ওজন চালু/বন্ধ করুন';

  @override
  String get toggle_theme_profile => 'থিম প্রোফাইল চালু/বন্ধ করুন';

  @override
  String get word_spacing => 'শব্দের ব্যবধান';

  @override
  String get accessible_font => 'প্রবেশযোগ্য ফন্ট';

  @override
  String get accessible_font_subtitle =>
      'উন্নত পাঠযোগ্যতার জন্য Verdana ফন্ট ব্যবহার করুন';

  @override
  String get accessible_font_enabled => 'প্রবেশযোগ্য ফন্ট সক্রিয়';

  @override
  String get accessible_font_disabled => 'প্রবেশযোগ্য ফন্ট নিষ্ক্রিয়';

  @override
  String get toggle_accessible_font => 'প্রবেশযোগ্য ফন্ট চালু/বন্ধ করুন';
}
