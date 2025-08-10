// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AccessibilityLocalizationsPa extends AccessibilityLocalizations {
  AccessibilityLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get accessibility => 'ਪਹੁੰਚਯੋਗਤਾ';

  @override
  String get accessibility_settings => 'ਪਹੁੰਚਯੋਗਤਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get adjust_background_colors => 'ਪਿਛੋਕੜ ਦੇ ਰੰਗਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ';

  @override
  String get adjust_text_colors => 'ਟੈਕਸਟ ਦੇ ਰੰਗਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ';

  @override
  String get align_center => 'ਵਿਚਕਾਰ ਸਜਾਓ';

  @override
  String get align_left => 'ਖੱਬੇ ਸਜਾਓ';

  @override
  String get align_right => 'ਸੱਜੇ ਸਜਾਓ';

  @override
  String get bold_text => 'ਮੋਟਾ ਟੈਕਸਟ';

  @override
  String get change_bold_text => 'ਮੋਟੇ ਟੈਕਸਟ ਨੂੰ ਬਦਲੋ';

  @override
  String get change_pages_background_color =>
      'ਪੰਨਿਆਂ ਦੇ ਪਿਛੋਕੜ ਦੇ ਰੰਗ ਨੂੰ ਬਦਲੋ: ';

  @override
  String get change_text_color => 'ਟੈਕਸਟ ਦੇ ਰੰਗ ਨੂੰ ਬਦਲੋ: ';

  @override
  String get change_text_color_shade => 'ਰੰਗ ਦੀ ਛਾਂ ਨੂੰ ਬਦਲੋ: ';

  @override
  String get color_adjustment => 'ਰੰਗ ਵਿਵਸਥਾ';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'ਸਧਾਰਨ',
        'lowSaturation': 'ਘੱਟ ਸੰਤ੍ਰਿਪਤੀ',
        'normal': 'ਸਧਾਰਨ',
        'highSaturation': 'ਉੱਚ ਸੰਤ੍ਰਿਪਤੀ',
        'monochrome': 'ਇਕਰੰਗਾ',
        'highContrast': 'ਉੱਚ ਕੰਟਰਾਸਟ',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'ਮੌਜੂਦਾ ਰੰਗ ਪ੍ਰੋਫਾਈਲ ਹੈ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'ਰੰਗ ਪਛਾਣਿਆ ਨਹੀਂ',
        'cF44336': 'ਲਾਲ',
        'cE91E63': 'ਗੁਲਾਬੀ',
        'c9C27B0': 'ਬੈਂਗਣੀ',
        'c673AB7': 'ਗੂੜ੍ਹਾ ਬੈਂਗਣੀ',
        'c3F51B5': 'ਨੀਲਾ ਬੈਂਗਣੀ',
        'c2196F3': 'ਨੀਲਾ',
        'c03A9F4': 'ਹਲਕਾ ਨੀਲਾ',
        'c00BCD4': 'ਸਾਇਨ',
        'c009688': 'ਟੀਲ',
        'c4CAF50': 'ਹਰਾ',
        'c8BC34A': 'ਹਲਕਾ ਹਰਾ',
        'cCDDC39': 'ਲਾਈਮ',
        'cFFEB3B': 'ਪੀਲਾ',
        'cFFC107': 'ਅੰਬਰ',
        'cFF9800': 'ਸੰਤਰੀ',
        'cFF5722': 'ਗੂੜ੍ਹਾ ਸੰਤਰੀ',
        'c795548': 'ਭੂਰਾ',
        'c9E9E9E': 'ਸਲੇਟੀ',
        'c607D8B': 'ਨੀਲਾ ਸਲੇਟੀ',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਘਟਾਓ';

  @override
  String get decrement_letter_spacing => 'ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਘਟਾਓ';

  @override
  String get decrement_line_height => 'ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਘਟਾਓ';

  @override
  String get decrement_text_scale_factor => 'ਟੈਕਸਟ ਸਕੇਲ ਫੈਕਟਰ ਨੂੰ ਘਟਾਓ';

  @override
  String get effects => 'ਅਸਰ';

  @override
  String get expand_text => 'ਟੈਕਸਟ ਨੂੰ ਵਿਸਤਾਰ ਕਰੋ';

  @override
  String get font_size => 'ਫੌਂਟ ਆਕਾਰ';

  @override
  String get increase_or_decrease_word_spacing => 'ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get increase_or_decrease_line_height => 'ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get increase_or_decrease_text_size => 'ਟੈਕਸਟ ਆਕਾਰ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get increment_word_spacing => 'ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਵਧਾਓ';

  @override
  String get increment_letter_spacing => 'ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਵਧਾਓ';

  @override
  String get increment_line_height => 'ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਵਧਾਓ';

  @override
  String get increment_text_scale_factor => 'ਟੈਕਸਟ ਸਕੇਲ ਫੈਕਟਰ ਨੂੰ ਵਧਾਓ';

  @override
  String get less_info => 'ਜਾਣਕਾਰੀ ਲੁਕਾਓ';

  @override
  String get letter_spacing => 'ਅੱਖਰ ਦੂਰੀ';

  @override
  String get line_height => 'ਲਾਈਨ ਉਚਾਈ';

  @override
  String get more_info => 'ਜਾਣਕਾਰੀ ਦਿਖਾਓ';

  @override
  String get read_less => 'ਘੱਟ ਪੜ੍ਹੋ';

  @override
  String get read_more => 'ਵੱਧ ਪੜ੍ਹੋ';

  @override
  String get reduce_effects => 'ਅਸਰਾਂ ਨੂੰ ਘਟਾਓ';

  @override
  String get reduce_text => 'ਟੈਕਸਟ ਨੂੰ ਘਟਾਓ';

  @override
  String get restore_settings => 'ਸੈਟਿੰਗਾਂ ਨੂੰ ਮੁੜ ਸਥਾਪਤ ਕਰੋ';

  @override
  String get restore_main_color => 'ਮੁੱਖ ਰੰਗ ਨੂੰ ਮੁੜ ਸਥਾਪਤ ਕਰੋ';

  @override
  String get return_to_main_colors => 'ਮੁੱਖ ਰੰਗਾਂ ਨੂੰ ਮੁੜ ਪਰਤੋ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get size_and_text_display => 'ਆਕਾਰ ਅਤੇ ਟੈਕਸਟ ਪ੍ਰਦਰਸ਼ਨ';

  @override
  String get slider_word_spacing => 'ਸ਼ਬਦ ਦੂਰੀ ਸਲਾਈਡਰ';

  @override
  String get slider_letter_spacing => 'ਅੱਖਰ ਦੂਰੀ ਸਲਾਈਡਰ';

  @override
  String get slider_line_height => 'ਲਾਈਨ ਉਚਾਈ ਸਲਾਈਡਰ';

  @override
  String get theme_mode => 'ਥੀਮ';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'ਥੀਮ ਪ੍ਰੋਫਾਈਲ ਨਹੀਂ ਪਛਾਣਿਆ ਗਿਆ',
        'seizureSafe': 'ਦੌਰਾ ਸੁਰੱਖਿਅਤ',
        'visionImpaired': 'ਦ੍ਰਿਸ਼ਟੀ ਪ੍ਰਭਾਵਿਤ',
        'adhdFriendly': 'ਏਡੀਏਚਡੀ ਦੋਸਤਾਨਾ',
        'none': 'ਡਿਫਾਲਟ',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'ਦੌਰਾ ਸੁਰੱਖਿਅਤ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'ਪ੍ਰਤਿਬਿੰਬ ਹਟਾਓ ਅਤੇ ਰੰਗ ਘਟਾਓ';

  @override
  String get theme_profile_seizure_safe_description =>
      'ਇਹ ਪ੍ਰੋਫਾਈਲ ਉਹਨਾਂ ਵਰਤੋਂਕਾਰਾਂ ਨੂੰ ਜਿਨ੍ਹਾਂ ਨੂੰ ਮਿਰਗੀ ਹੈ ਅਤੇ ਦੌਰੇ ਪੈਣ ਦਾ ਖਤਰਾ ਹੈ, ਸੁਰੱਖਿਅਤ ਢੰਗ ਨਾਲ ਬ੍ਰਾਉਜ਼ ਕਰਨ ਦੀ ਸਹੂਲਤ ਦਿੰਦੀ ਹੈ, ਚਮਕਦਾਰ ਐਨੀਮੇਸ਼ਨਾਂ ਅਤੇ ਜੋਖਮ ਭਰੇ ਰੰਗ ਸੰਯੋਜਨਾਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਦੌਰਿਆਂ ਦੇ ਜੋਖਮ ਨੂੰ ਖਤਮ ਕਰਕੇ.';

  @override
  String get theme_profile_vision_impaired_title => 'ਦ੍ਰਿਸ਼ਟੀ ਪ੍ਰਭਾਵਿਤ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਦਿਖਾਈ ਵਿੱਚ ਸੁਧਾਰ ਕਰੋ';

  @override
  String get theme_profile_vision_impaired_description =>
      'ਇਹ ਪ੍ਰੋਫਾਈਲ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਜ਼ਿਆਦਾਤਰ ਦ੍ਰਿਸ਼ਟੀ ਵਿਕਾਰਾਂ ਲਈ ਪਹੁੰਚਯੋਗ ਬਣਾਉਂਦੀ ਹੈ, ਜਿਵੇਂ ਕਿ ਦ੍ਰਿਸ਼ਟੀ ਵਿਕਾਰ, ਟਨਲ ਦ੍ਰਿਸ਼ਟੀ, ਮੋਤੀਆਬਿੰਦ, ਗਲੂਕੋਮਾ ਅਤੇ ਹੋਰ.';

  @override
  String get theme_profile_adhd_friendly_title => 'ਏਡੀਏਚਡੀ ਦੋਸਤਾਨਾ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'ਵਧੇਰੇ ਇਕਾਗਰਤਾ ਅਤੇ ਘੱਟ ਵਿਘਨ';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ਇਹ ਪ੍ਰੋਫਾਈਲ ਵਿਘਨਾਂ ਨੂੰ ਮਹੱਤਵਪੂਰਨ ਰੂਪ ਵਿੱਚ ਘਟਾਉਂਦੀ ਹੈ, ਏਡੀਏਚਡੀ ਅਤੇ ਨਿਉਰੋਡਿਵੈਲਪਮੈਂਟਲ ਵਿਕਾਰਾਂ ਵਾਲੇ ਲੋਕਾਂ ਦੀ ਨੈਵੀਗੇਟ, ਪੜ੍ਹਨ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਜ਼ਰੂਰੀ ਤੱਤਾਂ ਤੇ ਧਿਆਨ ਕੇਂਦਰਿਤ ਕਰਨ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰਦੀ ਹੈ.';

  @override
  String get the_settings_have_been_reset =>
      'ਸੈਟਿੰਗਾਂ ਨੂੰ ਰੀਸੈੱਟ ਕਰ ਦਿੱਤਾ ਗਿਆ ਹੈ.';

  @override
  String get toggle_dark_mode => 'ਡਾਰਕ ਮੋਡ ਟੌਗਲ ਕਰੋ';

  @override
  String get toggle_effects_mode => 'ਪ੍ਰਭਾਵ ਮੋਡ ਟੌਗਲ ਕਰੋ';

  @override
  String get toggle_font_weight => 'ਫੌਂਟ ਭਾਰ ਟੌਗਲ ਕਰੋ';

  @override
  String get toggle_theme_profile => 'ਥੀਮ ਪ੍ਰੋਫਾਈਲ ਟੌਗਲ ਕਰੋ';

  @override
  String get word_spacing => 'ਸ਼ਬਦ ਦੂਰੀ';
}
