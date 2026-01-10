// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AccessibilityLocalizationsSl extends AccessibilityLocalizations {
  AccessibilityLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get accessibility => 'Dostopnost';

  @override
  String get accessibility_settings => 'Nastavitve dostopnosti';

  @override
  String get adjust_background_colors => 'Prilagodi barve ozadja';

  @override
  String get adjust_text_colors => 'Prilagodi barve besedila';

  @override
  String get align_center => 'Poravnaj na sredino';

  @override
  String get align_left => 'Poravnaj levo';

  @override
  String get align_right => 'Poravnaj desno';

  @override
  String get bold_text => 'Krepko besedilo';

  @override
  String get change_bold_text => 'Spremeni krepko besedilo';

  @override
  String get change_pages_background_color =>
      'Spremeni barvo ozadja strani na: ';

  @override
  String get change_text_color => 'Spremeni barvo besedila na: ';

  @override
  String get change_text_color_shade => 'Spremeni odtenek barve na: ';

  @override
  String get color_adjustment => 'Prilagoditev barv';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normalno',
        'lowSaturation': 'Nizka nasičenost',
        'normal': 'Normalno',
        'highSaturation': 'Visoka nasičenost',
        'monochrome': 'Enobarvno',
        'highContrast': 'Visok kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Trenutni barvni profil je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Barva ni prepoznana',
        'cF44336': 'Rdeča',
        'cE91E63': 'Roza',
        'c9C27B0': 'Vijolična',
        'c673AB7': 'Temno vijolična',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Modra',
        'c03A9F4': 'Svetlo modra',
        'c00BCD4': 'Cijan',
        'c009688': 'Turkizna',
        'c4CAF50': 'Zelena',
        'c8BC34A': 'Svetlo zelena',
        'cCDDC39': 'Limeta',
        'cFFEB3B': 'Rumena',
        'cFFC107': 'Jantarna',
        'cFF9800': 'Oranžna',
        'cFF5722': 'Temno oranžna',
        'c795548': 'Rjava',
        'c9E9E9E': 'Siva',
        'c607D8B': 'Modro siva',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Zmanjšaj razmik med besedami';

  @override
  String get decrement_letter_spacing => 'Zmanjšaj razmik med črkami';

  @override
  String get decrement_line_height => 'Zmanjšaj višino vrstice';

  @override
  String get decrement_text_scale_factor =>
      'Zmanjšaj faktor velikosti besedila';

  @override
  String get effects => 'Učinki';

  @override
  String get expand_text => 'Razširi besedilo';

  @override
  String get font_size => 'Velikost pisave';

  @override
  String get increase_or_decrease_word_spacing =>
      'Povečaj ali zmanjšaj razmik med besedami';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Povečaj ali zmanjšaj razmik med črkami';

  @override
  String get increase_or_decrease_line_height =>
      'Povečaj ali zmanjšaj višino vrstice';

  @override
  String get increase_or_decrease_text_size =>
      'Povečaj ali zmanjšaj velikost besedila';

  @override
  String get increment_word_spacing => 'Povečaj razmik med besedami';

  @override
  String get increment_letter_spacing => 'Povečaj razmik med črkami';

  @override
  String get increment_line_height => 'Povečaj višino vrstice';

  @override
  String get increment_text_scale_factor => 'Povečaj faktor velikosti besedila';

  @override
  String get less_info => 'Skrij informacije';

  @override
  String get letter_spacing => 'Razmik med črkami';

  @override
  String get line_height => 'Višina vrstice';

  @override
  String get more_info => 'Prikaži informacije';

  @override
  String get read_less => 'Preberi manj';

  @override
  String get read_more => 'Preberi več';

  @override
  String get reduce_effects => 'Zmanjšaj učinke na zaslonu';

  @override
  String get reduce_text => 'Zmanjšaj besedilo';

  @override
  String get restore_settings => 'Obnovi nastavitve';

  @override
  String get restore_main_color => 'Obnovi glavno barvo';

  @override
  String get return_to_main_colors => 'Vrni se na glavne barve';

  @override
  String get settings => 'Nastavitve';

  @override
  String get size_and_text_display => 'Velikost in prikaz besedila';

  @override
  String get slider_word_spacing => 'Drsnik za razmik med besedami';

  @override
  String get slider_letter_spacing => 'Drsnik za razmik med črkami';

  @override
  String get slider_line_height => 'Drsnik za višino vrstice';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Profil teme ni prepoznan',
        'seizureSafe': 'Varno za epileptike',
        'visionImpaired': 'Za slabovidne',
        'adhdFriendly': 'Prijazno za ADHD',
        'none': 'Privzeto',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Profil varen za epileptike';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Odstrani odseve in zmanjšaj barve';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ta profil omogoča uporabnikom z epilepsijo in tveganjem za napade varno brskanje z odpravo tveganja napadov, ki so posledica utripajočih animacij in tveganih barvnih kombinacij.';

  @override
  String get theme_profile_vision_impaired_title => 'Profil za slabovidne';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Izboljšaj vidljivost aplikacije';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ta profil prilagodi aplikacijo tako, da je dostopna večini vidnih okvar, kot so slabovidnost, tunelski vid, siva mrena, glavkom in drugo.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil prijazen za ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Več koncentracije in manj motenj';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ta profil občutno zmanjša motnje, da pomaga ljudem z ADHD in razvojnimi motnjami lažje krmariti, brati in se osredotočiti na bistvene elemente aplikacije.';

  @override
  String get the_settings_have_been_reset =>
      'Nastavitve so bile ponastavljene.';

  @override
  String get toggle_dark_mode => 'Preklopi temni način';

  @override
  String get toggle_effects_mode => 'Preklopi način učinkov';

  @override
  String get toggle_font_weight => 'Preklopi debelino pisave';

  @override
  String get toggle_theme_profile => 'Preklopi profil teme';

  @override
  String get word_spacing => 'Razmik med besedami';

  @override
  String get accessible_font => 'Dostopna pisava';

  @override
  String get accessible_font_subtitle =>
      'Uporabite pisavo Verdana za boljšo berljivost';

  @override
  String get accessible_font_enabled => 'Dostopna pisava omogočena';

  @override
  String get accessible_font_disabled => 'Dostopna pisava onemogočena';

  @override
  String get toggle_accessible_font => 'Preklopi dostopno pisavo';
}
