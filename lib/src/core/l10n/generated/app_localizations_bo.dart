// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tibetan (`bo`).
class AccessibilityLocalizationsBo extends AccessibilityLocalizations {
  AccessibilityLocalizationsBo([String locale = 'bo']) : super(locale);

  @override
  String get accessibility => 'འཇུག་སྤྱོད་ཚད་ལྡན་';

  @override
  String get accessibility_settings => 'འཇུག་སྤྱོད་ཚད་ལྡན་སྒྲིག་སྟངས་';

  @override
  String get adjust_background_colors =>
      'རྒྱབ་སྤྱོད་ཀྱི་ཚོན་མདོག་སྒྲིག་འགོད་བྱོས་';

  @override
  String get adjust_text_colors => 'ཡིག་དོན་ཀྱི་ཚོན་མདོག་སྒྲིག་འགོད་བྱོས་';

  @override
  String get align_center => 'དབུས་སུ་བཀོལ་སྒྲིག་བྱོས་';

  @override
  String get align_left => 'གཡས་སུ་བཀོལ་སྒྲིག་བྱོས་';

  @override
  String get align_right => 'གཡོན་སུ་བཀོལ་སྒྲིག་བྱོས་';

  @override
  String get bold_text => 'རྒྱས་པའི་ཡིག་དོན་';

  @override
  String get change_bold_text => 'རྒྱས་པའི་ཡིག་དོན་སྒྲིག་སྟངས་བརྗེ་བ་';

  @override
  String get change_pages_background_color =>
      'ཤོག་ངོས་ཀྱི་རྒྱབ་སྤྱོད་ཚོན་མདོག་སོར་བཅོས་:';

  @override
  String get change_text_color => 'ཡིག་དོན་ཀྱི་ཚོན་མདོག་སོར་བཅོས་:';

  @override
  String get change_text_color_shade => 'ཚོན་མདོག་གི་གདན་སྒྲིག་སོར་བཅོས་:';

  @override
  String get color_adjustment => 'ཚོན་མདོག་སྒྲིག་འགོད་';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'སྤྱི་ཚད',
        'lowSaturation': 'ཆུ་ཚད་ཉུང་བ',
        'normal': 'སྤྱི་ཚད',
        'highSaturation': 'ཆུ་ཚད་མང་བ',
        'monochrome': 'ཚོན་མདོག་གཅིག་པ',
        'highContrast': 'ཀོན་ཐྲ་ཆེ་བ',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'ད་ལྟའི་ཚོན་མདོག་གི་སྤྱི་རྣམ་ནི: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'ཚོན་མདོག་ངོས་འཛིན་མ་བྱུང་',
        'cF44336': 'དམར་པོ',
        'cE91E63': 'སྤྲེར་སྔོན་པོ',
        'c9C27B0': 'སྨུག་པོ',
        'c673AB7': 'སྨུག་པོ་མདོག་ཆེན་པོ',
        'c3F51B5': 'མཐིང་ནག',
        'c2196F3': 'སྔོན་པོ',
        'c03A9F4': 'སྔོན་པོ་ཡལ་བ',
        'c00BCD4': 'མཐིང་སྔོན་པ',
        'c009688': 'ནུབ་ཆུ',
        'c4CAF50': 'ལྗང་ཁུ',
        'c8BC34A': 'ལྗང་ཁུ་ཡལ་བ',
        'cCDDC39': 'ཚོས་གཞོང་',
        'cFFEB3B': 'སེར་པོ',
        'cFFC107': 'གསེར་སེར',
        'cFF9800': 'ལི་ཅི',
        'cFF5722': 'ལི་ཅི་དམར་པོ',
        'c795548': 'སྨུག་པོ',
        'c9E9E9E': 'དཀར་པོ',
        'c607D8B': 'སྔོན་པོ་སྨུག་པ',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'ཚིག་གི་བར་ཐག་ཉུང་བཏང་བ';

  @override
  String get decrement_letter_spacing => 'ཡིག་འབྲུའི་བར་ཐག་ཉུང་བཏང་བ';

