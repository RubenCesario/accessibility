// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AccessibilityLocalizationsEu extends AccessibilityLocalizations {
  AccessibilityLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get accessibility => 'Irisgarritasuna';

  @override
  String get accessibility_settings => 'Irisgarritasun ezarpenak';

  @override
  String get adjust_background_colors => 'Doitu atzeko planoko koloreak';

  @override
  String get adjust_text_colors => 'Doitu testuaren koloreak';

  @override
  String get align_center => 'Erdiratu';

  @override
  String get align_left => 'Ezkerrera lerrokatu';

  @override
  String get align_right => 'Eskuinera lerrokatu';

  @override
  String get bold_text => 'Testu lodia';

  @override
  String get change_bold_text => 'Aldatu testuaren lodiera';

  @override
  String get change_pages_background_color =>
      'Aldatu orrien atzeko planoaren kolorea honetara: ';

  @override
  String get change_text_color => 'Aldatu testuaren kolorea honetara: ';

  @override
  String get change_text_color_shade => 'Aldatu kolorearen itzala honetara: ';

  @override
  String get color_adjustment => 'Koloreen doikuntza';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normala',
        'lowSaturation': 'Saturazioa baxua',
        'normal': 'Normala',
        'highSaturation': 'Saturazioa altua',
        'monochrome': 'Monokromatikoa',
        'highContrast': 'Kontraste altua',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Uneko kolore profila hau da: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Kolorea ez da ezagutu',
        'cF44336': 'Gorria',
        'cE91E63': 'Arrosa',
        'c9C27B0': 'Morea',
        'c673AB7': 'More sakona',
        'c3F51B5': 'Indigoa',
        'c2196F3': 'Urdina',
        'c03A9F4': 'Urdin argia',
        'c00BCD4': 'Ziana',
        'c009688': 'Urdin berdexka',
        'c4CAF50': 'Berdea',
        'c8BC34A': 'Berde argia',
        'cCDDC39': 'Lima',
        'cFFEB3B': 'Horia',
        'cFFC107': 'Anbar',
        'cFF9800': 'Laranja',
        'cFF5722': 'Laranja sakona',
        'c795548': 'Marroia',
        'c9E9E9E': 'Grisa',
        'c607D8B': 'Urdin grisaxka',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Gutxitu hitzen arteko espazioa';

  @override
  String get decrement_letter_spacing => 'Gutxitu letren arteko espazioa';

  @override
  String get decrement_line_height => 'Gutxitu lerroaren altuera';

  @override
  String get decrement_text_scale_factor => 'Gutxitu testuaren eskala faktorea';

  @override
  String get effects => 'Efektuak';

  @override
  String get expand_text => 'Zabaldu testua';

  @override
  String get font_size => 'Letra tamaina';

  @override
  String get increase_or_decrease_word_spacing =>
      'Handitu edo gutxitu hitzen arteko espazioa';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Handitu edo gutxitu letren arteko espazioa';

  @override
  String get increase_or_decrease_line_height =>
      'Handitu edo gutxitu lerroaren altuera';

  @override
  String get increase_or_decrease_text_size =>
      'Handitu edo gutxitu testuaren tamaina';

  @override
  String get increment_word_spacing => 'Handitu hitzen arteko espazioa';

  @override
  String get increment_letter_spacing => 'Handitu letren arteko espazioa';

  @override
  String get increment_line_height => 'Handitu lerroaren altuera';

  @override
  String get increment_text_scale_factor => 'Handitu testuaren eskala faktorea';

  @override
  String get less_info => 'Ezkutatu informazioa';

  @override
  String get letter_spacing => 'Letren arteko espazioa';

  @override
  String get line_height => 'Lerroaren altuera';

  @override
  String get more_info => 'Erakutsi informazioa';

  @override
  String get read_less => 'Irakurri gutxiago';

  @override
  String get read_more => 'Irakurri gehiago';

  @override
  String get reduce_effects => 'Gutxitu pantailaren efektuak';

  @override
  String get reduce_text => 'Txikiagotu testua';

  @override
  String get restore_settings => 'Leheneratu ezarpenak';

  @override
  String get restore_main_color => 'Leheneratu kolore nagusia';

  @override
  String get return_to_main_colors => 'Itzuli kolore nagusietara';

  @override
  String get settings => 'Ezarpenak';

  @override
  String get size_and_text_display => 'Tamaina eta testu bistaratzea';

  @override
  String get slider_word_spacing =>
      'Hitzen arteko espazioa irristatzailearekin';

  @override
  String get slider_letter_spacing =>
      'Letren arteko espazioa irristatzailearekin';

  @override
  String get slider_line_height => 'Lerro altuera irristatzailearekin';

  @override
  String get theme_mode => 'Gaia';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Ez da gai profila ezagutzen',
        'seizureSafe': 'Krisi epileptikoetarako segurua',
        'visionImpaired': 'Ikusmen urritasunerako',
        'adhdFriendly': 'AGNH-lagungarria',
        'none': 'Lehenetsia',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Krisi epileptikoetarako profil segurua';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Kendu islak eta murriztu kolorea';

  @override
  String get theme_profile_seizure_safe_description =>
      'Profil honek epilepsia duten eta krisi epileptikoen arriskuan dauden erabiltzaileei modu seguruan nabigatzeko aukera ematen die, animazio distiratsuek eta kolore konbinazio arriskutsuek eragin ditzaketen krisien arriskuak ezabatuz.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Ikusmen urritasunerako profila';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Hobetu aplikazioaren ikusgaitasuna';

  @override
  String get theme_profile_vision_impaired_description =>
      'Profil honek aplikazioa ikusmen urritasun gehienetarako irisgarria izateko moldatzen du, hala nola ikusmen urritasuna, tunel ikusmena, kataratak, glaukoma eta abar.';

  @override
  String get theme_profile_adhd_friendly_title => 'AGNH-lagungarri profila';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Kontzentrazio gehiago eta distrakzio gutxiago';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Profil honek nabarmen gutxitzen ditu distrakzioak, AGNH (Arreta Gabe eta Hiperaktibitate Nahasmendua) eta garapen neurologikoko nahasmenduak dituzten pertsonei aplikazioaren funtsezko elementuetan errazago nabigatzen, irakurtzen eta arreta jartzen laguntzeko.';

  @override
  String get the_settings_have_been_reset => 'Ezarpenak berrezarri dira.';

  @override
  String get toggle_dark_mode => 'Modu iluna txandakatu';

  @override
  String get toggle_effects_mode => 'Efektuen modua txandakatu';

  @override
  String get toggle_font_weight => 'Letraren pisua txandakatu';

  @override
  String get toggle_theme_profile => 'Gai profila txandakatu';

  @override
  String get word_spacing => 'Hitzen arteko espazioa';

  @override
  String get accessible_font => 'Irisgarritasun letra-tipoa';

  @override
  String get accessible_font_subtitle =>
      'Erabili Verdana letra-tipoa irakurgarritasun hoberako';

  @override
  String get accessible_font_enabled => 'Irisgarritasun letra-tipoa gaituta';

  @override
  String get accessible_font_disabled =>
      'Irisgarritasun letra-tipoa desgaituta';

  @override
  String get toggle_accessible_font => 'Irisgarritasun letra-tipoa txandakatu';
}
