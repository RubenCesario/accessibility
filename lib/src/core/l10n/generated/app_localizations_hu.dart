// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AccessibilityLocalizationsHu extends AccessibilityLocalizations {
  AccessibilityLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get accessibility => 'Akadálymentesítés';

  @override
  String get accessibility_settings => 'Akadálymentesítési beállítások';

  @override
  String get adjust_background_colors => 'Háttérszínek beállítása';

  @override
  String get adjust_text_colors => 'Szövegszínek beállítása';

  @override
  String get align_center => 'Középre igazítás';

  @override
  String get align_left => 'Balra igazítás';

  @override
  String get align_right => 'Jobbra igazítás';

  @override
  String get bold_text => 'Félkövér szöveg';

  @override
  String get change_bold_text => 'Félkövér szöveg módosítása';

  @override
  String get change_pages_background_color =>
      'Az oldalak háttérszínének módosítása: ';

  @override
  String get change_text_color => 'A szöveg színének módosítása: ';

  @override
  String get change_text_color_shade => 'A szín árnyalatának módosítása: ';

  @override
  String get color_adjustment => 'Színbeállítás';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normál',
        'lowSaturation': 'Alacsony telítettség',
        'normal': 'Normál',
        'highSaturation': 'Magas telítettség',
        'monochrome': 'Egyszínű',
        'highContrast': 'Magas kontraszt',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'A jelenlegi színprofil: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Szín nem felismerhető',
        'cF44336': 'Piros',
        'cE91E63': 'Rózsaszín',
        'c9C27B0': 'Lila',
        'c673AB7': 'Sötétlila',
        'c3F51B5': 'Indigó',
        'c2196F3': 'Kék',
        'c03A9F4': 'Világoskék',
        'c00BCD4': 'Cián',
        'c009688': 'Türkiz',
        'c4CAF50': 'Zöld',
        'c8BC34A': 'Világoszöld',
        'cCDDC39': 'Lime',
        'cFFEB3B': 'Sárga',
        'cFFC107': 'Borostyán',
        'cFF9800': 'Narancssárga',
        'cFF5722': 'Sötétnarancssárga',
        'c795548': 'Barna',
        'c9E9E9E': 'Szürke',
        'c607D8B': 'Kékeszürke',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Szóköz csökkentése';

  @override
  String get decrement_letter_spacing => 'Betűköz csökkentése';

  @override
  String get decrement_line_height => 'Soroköz csökkentése';

  @override
  String get decrement_text_scale_factor => 'Szövegméret csökkentése';

  @override
  String get effects => 'Effektek';

  @override
  String get expand_text => 'Szöveg kiterjesztése';

  @override
  String get font_size => 'Betűméret';

  @override
  String get increase_or_decrease_word_spacing =>
      'Szóköz növelése vagy csökkentése';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Betűköz növelése vagy csökkentése';

  @override
  String get increase_or_decrease_line_height =>
      'Soroköz növelése vagy csökkentése';

  @override
  String get increase_or_decrease_text_size =>
      'Szövegméret növelése vagy csökkentése';

  @override
  String get increment_word_spacing => 'Szóköz növelése';

  @override
  String get increment_letter_spacing => 'Betűköz növelése';

  @override
  String get increment_line_height => 'Soroköz növelése';

  @override
  String get increment_text_scale_factor => 'Szövegméret növelése';

  @override
  String get less_info => 'Információk elrejtése';

  @override
  String get letter_spacing => 'Betűköz';

  @override
  String get line_height => 'Soroköz';

  @override
  String get more_info => 'Információk megjelenítése';

  @override
  String get read_less => 'Kevesebb olvasása';

  @override
  String get read_more => 'Tovább olvasása';

  @override
  String get reduce_effects => 'Képernyőeffektek csökkentése';

  @override
  String get reduce_text => 'Szöveg csökkentése';

  @override
  String get restore_settings => 'Beállítások visszaállítása';

  @override
  String get restore_main_color => 'Fő szín visszaállítása';

  @override
  String get return_to_main_colors => 'Vissza a fő színekhez';

  @override
  String get settings => 'Beállítások';

  @override
  String get size_and_text_display => 'Méret és szövegmegjelenítés';

  @override
  String get slider_word_spacing => 'Szóköz csúszka';

  @override
  String get slider_letter_spacing => 'Betűköz csúszka';

  @override
  String get slider_line_height => 'Soroköz csúszka';

  @override
  String get theme_mode => 'Téma';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Profil nem felismerhető',
        'seizureSafe': 'Epilepszia-biztos',
        'visionImpaired': 'Gyengénlátóknak',
        'adhdFriendly': 'ADHD-barát',
        'none': 'Alapértelmezett',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepszia-biztos profil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Tükrözések eltávolítása és színek csökkentése';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ez a profil lehetővé teszi az epilepsziával élő és rohamokra hajlamos felhasználóknak a biztonságos böngészést, megszüntetve a villogó animációkból és kockázatos szín kombinációkból eredő rohamok veszélyét.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Gyengénlátóknak készült profil';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Az alkalmazás láthatóságának javítása';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ez a profil úgy alakítja az alkalmazást, hogy hozzáférhető legyen a legtöbb látással kapcsolatos problémával küzdő személynek, például gyengénlátás, alagut-látás, szürkehalály, zöld hályog és más esetekhez.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-barát profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Jobb koncentráció és kevesebb figyelemelterelés';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ez a profil jelentősen csökkenti a figyelemelterelő tényezőket, segítve az ADHD-val és idegfejlődési zavarokkal élő embereket a könnyebb navigációban, olvasásban és az alkalmazás lényeges elemeire való koncentrálásban.';

  @override
  String get the_settings_have_been_reset => 'A beállítások visszaállítva.';

  @override
  String get toggle_dark_mode => 'Sötét mód váltása';

  @override
  String get toggle_effects_mode => 'Effekt mód váltása';

  @override
  String get toggle_font_weight => 'Betűvasédság váltása';

  @override
  String get toggle_theme_profile => 'Témaprofil váltása';

  @override
  String get word_spacing => 'Szóköz';

  @override
  String get accessible_font => 'Akadálymentes betűtípus';

  @override
  String get accessible_font_subtitle =>
      'Használja a Verdana betűtípust a jobb olvashatóság érdekében';

  @override
  String get accessible_font_enabled => 'Akadálymentes betűtípus bekapcsolva';

  @override
  String get accessible_font_disabled => 'Akadálymentes betűtípus kikapcsolva';

  @override
  String get toggle_accessible_font => 'Akadálymentes betűtípus váltása';
}
