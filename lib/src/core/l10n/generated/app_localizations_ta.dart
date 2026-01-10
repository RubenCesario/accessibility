// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AccessibilityLocalizationsTa extends AccessibilityLocalizations {
  AccessibilityLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get accessibility => 'அணுகல்தன்மை';

  @override
  String get accessibility_settings => 'அணுகல்தன்மை அமைப்புகள்';

  @override
  String get adjust_background_colors => 'பின்னணி வண்ணங்களை சரிசெய்க';

  @override
  String get adjust_text_colors => 'உரை வண்ணங்களை சரிசெய்க';

  @override
  String get align_center => 'மையத்தில் சீரமைக்க';

  @override
  String get align_left => 'இடதுபுறம் சீரமைக்க';

  @override
  String get align_right => 'வலதுபுறம் சீரமைக்க';

  @override
  String get bold_text => 'தடிமனான உரை';

  @override
  String get change_bold_text => 'தடிமனான உரையை மாற்று';

  @override
  String get change_pages_background_color =>
      'பக்கங்களின் பின்னணி வண்ணத்தை இதற்கு மாற்று: ';

  @override
  String get change_text_color => 'உரையின் வண்ணத்தை இதற்கு மாற்று: ';

  @override
  String get change_text_color_shade => 'வண்ணத்தின் நிழலை இதற்கு மாற்று: ';

  @override
  String get color_adjustment => 'வண்ண சரிசெய்தல்';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'சாதாரணம்',
        'lowSaturation': 'குறைந்த தெவிட்டு',
        'normal': 'சாதாரணம்',
        'highSaturation': 'அதிக தெவிட்டு',
        'monochrome': 'ஒரு வண்ணம்',
        'highContrast': 'அதிக மாறுபாடு',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'தற்போதைய வண்ண விவரக்குறிப்பு: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'வண்ணம் அங்கீகரிக்கப்படவில்லை',
        'cF44336': 'சிவப்பு',
        'cE91E63': 'இளஞ்சிவப்பு',
        'c9C27B0': 'ஊதா',
        'c673AB7': 'அடர் ஊதா',
        'c3F51B5': 'கருநீலம்',
        'c2196F3': 'நீலம்',
        'c03A9F4': 'இளநீலம்',
        'c00BCD4': 'சயன்',
        'c009688': 'நீலப்பச்சை',
        'c4CAF50': 'பச்சை',
        'c8BC34A': 'இளம் பச்சை',
        'cCDDC39': 'எலுமிச்சை',
        'cFFEB3B': 'மஞ்சள்',
        'cFFC107': 'ஆம்பர்',
        'cFF9800': 'ஆரஞ்சு',
        'cFF5722': 'அடர் ஆரஞ்சு',
        'c795548': 'பழுப்பு',
        'c9E9E9E': 'சாம்பல்',
        'c607D8B': 'நீல சாம்பல்',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'சொல் இடைவெளியை குறைக்க';

  @override
  String get decrement_letter_spacing => 'எழுத்து இடைவெளியை குறைக்க';

  @override
  String get decrement_line_height => 'வரி உயரத்தை குறைக்க';

  @override
  String get decrement_text_scale_factor => 'உரை அளவு காரணியை குறைக்க';

  @override
  String get effects => 'விளைவுகள்';

  @override
  String get expand_text => 'உரையை விரிவுபடுத்து';

  @override
  String get font_size => 'எழுத்துரு அளவு';

  @override
  String get increase_or_decrease_word_spacing =>
      'சொல் இடைவெளியை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get increase_or_decrease_letter_spacing =>
      'எழுத்து இடைவெளியை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get increase_or_decrease_line_height =>
      'வரி உயரத்தை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get increase_or_decrease_text_size =>
      'உரை அளவை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get increment_word_spacing => 'சொல் இடைவெளியை அதிகரிக்க';

  @override
  String get increment_letter_spacing => 'எழுத்து இடைவெளியை அதிகரிக்க';

  @override
  String get increment_line_height => 'வரி உயரத்தை அதிகரிக்க';

  @override
  String get increment_text_scale_factor => 'உரை அளவு காரணியை அதிகரிக்க';

  @override
  String get less_info => 'தகவலை மறைக்க';

  @override
  String get letter_spacing => 'எழுத்து இடைவெளி';

  @override
  String get line_height => 'வரி உயரம்';

  @override
  String get more_info => 'தகவலை காட்ட';

  @override
  String get read_less => 'குறைவாக படிக்க';

  @override
  String get read_more => 'மேலும் படிக்க';

  @override
  String get reduce_effects => 'திரைக்கான விளைவுகளை குறைக்க';

  @override
  String get reduce_text => 'உரையை குறைக்க';

  @override
  String get restore_settings => 'அமைப்புகளை மீட்டமைக்க';

  @override
  String get restore_main_color => 'முதன்மை வண்ணத்தை மீட்டமைக்க';

  @override
  String get return_to_main_colors => 'முதன்மை வண்ணங்களுக்கு திரும்ப';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get size_and_text_display => 'அளவு மற்றும் உரை காட்சி';

  @override
  String get slider_word_spacing => 'சொல் இடைவெளி சருக்கி';

  @override
  String get slider_letter_spacing => 'எழுத்து இடைவெளி சருக்கி';

  @override
  String get slider_line_height => 'வரி உயரம் சருக்கி';

  @override
  String get theme_mode => 'தீம்';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'தீம் விவரக்குறிப்பு அங்கீகரிக்கப்படவில்லை',
        'seizureSafe': 'வலிப்பு பாதுகாப்பு',
        'visionImpaired': 'பார்வை குறைபாடு',
        'adhdFriendly': 'ADHD நட்பு',
        'none': 'இயல்பு',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'வலிப்பு பாதுகாப்பு விவரக்குறிப்பு';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'பிரதிபலிப்புகளை நீக்கி வண்ணத்தை குறைக்க';

  @override
  String get theme_profile_seizure_safe_description =>
      'இந்த விவரக்குறிப்பு காக்கைவலிப்பு உள்ள மற்றும் வலிப்பு அபாயத்தில் உள்ள பயனர்கள் மின்னும் அனிமேஷன்கள் மற்றும் ஆபத்தான வண்ண கலவைகளால் ஏற்படும் வலிப்பு அபாயத்தை நீக்குவதன் மூலம் பாதுகாப்பாக உலாவ அனுமதிக்கிறது.';

  @override
  String get theme_profile_vision_impaired_title =>
      'பார்வை குறைபாடு விவரக்குறிப்பு';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'பயன்பாட்டின் தெரிவுத்தன்மையை மேம்படுத்துக';

  @override
  String get theme_profile_vision_impaired_description =>
      'இந்த விவரக்குறிப்பு பார்வைக் குறைபாடு, டனல் பார்வை, கண்புரை, களாகோமா மற்றும் பல போன்ற பெரும்பாலான பார்வைக் குறைபாடுகளுக்கு அணுகக்கூடியதாக பயன்பாட்டை தகவமைக்கிறது.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD நட்பு விவரக்குறிப்பு';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'அதிக கவனம் மற்றும் குறைவான கவனச்சிதறல்கள்';

  @override
  String get theme_profile_adhd_friendly_description =>
      'இந்த விவரக்குறிப்பு கவனச்சிதறல்களை கணிசமாக குறைக்கிறது, ADHD மற்றும் நரம்பியல் வளர்ச்சி குறைபாடுகள் உள்ள மக்களுக்கு வழிநடத்த, படிக்க மற்றும் பயன்பாட்டின் அத்தியாவசிய கூறுகளில் கவனம் செலுத்த உதவுகிறது.';

  @override
  String get the_settings_have_been_reset =>
      'அமைப்புகள் மீட்டமைக்கப்பட்டுள்ளன.';

  @override
  String get toggle_dark_mode => 'இருண்ட பயன்முறையை மாற்று';

  @override
  String get toggle_effects_mode => 'விளைவுகள் பயன்முறையை மாற்று';

  @override
  String get toggle_font_weight => 'எழுத்துரு எடையை மாற்று';

  @override
  String get toggle_theme_profile => 'தீம் விவரக்குறிப்பை மாற்று';

  @override
  String get word_spacing => 'சொல் இடைவெளி';

  @override
  String get accessible_font => 'அணுகக்கூடிய எழுத்துரு';

  @override
  String get accessible_font_subtitle =>
      'சிறந்த வாசிப்புத்திறனுக்கு Verdana எழுத்துருவைப் பயன்படுத்துங்கள்';

  @override
  String get accessible_font_enabled => 'அணுகக்கூடிய எழுத்துரு இயக்கப்பட்டது';

  @override
  String get accessible_font_disabled => 'அணுகக்கூடிய எழுத்துரு முடக்கப்பட்டது';

  @override
  String get toggle_accessible_font => 'அணுகக்கூடிய எழுத்துருவை மாற்று';
}
