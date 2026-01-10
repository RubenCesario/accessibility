// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AccessibilityLocalizationsSi extends AccessibilityLocalizations {
  AccessibilityLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get accessibility => 'ප්‍රවේශ්‍යතාව';

  @override
  String get accessibility_settings => 'ප්‍රවේශ්‍යතා සැකසීම්';

  @override
  String get adjust_background_colors => 'පසුබිම් වර්ණ සකසන්න';

  @override
  String get adjust_text_colors => 'පෙළ වර්ණ සකසන්න';

  @override
  String get align_center => 'මධ්‍යයට පෙළ ගස්වන්න';

  @override
  String get align_left => 'වමට පෙළ ගස්වන්න';

  @override
  String get align_right => 'දකුණට පෙළ ගස්වන්න';

  @override
  String get bold_text => 'තද පෙළ';

  @override
  String get change_bold_text => 'තද පෙළ වෙනස් කරන්න';

  @override
  String get change_pages_background_color =>
      'පිටුවල පසුබිම් වර්ණය වෙනස් කරන්න: ';

  @override
  String get change_text_color => 'පෙළ වර්ණය වෙනස් කරන්න: ';

  @override
  String get change_text_color_shade => 'වර්ණයේ ශේඩ් වෙනස් කරන්න: ';

  @override
  String get color_adjustment => 'වර්ණ ගැලපීම';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'සාමාන්‍ය',
        'lowSaturation': 'අඩු සංතෘප්තිය',
        'normal': 'සාමාන්‍ය',
        'highSaturation': 'ඉහළ සංතෘප්තිය',
        'monochrome': 'එකවර්ණ',
        'highContrast': 'ඉහළ අනුපාතය',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'වර්තමාන වර්ණ පැතිකඩ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'වර්ණය හඳුනාගත නොහැක',
        'cF44336': 'රතු',
        'cE91E63': 'රෝස',
        'c9C27B0': 'දම් පාට',
        'c673AB7': 'ගැඹුරු දම් පාට',
        'c3F51B5': 'ඉන්ඩිගෝ',
        'c2196F3': 'නිල්',
        'c03A9F4': 'ළා නිල්',
        'c00BCD4': 'සයන්',
        'c009688': 'ටීල්',
        'c4CAF50': 'කොළ',
        'c8BC34A': 'ළා කොළ',
        'cCDDC39': 'දෙහි',
        'cFFEB3B': 'කහ',
        'cFFC107': 'ඇම්බර්',
        'cFF9800': 'තැම්බිලි',
        'cFF5722': 'ගැඹුරු තැම්බිලි',
        'c795548': 'දුඹුරු',
        'c9E9E9E': 'අළු',
        'c607D8B': 'නිල්-අළු',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'වචන අතර පරතරය අඩු කරන්න';

  @override
  String get decrement_letter_spacing => 'අකුරු අතර පරතරය අඩු කරන්න';

  @override
  String get decrement_line_height => 'පේළි උස අඩු කරන්න';

  @override
  String get decrement_text_scale_factor => 'පෙළ පරිමාණ සාධකය අඩු කරන්න';

  @override
  String get effects => 'බලපෑම්';

  @override
  String get expand_text => 'පෙළ විස්තීරණය කරන්න';

  @override
  String get font_size => 'අකුරු ප්‍රමාණය';

  @override
  String get increase_or_decrease_word_spacing =>
      'වචන අතර පරතරය වැඩි හෝ අඩු කරන්න';

  @override
  String get increase_or_decrease_letter_spacing =>
      'අකුරු අතර පරතරය වැඩි හෝ අඩු කරන්න';

  @override
  String get increase_or_decrease_line_height => 'පේළි උස වැඩි හෝ අඩු කරන්න';

  @override
  String get increase_or_decrease_text_size => 'පෙළ ප්‍රමාණය වැඩි හෝ අඩු කරන්න';

  @override
  String get increment_word_spacing => 'වචන අතර පරතරය වැඩි කරන්න';

  @override
  String get increment_letter_spacing => 'අකුරු අතර පරතරය වැඩි කරන්න';

  @override
  String get increment_line_height => 'පේළි උස වැඩි කරන්න';

  @override
  String get increment_text_scale_factor => 'පෙළ පරිමාණ සාධකය වැඩි කරන්න';

  @override
  String get less_info => 'තොරතුරු සඟවන්න';

  @override
  String get letter_spacing => 'අකුරු අතර පරතරය';

  @override
  String get line_height => 'පේළි උස';

  @override
  String get more_info => 'තොරතුරු පෙන්වන්න';

  @override
  String get read_less => 'අඩුවෙන් කියවන්න';

  @override
  String get read_more => 'වැඩියෙන් කියවන්න';

  @override
  String get reduce_effects => 'තිරයට ඇති බලපෑම් අඩු කරන්න';

  @override
  String get reduce_text => 'පෙළ අඩු කරන්න';

  @override
  String get restore_settings => 'සැකසීම් නැවත සකසන්න';

  @override
  String get restore_main_color => 'ප්‍රධාන වර්ණය නැවත සකසන්න';

  @override
  String get return_to_main_colors => 'ප්‍රධාන වර්ණ වලට නැවත යන්න';

  @override
  String get settings => 'සැකසීම්';

  @override
  String get size_and_text_display => 'ප්‍රමාණය සහ පෙළ ප්‍රදර්ශනය';

  @override
  String get slider_word_spacing => 'වචන අතර පරතරය ස්ලයිඩරය';

  @override
  String get slider_letter_spacing => 'අකුරු අතර පරතරය ස්ලයිඩරය';

  @override
  String get slider_line_height => 'පේළි උස ස්ලයිඩරය';

  @override
  String get theme_mode => 'තේමාව';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'තේමා පැතිකඩ හඳුනාගත නොහැක',
        'seizureSafe': 'අපස්මාරයෙන් ආරක්ෂිත',
        'visionImpaired': 'දෘෂ්ටි ආබාධිත',
        'adhdFriendly': 'ADHD හිතකාමී',
        'none': 'පෙරනිමි',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'අපස්මාරයෙන් ආරක්ෂිත පැතිකඩ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'ප්‍රතිබිම්බ ඉවත් කර වර්ණ අඩු කරන්න';

  @override
  String get theme_profile_seizure_safe_description =>
      'මෙම පැතිකඩ මගින් අපස්මාර රෝගය ඇති සහ අපස්මාර අවදානමක් ඇති පරිශීලකයින්ට විද්යුත් සංචලන සහ අවදානම් සහිත වර්ණ සංයෝග මගින් ඇතිවන අපස්මාර අවදානම ඉවත් කරමින් ආරක්ෂිතව පිරික්සීමට ඉඩ සලසයි.';

  @override
  String get theme_profile_vision_impaired_title => 'දෘෂ්ටි ආබාධිත පැතිකඩ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'යෙදුමේ දෘශ්‍යමානතාවය වැඩි දියුණු කරන්න';

  @override
  String get theme_profile_vision_impaired_description =>
      'මෙම පැතිකඩ යෙදුම දෘෂ්ටි ආබාධ, ටනල් දෘෂ්ටිය, කැටරැක්ට්, ග්ලූකෝමා සහ තවත් බොහෝ දෘෂ්ටි ආබාධ සහිත පුද්ගලයින්ට ප්‍රවේශ විය හැකි පරිදි යෙදුම අනුවර්තනය කරයි.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-හිතකාමී පැතිකඩ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'වැඩි අවධානයක් සහ අඩු විසිරීමක්';

  @override
  String get theme_profile_adhd_friendly_description =>
      'මෙම පැතිකඩ මගින් ADHD සහ ස්නායු සංවර්ධන ආබාධ සහිත පුද්ගලයින්ට යෙදුමේ අත්‍යවශ්‍ය කොටස් වලට පහසුවෙන් සංචාලනය කිරීමට, කියවීමට සහ අවධානය යොමු කිරීමට උපකාර වන පරිදි විසිරීම් සැලකිය යුතු ලෙස අඩු කරයි.';

  @override
  String get the_settings_have_been_reset => 'සැකසීම් නැවත සකසා ඇත.';

  @override
  String get toggle_dark_mode => 'අඳුරු මාදිලිය මාරු කරන්න';

  @override
  String get toggle_effects_mode => 'බලපෑම් මාදිලිය මාරු කරන්න';

  @override
  String get toggle_font_weight => 'අකුරු බර මාරු කරන්න';

  @override
  String get toggle_theme_profile => 'තේමා පැතිකඩ මාරු කරන්න';

  @override
  String get word_spacing => 'වචන අතර පරතරය';

  @override
  String get accessible_font => 'ප්‍රවේශ විය හැකි අකුරු';

  @override
  String get accessible_font_subtitle =>
      'වඩා හොඳ කියවීමක් සඳහා Verdana අකුරු භාවිතා කරන්න';

  @override
  String get accessible_font_enabled => 'ප්‍රවේශ විය හැකි අකුරු සක්‍රීයයි';

  @override
  String get accessible_font_disabled => 'ප්‍රවේශ විය හැකි අකුරු අක්‍රීයයි';

  @override
  String get toggle_accessible_font => 'ප්‍රවේශ විය හැකි අකුරු මාරු කරන්න';
}
