// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AccessibilityLocalizationsHr extends AccessibilityLocalizations {
  AccessibilityLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get accessibility => 'Pristupačnost';

  @override
  String get accessibility_settings => 'Postavke pristupačnosti';

  @override
  String get adjust_background_colors => 'Prilagodi boje pozadine';

  @override
  String get adjust_text_colors => 'Prilagodi boje teksta';

  @override
  String get align_center => 'Centriraj';

  @override
  String get align_left => 'Poravnaj lijevo';

  @override
  String get align_right => 'Poravnaj desno';

  @override
  String get bold_text => 'Podebljani tekst';

  @override
  String get change_bold_text => 'Promijeni podebljani tekst';

  @override
  String get change_pages_background_color =>
      'Promijeni boju pozadine stranica na: ';

  @override
  String get change_text_color => 'Promijeni boju teksta na: ';

  @override
  String get change_text_color_shade => 'Promijeni nijansu boje na: ';

  @override
  String get color_adjustment => 'Prilagodba boja';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normalno',
      'lowSaturation': 'Niska zasićenost',
      'normal': 'Normalno',
      'highSaturation': 'Visoka zasićenost',
      'monochrome': 'Jednobojno',
      'highContrast': 'Visoki kontrast',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Trenutni profil boja je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Boja nije prepoznata',
      'cF44336': 'Crvena',
      'cE91E63': 'Roza',
      'c9C27B0': 'Ljubičasta',
      'c673AB7': 'Tamno ljubičasta',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Plava',
      'c03A9F4': 'Svijetlo plava',
      'c00BCD4': 'Cijan',
      'c009688': 'Tirkizna',
      'c4CAF50': 'Zelena',
      'c8BC34A': 'Svijetlo zelena',
      'cCDDC39': 'Limeta',
      'cFFEB3B': 'Žuta',
      'cFFC107': 'Jantarna',
      'cFF9800': 'Narančasta',
      'cFF5722': 'Tamno narančasta',
      'c795548': 'Smeđa',
      'c9E9E9E': 'Siva',
      'c607D8B': 'Plavo-siva',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Smanji razmak između riječi';

  @override
  String get decrement_letter_spacing => 'Smanji razmak između slova';

  @override
  String get decrement_line_height => 'Smanji visinu redka';

  @override
  String get decrement_text_scale_factor => 'Smanji faktor veličine teksta';

  @override
  String get effects => 'Efekti';

  @override
  String get expand_text => 'Proširi tekst';

  @override
  String get font_size => 'Veličina fonta';

  @override
  String get increase_or_decrease_word_spacing =>
      'Povećaj ili smanji razmak između riječi';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Povećaj ili smanji razmak između slova';

  @override
  String get increase_or_decrease_line_height =>
      'Povećaj ili smanji visinu redka';

  @override
  String get increase_or_decrease_text_size =>
      'Povećaj ili smanji veličinu teksta';

  @override
  String get increment_word_spacing => 'Povećaj razmak između riječi';

  @override
  String get increment_letter_spacing => 'Povećaj razmak između slova';

  @override
  String get increment_line_height => 'Povećaj visinu redka';

  @override
  String get increment_text_scale_factor => 'Povećaj faktor veličine teksta';

  @override
  String get less_info => 'Sakrij informacije';

  @override
  String get letter_spacing => 'Razmak između slova';

  @override
  String get line_height => 'Visina redka';

  @override
  String get more_info => 'Prikaži informacije';

  @override
  String get read_less => 'Čitaj manje';

  @override
  String get read_more => 'Čitaj više';

  @override
  String get reduce_effects => 'Smanji efekte na ekranu';

  @override
  String get reduce_text => 'Smanji tekst';

  @override
  String get restore_settings => 'Vrati postavke';

  @override
  String get restore_main_color => 'Vrati glavnu boju';

  @override
  String get return_to_main_colors => 'Povratak na glavne boje';

  @override
  String get settings => 'Postavke';

  @override
  String get size_and_text_display => 'Veličina i prikaz teksta';

  @override
  String get slider_word_spacing => 'Klizač razmaka između riječi';

  @override
  String get slider_letter_spacing => 'Klizač razmaka između slova';

  @override
  String get slider_line_height => 'Klizač visine redka';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil teme nije prepoznat',
      'seizureSafe': 'Sigurno za epilepsiju',
      'visionImpaired': 'Za oštećen vid',
      'adhdFriendly': 'Prilagođeno za ADHD',
      'none': 'Zadano',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Profil siguran za epilepsiju';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Ukloni refleksije i smanji boje';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ovaj profil omogućuje korisnicima koji boluju od epilepsije i rizikom od napada sigurno pregledavanje eliminirajući rizik od napada uzrokovanih bljeskajućim animacijama i rizičnim kombinacijama boja.';

  @override
  String get theme_profile_vision_impaired_title => 'Profil za oštećen vid';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Poboljšaj vidljivost aplikacije';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ovaj profil prilagođava aplikaciju da bude pristupačna većini oštećenja vida, kao što su slabovidnost, tunelski vid, katarakta, glaukom i više.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-prilagođeni profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Više koncentracije i manje ometanja';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ovaj profil značajno smanjuje ometanja, kako bi pomogao ljudima s ADHD-om i neurološkim poremećajima da lakše navigiraju, čitaju i fokusiraju se na bitne elemente aplikacije.';

  @override
  String get the_settings_have_been_reset =>
      'Postavke su vraćene na početne vrijednosti.';

  @override
  String get toggle_dark_mode => 'Uključi/isključi tamni način';

  @override
  String get toggle_effects_mode => 'Uključi/isključi način efekata';

  @override
  String get toggle_font_weight => 'Uključi/isključi debljinu fonta';

  @override
  String get toggle_theme_profile => 'Uključi/isključi profil teme';

  @override
  String get word_spacing => 'Razmak između riječi';
}
