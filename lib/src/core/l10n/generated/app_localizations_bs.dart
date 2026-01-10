// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AccessibilityLocalizationsBs extends AccessibilityLocalizations {
  AccessibilityLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get accessibility => 'Pristupačnost';

  @override
  String get accessibility_settings => 'Postavke pristupačnosti';

  @override
  String get adjust_background_colors => 'Prilagodi pozadinske boje';

  @override
  String get adjust_text_colors => 'Prilagodi boje teksta';

  @override
  String get align_center => 'Poravnaj u sredinu';

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
      'Promijeni pozadinsku boju stranica u: ';

  @override
  String get change_text_color => 'Promijeni boju teksta u: ';

  @override
  String get change_text_color_shade => 'Promijeni nijansu boje u: ';

  @override
  String get color_adjustment => 'Prilagodba boja';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normalno',
        'lowSaturation': 'Niska saturacija',
        'normal': 'Normalno',
        'highSaturation': 'Visoka saturacija',
        'monochrome': 'Monohrom',
        'highContrast': 'Visok kontrast',
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
        'c03A9F4': 'Svijetlo plava',
        'c00BCD4': 'Cijan',
        'c009688': 'Tirkizna',
        'c4CAF50': 'Zelena',
        'c8BC34A': 'Svijetlo zelena',
        'cCDDC39': 'Limeta',
        'cFFEB3B': 'Žuta',
        'cFFC107': 'Jantarna',
        'cFF9800': 'Narandžasta',
        'cFF5722': 'Tamno narandžasta',
        'c795548': 'Smeđa',
        'c9E9E9E': 'Siva',
        'c607D8B': 'Plavo-siva',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Smanji razmak između riječi';

  @override
  String get decrement_letter_spacing => 'Smanji razmak između slova';

  @override
  String get decrement_line_height => 'Smanji visinu linije';

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
      'Povećaj ili smanji razmak između riječi';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Povećaj ili smanji razmak između slova';

  @override
  String get increase_or_decrease_line_height =>
      'Povećaj ili smanji visinu linije';

  @override
  String get increase_or_decrease_text_size =>
      'Povećaj ili smanji veličinu teksta';

  @override
  String get increment_word_spacing => 'Povećaj razmak između riječi';

  @override
  String get increment_letter_spacing => 'Povećaj razmak između slova';

  @override
  String get increment_line_height => 'Povećaj visinu linije';

  @override
  String get increment_text_scale_factor => 'Povećaj faktor skaliranja teksta';

  @override
  String get less_info => 'Sakrij informacije';

  @override
  String get letter_spacing => 'Razmak između slova';

  @override
  String get line_height => 'Visina linije';

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
  String get return_to_main_colors => 'Vrati se na glavne boje';

  @override
  String get settings => 'Postavke';

  @override
  String get size_and_text_display => 'Veličina i prikaz teksta';

  @override
  String get slider_word_spacing => 'Klizač razmaka između riječi';

  @override
  String get slider_letter_spacing => 'Klizač razmaka između slova';

  @override
  String get slider_line_height => 'Klizač visine linije';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Profil teme nije prepoznat',
        'seizureSafe': 'Zaštita od napada',
        'visionImpaired': 'Za osobe oštećenog vida',
        'adhdFriendly': 'ADHD-prilagodljiv',
        'none': 'Zadano',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profil siguran za epileptičare';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Uklanjanje refleksija i smanjenje boja';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ovaj profil omogućava korisnicima koji imaju epilepsiju i rizik od napada sigurno pregledavanje eliminisanjem rizika od napada koji mogu biti uzrokovani treptajućim animacijama i rizičnim kombinacijama boja.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil za osobe oštećenog vida';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Poboljšana vidljivost aplikacije';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ovaj profil prilagođava aplikaciju da bude pristupačna većini vizualnih oštećenja, kao što su slabovidnost, tunelski vid, katarakta, glaukom i drugo.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-prilagodljiv profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Veća koncentracija i manje ometanja';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ovaj profil značajno smanjuje ometanja, kako bi pomogao ljudima s ADHD-om i neurorazvojnim poremećajima da lakše navigiraju, čitaju i fokusiraju se na bitne elemente aplikacije.';

  @override
  String get the_settings_have_been_reset =>
      'Postavke su vraćene na početno stanje.';

  @override
  String get toggle_dark_mode => 'Uključi/isključi tamni mod';

  @override
  String get toggle_effects_mode => 'Uključi/isključi mod efekata';

  @override
  String get toggle_font_weight => 'Uključi/isključi debljinu fonta';

  @override
  String get toggle_theme_profile => 'Uključi/isključi profil teme';

  @override
  String get word_spacing => 'Razmak između riječi';

  @override
  String get accessible_font => 'Pristupačan font';

  @override
  String get accessible_font_subtitle =>
      'Koristite Verdana font za bolju čitljivost';

  @override
  String get accessible_font_enabled => 'Pristupačan font uključen';

  @override
  String get accessible_font_disabled => 'Pristupačan font isključen';

  @override
  String get toggle_accessible_font => 'Uključi/isključi pristupačan font';
}
