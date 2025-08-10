// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AccessibilityLocalizationsSw extends AccessibilityLocalizations {
  AccessibilityLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get accessibility => 'Ufikiaji';

  @override
  String get accessibility_settings => 'Mipangilio ya ufikiaji';

  @override
  String get adjust_background_colors => 'Rekebisha rangi za mandharinyuma';

  @override
  String get adjust_text_colors => 'Rekebisha rangi za maandishi';

  @override
  String get align_center => 'Panga katikati';

  @override
  String get align_left => 'Panga kushoto';

  @override
  String get align_right => 'Panga kulia';

  @override
  String get bold_text => 'Maandishi ya kooze';

  @override
  String get change_bold_text => 'Badilisha maandishi ya kooze';

  @override
  String get change_pages_background_color =>
      'Badilisha rangi ya mandharinyuma ya kurasa kuwa: ';

  @override
  String get change_text_color => 'Badilisha rangi ya maandishi kuwa: ';

  @override
  String get change_text_color_shade => 'Badilisha kivuli cha rangi kuwa: ';

  @override
  String get color_adjustment => 'Marekebisho ya rangi';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Kawaida',
        'lowSaturation': 'Usafi wa chini',
        'normal': 'Kawaida',
        'highSaturation': 'Usafi wa juu',
        'monochrome': 'Rangi moja',
        'highContrast': 'Tofauti kubwa',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Wasifu wa rangi wa sasa ni: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Rangi haijatambuliwa',
        'cF44336': 'Nyekundu',
        'cE91E63': 'Waridi',
        'c9C27B0': 'Zambarau',
        'c673AB7': 'Zambarau nzito',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Bluu',
        'c03A9F4': 'Bluu hafifu',
        'c00BCD4': 'Samawati',
        'c009688': 'Kijani-samawati',
        'c4CAF50': 'Kijani',
        'c8BC34A': 'Kijani hafifu',
        'cCDDC39': 'Ndimu',
        'cFFEB3B': 'Njano',
        'cFFC107': 'Jivujivu',
        'cFF9800': 'Machungwa',
        'cFF5722': 'Machungwa nzito',
        'c795548': 'Hudhurungi',
        'c9E9E9E': 'Kijivu',
        'c607D8B': 'Bluu-kijivu',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Punguza nafasi ya maneno';

  @override
  String get decrement_letter_spacing => 'Punguza nafasi ya herufi';

  @override
  String get decrement_line_height => 'Punguza urefu wa mstari';

  @override
  String get decrement_text_scale_factor =>
      'Punguza kipimo cha ukubwa wa maandishi';

  @override
  String get effects => 'Athari';

  @override
  String get expand_text => 'Panua maandishi';

  @override
  String get font_size => 'Ukubwa wa fonti';

  @override
  String get increase_or_decrease_word_spacing =>
      'Ongeza au punguza nafasi ya maneno';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Ongeza au punguza nafasi ya herufi';

  @override
  String get increase_or_decrease_line_height =>
      'Ongeza au punguza urefu wa mstari';

  @override
  String get increase_or_decrease_text_size =>
      'Ongeza au punguza ukubwa wa maandishi';

  @override
  String get increment_word_spacing => 'Ongeza nafasi ya maneno';

  @override
  String get increment_letter_spacing => 'Ongeza nafasi ya herufi';

  @override
  String get increment_line_height => 'Ongeza urefu wa mstari';

  @override
  String get increment_text_scale_factor =>
      'Ongeza kipimo cha ukubwa wa maandishi';

  @override
  String get less_info => 'Ficha maelezo';

  @override
  String get letter_spacing => 'Nafasi ya herufi';

  @override
  String get line_height => 'Urefu wa mstari';

  @override
  String get more_info => 'Onyesha maelezo';

  @override
  String get read_less => 'Soma kidogo';

  @override
  String get read_more => 'Soma zaidi';

  @override
  String get reduce_effects => 'Punguza athari kwenye skrini';

  @override
  String get reduce_text => 'Punguza maandishi';

  @override
  String get restore_settings => 'Rejesha mipangilio';

  @override
  String get restore_main_color => 'Rejesha rangi kuu';

  @override
  String get return_to_main_colors => 'Rudi kwenye rangi kuu';

  @override
  String get settings => 'Mipangilio';

  @override
  String get size_and_text_display => 'Ukubwa na onyesho la maandishi';

  @override
  String get slider_word_spacing => 'Kitelezi cha nafasi ya maneno';

  @override
  String get slider_letter_spacing => 'Kitelezi cha nafasi ya herufi';

  @override
  String get slider_line_height => 'Kitelezi cha urefu wa mstari';

  @override
  String get theme_mode => 'Mandhari';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Wasifu wa mandhari haujatambuliwa',
        'seizureSafe': 'Salama kwa kifafa',
        'visionImpaired': 'Uoni hafifu',
        'adhdFriendly': 'Rafiki wa ADHD',
        'none': 'Chaguo-msingi',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Wasifu salama kwa kifafa';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Ondoa mionekano na punguza rangi';

  @override
  String get theme_profile_seizure_safe_description =>
      'Wasifu huu huwezesha watumiaji wenye kifafa na walio katika hatari ya kupata kifafa kuvinjari kwa usalama kwa kuondoa hatari ya kifafa inayotokana na animesheni zinazometameta na mchanganyiko wa rangi hatari.';

  @override
  String get theme_profile_vision_impaired_title => 'Wasifu wa uoni hafifu';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Boresha mwonekano wa programu';

  @override
  String get theme_profile_vision_impaired_description =>
      'Wasifu huu hurekebisha programu ili iweze kufikiwa na watu wenye ulemavu wa kuona, kama vile uoni hafifu, uoni wa tundu, mtoto wa jicho, glaukoma na zaidi.';

  @override
  String get theme_profile_adhd_friendly_title => 'Wasifu rafiki wa ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Umakinifu zaidi na usumbufu kidogo';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Wasifu huu hupunguza usumbufu kwa kiasi kikubwa, kusaidia watu wenye ADHD na matatizo ya ukuaji wa neva kuvinjari, kusoma, na kuzingatia vipengele muhimu vya programu kwa urahisi zaidi.';

  @override
  String get the_settings_have_been_reset => 'Mipangilio imerejeshwa.';

  @override
  String get toggle_dark_mode => 'Badilisha hali ya giza';

  @override
  String get toggle_effects_mode => 'Badilisha hali ya athari';

  @override
  String get toggle_font_weight => 'Badilisha unene wa fonti';

  @override
  String get toggle_theme_profile => 'Badilisha wasifu wa mandhari';

  @override
  String get word_spacing => 'Nafasi ya maneno';
}