  @override
  String get decrement_line_height => 'ཐིག་ཚད་ཉུང་བཏང་བ';

  @override
  String get decrement_text_scale_factor => 'ཡིག་ཆའི་ཚད་ཀྱི་ཆ་ཕྲ་ཉུང་བཏང་བ';

  @override
  String get effects => 'འབྲེལ་ཤུགས';

  @override
  String get expand_text => 'ཡིག་ཆ་རྒྱ་བསྐྱེད་བྱོས';

  @override
  String get font_size => 'ཡིག་གཟུགས་ཀྱི་ཆེ་ཆུང་';

  @override
  String get increase_or_decrease_word_spacing =>
      'ཚིག་གི་བར་ཐག་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'ཡིག་འབྲུའི་བར་ཐག་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ';

  @override
  String get increase_or_decrease_line_height =>
      'ཐིག་ཚད་ཇེ་མཐོར་ཡང་ན་ཇེ་དམན་དུ་གཏོང་བ';

  @override
  String get increase_or_decrease_text_size =>
      'ཡིག་ཆའི་ཆེ་ཆུང་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ';

  @override
  String get increment_word_spacing => 'ཚིག་གི་བར་ཐག་ཇེ་ཆེར་གཏོང་བ';

  @override
  String get increment_letter_spacing => 'ཡིག་འབྲུའི་བར་ཐག་ཇེ་ཆེར་གཏོང་བ';

  @override
  String get increment_line_height => 'ཐིག་ཚད་ཇེ་མཐོར་གཏོང་བ';

  @override
  String get increment_text_scale_factor => 'ཡིག་ཆའི་ཚད་ཀྱི་ཆ་ཕྲ་ཇེ་ཆེར་གཏོང་བ';

  @override
  String get less_info => 'ཆ་འཕྲིན་སྦ་བ';

  @override
  String get letter_spacing => 'ཡིག་འབྲུའི་བར་ཐག';

  @override
  String get line_height => 'ཐིག་ཚད';

  @override
  String get more_info => 'ཆ་འཕྲིན་སྟོན་པ';

  @override
  String get read_less => 'ཉུང་ཙམ་ཀློག';

  @override
  String get read_more => 'མང་པོ་ཀློག';

  @override
  String get reduce_effects => 'འཆར་ངོས་སུ་འབྲེལ་ཤུགས་ཉུང་དུ་གཏོང་བ';

  @override
  String get reduce_text => 'ཡིག་ཆ་ཉུང་དུ་གཏོང་བ';

  @override
  String get restore_settings => 'སྔོན་གྱི་སྒྲིག་སྟངས་སུ་སླར་གསོ';

  @override
  String get restore_main_color => 'གཙོ་བོའི་ཚོན་མདོག་སླར་གསོ';

  @override
  String get return_to_main_colors => 'གཙོ་བོའི་ཚོན་མདོག་ཏུ་ལོག';

  @override
  String get settings => 'སྒྲིག་སྟངས';

  @override
  String get size_and_text_display => 'ཚད་དང་ཡིག་ཆའི་འཆར་སྟངས';

  @override
  String get slider_word_spacing => 'ཚིག་གི་བར་ཐག་སྒྲུང་འགྲིལ';

  @override
  String get slider_letter_spacing => 'ཡིག་འབྲུའི་བར་ཐག་སྒྲུང་འགྲིལ';

  @override
  String get slider_line_height => 'ཐིག་ཚད་སྒྲུང་འགྲིལ';

  @override
  String get theme_mode => 'དཔེ་སྒྲོམ';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'དཔེ་སྒྲོམ་ངོས་འཛིན་མ་བྱུང་',
        'seizureSafe': 'ཉེན་མེད',
        'visionImpaired': 'མིག་གི་ནུས་པ་ཉམས་པ',
        'adhdFriendly': 'ADHD ལ་མཛའ་བ',
        'none': 'སྔོན་སྒྲིག',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'ཉེན་མེད་ཀྱི་དཔེ་སྒྲོམ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'འོད་འཕྲོ་སྤངས་ཏེ་ཚོན་མདོག་ཉུང་དུ་གཏོང་བ';

