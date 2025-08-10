// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AccessibilityLocalizationsSr extends AccessibilityLocalizations {
  AccessibilityLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get accessibility => 'Pristupačnost';

  @override
  String get accessibility_settings => 'Podešavanja pristupačnosti';

  @override
  String get adjust_background_colors => 'Prilagodi pozadinske boje';

  @override
  String get adjust_text_colors => 'Prilagodi boje teksta';

  @override
  String get align_center => 'Poravnaj po sredini';

  @override
  String get align_left => 'Poravnaj levo';

  @override
  String get align_right => 'Poravnaj desno';

  @override
  String get bold_text => 'Podebljan tekst';

  @override
  String get change_bold_text => 'Promeni podebljanje teksta';

  @override
  String get change_pages_background_color =>
      'Promeni pozadinsku boju stranica na: ';

  @override
  String get change_text_color => 'Promeni boju teksta na: ';

  @override
  String get change_text_color_shade => 'Promeni nijansu boje na: ';

  @override
  String get color_adjustment => 'Podešavanje boja';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normalno',
        'lowSaturation': 'Niska zasićenost',
        'normal': 'Normalno',
        'highSaturation': 'Visoka zasićenost',
        'monochrome': 'Monohromatski',
        'highContrast': 'Visoki kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Trenutni profil boja je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Boja nije prepoznata',
        'cF44336': 'Crvena',
        'cE91E63': 'Roze',
        'c9C27B0': 'Ljubičasta',
        'c673AB7': 'Tamno ljubičasta',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Plava',
        'c03A9F4': 'Svetlo plava',
        'c00BCD4': 'Cijan',
        'c009688': 'Tirkizna',
        'c4CAF50': 'Zelena',
        'c8BC34A': 'Svetlo zelena',
        'cCDDC39': 'Limeta',
        'cFFEB3B': 'Žuta',
        'cFFC107': 'Ćilibar',
        'cFF9800': 'Narandžasta',
        'cFF5722': 'Tamno narandžasta',
        'c795548': 'Braon',
        'c9E9E9E': 'Siva',
        'c607D8B': 'Plavo-siva',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Smanji razmak između reči';

  @override
  String get decrement_letter_spacing => 'Smanji razmak između slova';

  @override
  String get decrement_line_height => 'Smanji visinu reda';

  @override
  String get decrement_text_scale_factor => 'Smanji faktor skaliranja teksta';

  @override
  String get effects => 'Efekti';

  @override
  String get expand_text => 'Proširi tekst';

  @override
  String get font_size => 'Veličina fonta';

  @override
  String get increase_or_decrease_word_spacing =>
      'Povećaj ili smanji razmak između reči';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Povećaj ili smanji razmak između slova';

  @override
  String get increase_or_decrease_line_height =>
      'Povećaj ili smanji visinu reda';

  @override
  String get increase_or_decrease_text_size =>
      'Povećaj ili smanji veličinu teksta';

  @override
  String get increment_word_spacing => 'Povećaj razmak između reči';

  @override
  String get increment_letter_spacing => 'Povećaj razmak između slova';

  @override
  String get increment_line_height => 'Povećaj visinu reda';

  @override
  String get increment_text_scale_factor => 'Povećaj faktor skaliranja teksta';

  @override
  String get less_info => 'Sakrij informacije';

  @override
  String get letter_spacing => 'Razmak između slova';

  @override
  String get line_height => 'Visina reda';

  @override
  String get more_info => 'Prikaži informacije';

  @override
  String get read_less => 'Pročitaj manje';

  @override
  String get read_more => 'Pročitaj više';

  @override
  String get reduce_effects => 'Smanji efekte na ekranu';

  @override
  String get reduce_text => 'Smanji tekst';

  @override
  String get restore_settings => 'Vrati podešavanja';

  @override
  String get restore_main_color => 'Vrati glavnu boju';

  @override
  String get return_to_main_colors => 'Vrati se na glavne boje';

  @override
  String get settings => 'Podešavanja';

  @override
  String get size_and_text_display => 'Veličina i prikaz teksta';

  @override
  String get slider_word_spacing => 'Klizač za razmak između reči';

  @override
  String get slider_letter_spacing => 'Klizač za razmak između slova';

  @override
  String get slider_line_height => 'Klizač za visinu reda';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Profil teme nije prepoznat',
        'seizureSafe': 'Bezbedno za epilepsiju',
        'visionImpaired': 'Oštećen vid',
        'adhdFriendly': 'Prilagođeno za ADHD',
        'none': 'Podrazumevano',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profil bezbedan za epilepsiju';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Ukloni refleksije i smanji boje';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ovaj profil omogućava korisnicima koji imaju epilepsiju i rizik od napada da bezbedno pretražuju eliminisanjem rizika od napada koji nastaju zbog treptajućih animacija i rizičnih kombinacija boja.';

  @override
  String get theme_profile_vision_impaired_title => 'Profil za oštećen vid';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Poboljšaj vidljivost aplikacije';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ovaj profil prilagođava aplikaciju da bude pristupačna za većinu oštećenja vida, kao što su oštećenje vida, tunelski vid, katarakta, glaukom i drugo.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil prilagođen za ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Više koncentracije i manje ometanja';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ovaj profil značajno smanjuje ometanja, kako bi pomogao osobama sa ADHD-om i neurorazvojnim poremećajima da lakše navigiraju, čitaju i fokusiraju se na suštinske elemente aplikacije.';

  @override
  String get the_settings_have_been_reset =>
      'Podešavanja su vraćena na početne vrednosti.';

  @override
  String get toggle_dark_mode => 'Uključi/isključi tamni režim';

  @override
  String get toggle_effects_mode => 'Uključi/isključi režim efekata';

  @override
  String get toggle_font_weight => 'Promeni debljinu fonta';

  @override
  String get toggle_theme_profile => 'Promeni profil teme';

  @override
  String get word_spacing => 'Razmak između reči';
}
