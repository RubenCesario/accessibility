// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tagalog (`tl`).
class AccessibilityLocalizationsTl extends AccessibilityLocalizations {
  AccessibilityLocalizationsTl([String locale = 'tl']) : super(locale);

  @override
  String get accessibility => 'Kakayahang Ma-access';

  @override
  String get accessibility_settings => 'Mga setting ng accessibility';

  @override
  String get adjust_background_colors => 'I-adjust ang mga kulay ng background';

  @override
  String get adjust_text_colors => 'I-adjust ang mga kulay ng teksto';

  @override
  String get align_center => 'I-align sa gitna';

  @override
  String get align_left => 'I-align sa kaliwa';

  @override
  String get align_right => 'I-align sa kanan';

  @override
  String get bold_text => 'Makapal na teksto';

  @override
  String get change_bold_text => 'Baguhin ang makapal na teksto';

  @override
  String get change_pages_background_color =>
      'Baguhin ang kulay ng background ng mga pahina sa: ';

  @override
  String get change_text_color => 'Baguhin ang kulay ng teksto sa: ';

  @override
  String get change_text_color_shade => 'Baguhin ang shade ng kulay sa: ';

  @override
  String get color_adjustment => 'Pag-adjust ng kulay';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Mababang saturation',
        'normal': 'Normal',
        'highSaturation': 'Mataas na saturation',
        'monochrome': 'Monochrome',
        'highContrast': 'Mataas na contrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to =>
      'Ang kasalukuyang profile ng kulay ay: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Hindi nakilala ang kulay',
        'cF44336': 'Pula',
        'cE91E63': 'Kulay-rosas',
        'c9C27B0': 'Lila',
        'c673AB7': 'Malalim na lila',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Asul',
        'c03A9F4': 'Maliwanag na asul',
        'c00BCD4': 'Cyan',
        'c009688': 'Teal',
        'c4CAF50': 'Berde',
        'c8BC34A': 'Maliwanag na berde',
        'cCDDC39': 'Lime',
        'cFFEB3B': 'Dilaw',
        'cFFC107': 'Amber',
        'cFF9800': 'Kahel',
        'cFF5722': 'Malalim na kahel',
        'c795548': 'Kayumanggi',
        'c9E9E9E': 'Kulay-abo',
        'c607D8B': 'Asul na kulay-abo',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Bawasan ang espasyo ng mga salita';

  @override
  String get decrement_letter_spacing => 'Bawasan ang espasyo ng mga letra';

  @override
  String get decrement_line_height => 'Bawasan ang taas ng linya';

  @override
  String get decrement_text_scale_factor =>
      'Bawasan ang scale factor ng teksto';

  @override
  String get effects => 'Mga epekto';

  @override
  String get expand_text => 'Palawakin ang teksto';

  @override
  String get font_size => 'Laki ng font';

  @override
  String get increase_or_decrease_word_spacing =>
      'Dagdagan o bawasan ang espasyo ng mga salita';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Dagdagan o bawasan ang espasyo ng mga letra';

  @override
  String get increase_or_decrease_line_height =>
      'Dagdagan o bawasan ang taas ng linya';

  @override
  String get increase_or_decrease_text_size =>
      'Dagdagan o bawasan ang laki ng teksto';

  @override
  String get increment_word_spacing => 'Dagdagan ang espasyo ng mga salita';

  @override
  String get increment_letter_spacing => 'Dagdagan ang espasyo ng mga letra';

  @override
  String get increment_line_height => 'Dagdagan ang taas ng linya';

  @override
  String get increment_text_scale_factor =>
      'Dagdagan ang scale factor ng teksto';

  @override
  String get less_info => 'Itago ang impormasyon';

  @override
  String get letter_spacing => 'Espasyo ng mga letra';

  @override
  String get line_height => 'Taas ng linya';

  @override
  String get more_info => 'Ipakita ang impormasyon';

  @override
  String get read_less => 'Magbasa ng mas kaunti';

  @override
  String get read_more => 'Magbasa pa';

  @override
  String get reduce_effects => 'Bawasan ang mga epekto sa screen';

  @override
  String get reduce_text => 'Bawasan ang teksto';

  @override
  String get restore_settings => 'Ibalik ang mga setting';

  @override
  String get restore_main_color => 'Ibalik ang pangunahing kulay';

  @override
  String get return_to_main_colors => 'Bumalik sa mga pangunahing kulay';

  @override
  String get settings => 'Mga Setting';

  @override
  String get size_and_text_display => 'Laki at display ng teksto';

  @override
  String get slider_word_spacing => 'Slider ng espasyo ng mga salita';

  @override
  String get slider_letter_spacing => 'Slider ng espasyo ng mga letra';

  @override
  String get slider_line_height => 'Slider ng taas ng linya';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Hindi nakilala ang profile ng tema',
        'seizureSafe': 'Ligtas sa seizure',
        'visionImpaired': 'May kapansanan sa paningin',
        'adhdFriendly': 'Angkop sa ADHD',
        'none': 'Default',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Profile na ligtas sa seizure';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Alisin ang mga reflection at bawasan ang kulay';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ang profile na ito ay nagbibigay-daan sa mga gumagamit na may epilepsy at nasa panganib ng seizure na mag-browse nang ligtas sa pamamagitan ng pag-alis ng panganib ng seizure na dulot ng mga kumikislap na animation at mapanganib na kombinasyon ng kulay.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profile para sa may kapansanan sa paningin';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Pagbutihin ang visibility ng application';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ang profile na ito ay nag-aangkop sa application upang maging accessible sa karamihan ng mga kapansanan sa paningin, tulad ng vision impairment, tunnel vision, katarata, glaucoma at iba pa.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profile na angkop sa ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mas maraming konsentrasyon at mas kaunting distraction';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ang profile na ito ay makabuluhang nagbabawas ng mga distraction, upang tulungan ang mga taong may ADHD at neurodevelopmental disorders na mag-navigate, magbasa, at mag-focus sa mahahalagang elemento ng application nang mas madali.';

  @override
  String get the_settings_have_been_reset => 'Ang mga setting ay na-reset na.';

  @override
  String get toggle_dark_mode => 'I-toggle ang dark mode';

  @override
  String get toggle_effects_mode => 'I-toggle ang effects mode';

  @override
  String get toggle_font_weight => 'I-toggle ang kapal ng font';

  @override
  String get toggle_theme_profile => 'I-toggle ang profile ng tema';

  @override
  String get word_spacing => 'Espasyo ng mga salita';
}