  @override
  String get theme_profile_seizure_safe_description =>
      'འདི་ནི་ཉེན་མེད་ཀྱི་དཔེ་སྒྲོམ་ཡིན་པས་ཚོར་ཤུགས་ཀྱི་ནད་ཅན་དང་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་བདེ་འཇགས་སུ་བལྟ་ཐུབ་པ་དང་། འོད་འཕྲོ་དང་ཚོན་མདོག་གི་སྦྱོར་ཚུལ་སོགས་ཀྱིས་བྱུང་བའི་ཉེན་ཁ་སྤོང་བར་བྱེད་པ་ཡིན';

  @override
  String get theme_profile_vision_impaired_title =>
      'མིག་གི་ནུས་པ་ཉམས་པའི་དཔེ་སྒྲོམ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ཆ་འཕྲིན་གྱི་མཐོང་རུང་ཡོད་པར་བྱེད་པ';

  @override
  String get theme_profile_vision_impaired_description =>
      'འདི་ནི་མིག་གི་ནུས་པ་ཉམས་པ་དང་། མིག་ཤུལ་ཆུང་བ། མིག་སྨུག་རིམས་དང་མིག་ཁྲག་ཁྲ་བ་སོགས་ཀྱི་ནད་ཀྱིས་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་བདེ་བླག་ཏུ་བེད་སྤྱོད་བྱེད་ཐུབ་པའི་དཔེ་སྒྲོམ་ཞིག་ཡིན';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD ལ་མཛའ་བའི་དཔེ་སྒྲོམ';

  @override
  String get theme_profile_adhd_friendly_subtitle => 'ཇེ་ཙོ་དང་ཡིད་འཕྲོག་ཉུང་བ';

  @override
  String get theme_profile_adhd_friendly_description =>
      'འདི་ནི་ADHD དང་ཀླད་ཀྱི་འཕེལ་རིམ་ནད་ཀྱིས་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་ཆ་འཕྲིན་གྱི་གལ་ཆེའི་ཆ་ཤས་ལ་གཟིགས་ཐུབ་པ་དང་། ཀློག་པ་དང་ལག་ལེན་བྱེད་པར་བདེ་བླག་ཏུ་བྱེད་པའི་ཆེད་དུ་ཡིད་འཕྲོག་པ་ཉུང་དུ་གཏོང་བའི་དཔེ་སྒྲོམ་ཞིག་ཡིན';

  @override
  String get the_settings_have_been_reset =>
      'སྒྲིག་སྟངས་ཚང་མ་སྔོན་གྱི་གནས་སུ་ཕྱིར་བསྒྱུར་བྱུང་སོང་';

  @override
  String get toggle_dark_mode => 'མུན་ནག་གི་དཔེ་སྒྲོམ་བརྗེ་བ';

  @override
  String get toggle_effects_mode => 'འབྲེལ་ཤུགས་ཀྱི་དཔེ་སྒྲོམ་བརྗེ་བ';

  @override
  String get toggle_font_weight => 'ཡིག་གཟུགས་ཀྱི་ལྗིད་ཚད་བརྗེ་བ';

  @override
  String get toggle_theme_profile => 'དཔེ་སྒྲོམ་གྱི་སྤྱི་རྣམ་བརྗེ་བ';

  @override
  String get word_spacing => 'ཚིག་གི་བར་ཐག';

  @override
  String get accessible_font => 'སྤྱོད་བདེའི་ཡིག་གཟུགས';

  @override
  String get accessible_font_subtitle =>
      'ཀློག་བདེའི་ཆེད་དུ Verdana ཡིག་གཟུགས་བེད་སྤྱོད་བྱེད';

  @override
  String get accessible_font_enabled => 'སྤྱོད་བདེའི་ཡིག་གཟུགས་སྤྱོད་བཞིན་ཡོད';

  @override
  String get accessible_font_disabled => 'སྤྱོད་བདེའི་ཡིག་གཟུགས་བཀག་ཡོད';

  @override
  String get toggle_accessible_font => 'སྤྱོད་བདེའི་ཡིག་གཟུགས་བརྗེ་བ';
}
