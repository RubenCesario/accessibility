// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AccessibilityLocalizationsIs extends AccessibilityLocalizations {
  AccessibilityLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get accessibility => 'Aðgengi';

  @override
  String get accessibility_settings => 'Aðgengistillingar';

  @override
  String get adjust_background_colors => 'Stilltu bakgrunnslit';

  @override
  String get adjust_text_colors => 'Stilltu textafeitt';

  @override
  String get align_center => 'Jafna miðju';

  @override
  String get align_left => 'Vinstri jöfnun';

  @override
  String get align_right => 'Hægri jöfnun';

  @override
  String get bold_text => 'Feitt letur';

  @override
  String get change_bold_text => 'Breyta feitri stafa';

  @override
  String get change_pages_background_color =>
      'Breyta bakgrunnslit síðunnar í: ';

  @override
  String get change_text_color => 'Breyta lit textans í: ';

  @override
  String get change_text_color_shade => 'Breyta litbrigðum í: ';

  @override
  String get color_adjustment => 'Litastilling';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Venjulegt',
        'lowSaturation': 'Lág mettun',
        'normal': 'Venjulegt',
        'highSaturation': 'Há mettun',
        'monochrome': 'Einlitur',
        'highContrast': 'Hár kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Núverandi litaprófíll er: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Litur ekki þekktur',
        'cF44336': 'Rauður',
        'cE91E63': 'Bleikur',
        'c9C27B0': 'Fjólublár',
        'c673AB7': 'Dökkfjólublár',
        'c3F51B5': 'Indigóblár',
        'c2196F3': 'Blár',
        'c03A9F4': 'Ljósblár',
        'c00BCD4': 'Blágrænn',
        'c009688': 'Djúpblágrænn',
        'c4CAF50': 'Grænn',
        'c8BC34A': 'Ljósgrænn',
        'cCDDC39': 'Límgrænn',
        'cFFEB3B': 'Gulur',
        'cFFC107': 'Rafgulur',
        'cFF9800': 'Appelsínugulur',
        'cFF5722': 'Djúp appelsínugulur',
        'c795548': 'Brúnn',
        'c9E9E9E': 'Grár',
        'c607D8B': 'Blágrátt',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Minnka orðabil';

  @override
  String get decrement_letter_spacing => 'Minnka stafafjægð';

  @override
  String get decrement_line_height => 'Minnka línuhæð';

  @override
  String get decrement_text_scale_factor => 'Minnka stærðarstuðul texta';

  @override
  String get effects => 'Áhrif';

  @override
  String get expand_text => 'Stækka texta';

  @override
  String get font_size => 'Leturstærð';

  @override
  String get increase_or_decrease_word_spacing => 'Auka eða minnka orðabil';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Auka eða minnka stafafjægð';

  @override
  String get increase_or_decrease_line_height => 'Auka eða minnka línuhæð';

  @override
  String get increase_or_decrease_text_size => 'Auka eða minnka textastærð';

  @override
  String get increment_word_spacing => 'Auka orðabil';

  @override
  String get increment_letter_spacing => 'Auka stafafjægð';

  @override
  String get increment_line_height => 'Auka línuhæð';

  @override
  String get increment_text_scale_factor => 'Auka stærðarstuðul texta';

  @override
  String get less_info => 'Fela upplýsingar';

  @override
  String get letter_spacing => 'Stafafjægð';

  @override
  String get line_height => 'Línuhæð';

  @override
  String get more_info => 'Sýna upplýsingar';

  @override
  String get read_less => 'Lesa minna';

  @override
  String get read_more => 'Lesa meira';

  @override
  String get reduce_effects => 'Minnka áhrif á skjá';

  @override
  String get reduce_text => 'Minnka texta';

  @override
  String get restore_settings => 'Endurstilla stillingar';

  @override
  String get restore_main_color => 'Endurstilla aðallit';

  @override
  String get return_to_main_colors => 'Aftur í aðalliti';

  @override
  String get settings => 'Stillingar';

  @override
  String get size_and_text_display => 'Stærð og birtingarmáti texta';

  @override
  String get slider_word_spacing => 'Slæða fyrir orðabil';

  @override
  String get slider_letter_spacing => 'Slæða fyrir stafafjægð';

  @override
  String get slider_line_height => 'Slæða fyrir línuhæð';

  @override
  String get theme_mode => 'Þéma';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Þémaprófíll ekki þekktur',
        'seizureSafe': 'Flöguöruggt',
        'visionImpaired': 'Sjónskertur',
        'adhdFriendly': 'ADHD vænt',
        'none': 'Sjálfgefið',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Flöguöruggt snið';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Fjarlægja endurkast og draga úr lit';

  @override
  String get theme_profile_seizure_safe_description =>
      'Þetta snið gerir notendum með flögur og áhættu á flögum kleift að vafra örugglega með því að útrýma hættu á flögum sem stafa af blikkandi hreyfingum og áhættusomum litasamsetningum.';

  @override
  String get theme_profile_vision_impaired_title => 'Snið fyrir sjónskerta';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Bæta sýnileika forritsins';

  @override
  String get theme_profile_vision_impaired_description =>
      'Þetta snið aðlagar forritið til að vera aðgengilegt fyrir flest sjóntröflun, svo sem sjónskerðing, göngusjón, drérsjón, gláka og fleira.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD vænt snið';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Meiri einbeiting og minni truflun';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Þetta snið minnkar verulega truflanir, til að hjálpa fólki með ADHD og taugaþróunarraskanir að sigla, lesa og einbeita sér að mikilægum hlutum forritsins á auðveldari hátt.';

  @override
  String get the_settings_have_been_reset =>
      'Stillingarnar hafa verið endurstilltar.';

  @override
  String get toggle_dark_mode => 'Víxla dökku þmu';

  @override
  String get toggle_effects_mode => 'Víxla áhrifa ham';

  @override
  String get toggle_font_weight => 'Víxla leturfeiti';

  @override
  String get toggle_theme_profile => 'Víxla þémaprófíl';

  @override
  String get word_spacing => 'Orðabil';
}
