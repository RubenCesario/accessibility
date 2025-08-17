// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AccessibilityLocalizationsRo extends AccessibilityLocalizations {
  AccessibilityLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get accessibility => 'Accesibilitate';

  @override
  String get accessibility_settings => 'Setări de accesibilitate';

  @override
  String get adjust_background_colors => 'Ajustează culorile de fundal';

  @override
  String get adjust_text_colors => 'Ajustează culorile textului';

  @override
  String get align_center => 'Aliniere centru';

  @override
  String get align_left => 'Aliniere stânga';

  @override
  String get align_right => 'Aliniere dreapta';

  @override
  String get bold_text => 'Text îngroșat';

  @override
  String get change_bold_text => 'Schimbă textul îngroșat';

  @override
  String get change_pages_background_color =>
      'Schimbă culoarea de fundal a paginilor în: ';

  @override
  String get change_text_color => 'Schimbă culoarea textului în: ';

  @override
  String get change_text_color_shade => 'Schimbă nuanța culorii în: ';

  @override
  String get color_adjustment => 'Ajustare culoare';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Saturație scăzută',
      'normal': 'Normal',
      'highSaturation': 'Saturație ridicată',
      'monochrome': 'Monocrom',
      'highContrast': 'Contrast ridicat',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Profilul de culoare actual este: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Culoare nerecunoscută',
      'cF44336': 'Roșu',
      'cE91E63': 'Roz',
      'c9C27B0': 'Violet',
      'c673AB7': 'Violet închis',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Albastru',
      'c03A9F4': 'Albastru deschis',
      'c00BCD4': 'Cyan',
      'c009688': 'Turcoaz',
      'c4CAF50': 'Verde',
      'c8BC34A': 'Verde deschis',
      'cCDDC39': 'Verde lime',
      'cFFEB3B': 'Galben',
      'cFFC107': 'Chihlimbar',
      'cFF9800': 'Portocaliu',
      'cFF5722': 'Portocaliu închis',
      'c795548': 'Maro',
      'c9E9E9E': 'Gri',
      'c607D8B': 'Gri-albastru',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Micșorează spațierea cuvintelor';

  @override
  String get decrement_letter_spacing => 'Micșorează spațierea literelor';

  @override
  String get decrement_line_height => 'Micșorează înălțimea liniei';

  @override
  String get decrement_text_scale_factor =>
      'Micșorează factorul de scalare a textului';

  @override
  String get effects => 'Efecte';

  @override
  String get expand_text => 'Extinde textul';

  @override
  String get font_size => 'Dimensiunea fontului';

  @override
  String get increase_or_decrease_word_spacing =>
      'Mărește sau micșorează spațierea cuvintelor';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Mărește sau micșorează spațierea literelor';

  @override
  String get increase_or_decrease_line_height =>
      'Mărește sau micșorează înălțimea liniei';

  @override
  String get increase_or_decrease_text_size =>
      'Mărește sau micșorează dimensiunea textului';

  @override
  String get increment_word_spacing => 'Mărește spațierea cuvintelor';

  @override
  String get increment_letter_spacing => 'Mărește spațierea literelor';

  @override
  String get increment_line_height => 'Mărește înălțimea liniei';

  @override
  String get increment_text_scale_factor =>
      'Mărește factorul de scalare a textului';

  @override
  String get less_info => 'Ascunde informații';

  @override
  String get letter_spacing => 'Spațierea literelor';

  @override
  String get line_height => 'Înălțimea liniei';

  @override
  String get more_info => 'Arată informații';

  @override
  String get read_less => 'Citește mai puțin';

  @override
  String get read_more => 'Citește mai mult';

  @override
  String get reduce_effects => 'Reduce efectele pe ecran';

  @override
  String get reduce_text => 'Reduce textul';

  @override
  String get restore_settings => 'Restaurează setările';

  @override
  String get restore_main_color => 'Restaurează culoarea principală';

  @override
  String get return_to_main_colors => 'Revino la culorile principale';

  @override
  String get settings => 'Setări';

  @override
  String get size_and_text_display => 'Dimensiune și afișare text';

  @override
  String get slider_word_spacing => 'Glisor pentru spațierea cuvintelor';

  @override
  String get slider_letter_spacing => 'Glisor pentru spațierea literelor';

  @override
  String get slider_line_height => 'Glisor pentru înălțimea liniei';

  @override
  String get theme_mode => 'Temă';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil de temă nerecunoscut',
      'seizureSafe': 'Sigur pentru epilepsie',
      'visionImpaired': 'Deficiență de vedere',
      'adhdFriendly': 'Prietenos pentru ADHD',
      'none': 'Implicit',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profil sigur pentru epilepsie';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Elimină reflexiile și reduce culoarea';

  @override
  String get theme_profile_seizure_safe_description =>
      'Acest profil permite utilizatorilor care au epilepsie și sunt în risc de convulsii să navigheze în siguranță, eliminând riscul convulsiilor care rezultă din animații intermitente și combinații de culori riscante.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil pentru deficiențe de vedere';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Îmbunătățește vizibilitatea aplicației';

  @override
  String get theme_profile_vision_impaired_description =>
      'Acest profil adaptează aplicația pentru a fi accesibilă majorității deficiențelor vizuale, cum ar fi deficiența de vedere, vederea de tunel, cataracta, glaucomul și altele.';

  @override
  String get theme_profile_adhd_friendly_title =>
      'Profil prietenos pentru ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mai multă concentrare și mai puține distracții';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Acest profil reduce semnificativ distracțiile, pentru a ajuta persoanele cu ADHD și tulburări de neurodezvoltare să navigheze, să citească și să se concentreze pe elementele esențiale ale aplicației mai ușor.';

  @override
  String get the_settings_have_been_reset => 'Setările au fost resetate.';

  @override
  String get toggle_dark_mode => 'Comută modul întunecat';

  @override
  String get toggle_effects_mode => 'Comută modul de efecte';

  @override
  String get toggle_font_weight => 'Comută grosimea fontului';

  @override
  String get toggle_theme_profile => 'Comută profilul de temă';

  @override
  String get word_spacing => 'Spațierea cuvintelor';
}
