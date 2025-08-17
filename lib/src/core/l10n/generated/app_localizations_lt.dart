// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AccessibilityLocalizationsLt extends AccessibilityLocalizations {
  AccessibilityLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get accessibility => 'Prieinamumas';

  @override
  String get accessibility_settings => 'Prieinamumo nustatymai';

  @override
  String get adjust_background_colors => 'Koreguoti fono spalvas';

  @override
  String get adjust_text_colors => 'Koreguoti teksto spalvas';

  @override
  String get align_center => 'Lygiuoti centre';

  @override
  String get align_left => 'Lygiuoti kairėje';

  @override
  String get align_right => 'Lygiuoti dešinėje';

  @override
  String get bold_text => 'Paryškintas tekstas';

  @override
  String get change_bold_text => 'Keisti teksto paryškinimą';

  @override
  String get change_pages_background_color => 'Keisti puslapių fono spalvą į: ';

  @override
  String get change_text_color => 'Keisti teksto spalvą į: ';

  @override
  String get change_text_color_shade => 'Keisti spalvos atspalvį į: ';

  @override
  String get color_adjustment => 'Spalvų koregavimas';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Įprastas',
      'lowSaturation': 'Žemas sotīs',
      'normal': 'Įprastas',
      'highSaturation': 'Aukštas sotīs',
      'monochrome': 'Vienspalvis',
      'highContrast': 'Didelis kontrastas',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Dabartinis spalvų profilis yra: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Spalva neatpažinta',
      'cF44336': 'Raudona',
      'cE91E63': 'Rožinė',
      'c9C27B0': 'Violetinė',
      'c673AB7': 'Tamsiai violetine',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Mėlyna',
      'c03A9F4': 'Šviesi mėlyna',
      'c00BCD4': 'Žydra',
      'c009688': 'Smaragdinė',
      'c4CAF50': 'Žalia',
      'c8BC34A': 'Šviesi žalia',
      'cCDDC39': 'Žalsvai geltona',
      'cFFEB3B': 'Geltona',
      'cFFC107': 'Gintarinė',
      'cFF9800': 'Oranžinė',
      'cFF5722': 'Tamsiai oranžinė',
      'c795548': 'Ruda',
      'c9E9E9E': 'Pilka',
      'c607D8B': 'Melsvai pilka',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Mažinti žodžių tarpą';

  @override
  String get decrement_letter_spacing => 'Mažinti raidžių tarpą';

  @override
  String get decrement_line_height => 'Mažinti eilutės aukštį';

  @override
  String get decrement_text_scale_factor =>
      'Mažinti teksto mastelio koeficientą';

  @override
  String get effects => 'Efektai';

  @override
  String get expand_text => 'Išplėsti tekstą';

  @override
  String get font_size => 'Šrifto dydis';

  @override
  String get increase_or_decrease_word_spacing =>
      'Padidinti arba sumažinti žodžių tarpą';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Padidinti arba sumažinti raidžių tarpą';

  @override
  String get increase_or_decrease_line_height =>
      'Padidinti arba sumažinti eilutės aukštį';

  @override
  String get increase_or_decrease_text_size =>
      'Padidinti arba sumažinti teksto dydį';

  @override
  String get increment_word_spacing => 'Padidinti žodžių tarpą';

  @override
  String get increment_letter_spacing => 'Padidinti raidžių tarpą';

  @override
  String get increment_line_height => 'Padidinti eilutės aukštį';

  @override
  String get increment_text_scale_factor =>
      'Padidinti teksto mastelio koeficientą';

  @override
  String get less_info => 'Slėpti informaciją';

  @override
  String get letter_spacing => 'Raidžių tarpas';

  @override
  String get line_height => 'Eilutės aukštis';

  @override
  String get more_info => 'Rodyti informaciją';

  @override
  String get read_less => 'Skaityti mažiau';

  @override
  String get read_more => 'Skaityti daugiau';

  @override
  String get reduce_effects => 'Sumažinti efektus ekrane';

  @override
  String get reduce_text => 'Sumažinti tekstą';

  @override
  String get restore_settings => 'Atstatyti nustatymus';

  @override
  String get restore_main_color => 'Atstatyti pagrindinę spalvą';

  @override
  String get return_to_main_colors => 'Grįžti į pagrindines spalvas';

  @override
  String get settings => 'Nustatymai';

  @override
  String get size_and_text_display => 'Dydis ir teksto rodymas';

  @override
  String get slider_word_spacing => 'Žodžių tarpo slankiklis';

  @override
  String get slider_letter_spacing => 'Raidžių tarpo slankiklis';

  @override
  String get slider_line_height => 'Eilutės aukščio slankiklis';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Temos profilis neatpažintas',
      'seizureSafe': 'Saugus nuo priepuolių',
      'visionImpaired': 'Silpnaregiams',
      'adhdFriendly': 'ADHD draugiškas',
      'none': 'Numatytasis',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Saugus nuo priepuolių profilis';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Pašalinti atspindžius ir sumažinti spalvas';

  @override
  String get theme_profile_seizure_safe_description =>
      'Šis profilis leidžia vartotojams, sergantiems epilepsija ir turintiems priepuolių riziką, naršyti saugiai pašalinant priepuolių, kuriuos sukelia mirksintys animaciniai elementai ir rizikingos spalvų kombinacijos, riziką.';

  @override
  String get theme_profile_vision_impaired_title => 'Silpnaregių profilis';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Pagerinti programos matomumą';

  @override
  String get theme_profile_vision_impaired_description =>
      'Šis profilis pritaiko programą, kad ji būtų prieinama daugumai regėjimo sutrikimų, tokiems kaip silpnaregystė, tunelio regėjimas, katarakta, glaukoma ir kitiems.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD draugiškas profilis';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Didesnis susikaupimas ir mažiau blaškomų veiksnių';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Šis profilis žymiai sumažina blaškančius veiksnius, padėdamas žmonėms su ADHD ir neuroraidos sutrikimais lengviau naršyti, skaityti ir sutelkti dėmesį į esminius programos elementus.';

  @override
  String get the_settings_have_been_reset => 'Nustatymai buvo atstatyti.';

  @override
  String get toggle_dark_mode => 'Perjungti tamsų režimą';

  @override
  String get toggle_effects_mode => 'Perjungti efektų režimą';

  @override
  String get toggle_font_weight => 'Perjungti šrifto storį';

  @override
  String get toggle_theme_profile => 'Perjungti temos profilį';

  @override
  String get word_spacing => 'Žodžių tarpas';
}
