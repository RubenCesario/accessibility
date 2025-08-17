// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AccessibilityLocalizationsLv extends AccessibilityLocalizations {
  AccessibilityLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get accessibility => 'Pieejamība';

  @override
  String get accessibility_settings => 'Pieejamības iestatījumi';

  @override
  String get adjust_background_colors => 'Pielāgot fona krāsas';

  @override
  String get adjust_text_colors => 'Pielāgot teksta krāsas';

  @override
  String get align_center => 'Līdzināt centrā';

  @override
  String get align_left => 'Līdzināt pa kreisi';

  @override
  String get align_right => 'Līdzināt pa labi';

  @override
  String get bold_text => 'Treknraksts';

  @override
  String get change_bold_text => 'Mainīt teksta treknumu';

  @override
  String get change_pages_background_color => 'Mainīt lapu fona krāsu uz: ';

  @override
  String get change_text_color => 'Mainīt teksta krāsu uz: ';

  @override
  String get change_text_color_shade => 'Mainīt krāsas toni uz: ';

  @override
  String get color_adjustment => 'Krāsu pielāgošana';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normāls',
      'lowSaturation': 'Zems piesātinājums',
      'normal': 'Normāls',
      'highSaturation': 'Augsts piesātinājums',
      'monochrome': 'Melnbalts',
      'highContrast': 'Augsts kontrasts',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Pašreizējais krāsu profils ir: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Krāsa nav atpazīta',
      'cF44336': 'Sarkana',
      'cE91E63': 'Rozā',
      'c9C27B0': 'Violeta',
      'c673AB7': 'Tumši violeta',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Zila',
      'c03A9F4': 'Gaiši zila',
      'c00BCD4': 'Ciāna',
      'c009688': 'Zilganzaļa',
      'c4CAF50': 'Zaļa',
      'c8BC34A': 'Gaiši zaļa',
      'cCDDC39': 'Laima',
      'cFFEB3B': 'Dzeltena',
      'cFFC107': 'Dzintara',
      'cFF9800': 'Oranža',
      'cFF5722': 'Tumši oranža',
      'c795548': 'Brūna',
      'c9E9E9E': 'Pelēka',
      'c607D8B': 'Zilpelēka',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Samazināt vārdu atstarpi';

  @override
  String get decrement_letter_spacing => 'Samazināt burtu atstarpi';

  @override
  String get decrement_line_height => 'Samazināt rindu augstumu';

  @override
  String get decrement_text_scale_factor =>
      'Samazināt teksta mēroga koeficientu';

  @override
  String get effects => 'Efekti';

  @override
  String get expand_text => 'Izvērst tekstu';

  @override
  String get font_size => 'Fonta izmērs';

  @override
  String get increase_or_decrease_word_spacing =>
      'Palielināt vai samazināt vārdu atstarpi';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Palielināt vai samazināt burtu atstarpi';

  @override
  String get increase_or_decrease_line_height =>
      'Palielināt vai samazināt rindu augstumu';

  @override
  String get increase_or_decrease_text_size =>
      'Palielināt vai samazināt teksta izmēru';

  @override
  String get increment_word_spacing => 'Palielināt vārdu atstarpi';

  @override
  String get increment_letter_spacing => 'Palielināt burtu atstarpi';

  @override
  String get increment_line_height => 'Palielināt rindu augstumu';

  @override
  String get increment_text_scale_factor =>
      'Palielināt teksta mēroga koeficientu';

  @override
  String get less_info => 'Slēpt informāciju';

  @override
  String get letter_spacing => 'Burtu atstarpe';

  @override
  String get line_height => 'Rindu augstums';

  @override
  String get more_info => 'Rādīt informāciju';

  @override
  String get read_less => 'Lasīt mazāk';

  @override
  String get read_more => 'Lasīt vairāk';

  @override
  String get reduce_effects => 'Samazināt ekrāna efektus';

  @override
  String get reduce_text => 'Samazināt tekstu';

  @override
  String get restore_settings => 'Atjaunot iestatījumus';

  @override
  String get restore_main_color => 'Atjaunot galveno krāsu';

  @override
  String get return_to_main_colors => 'Atgriezties pie galvenajām krāsām';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get size_and_text_display => 'Izmērs un teksta attēlojums';

  @override
  String get slider_word_spacing => 'Vārdu atstarpes slīdnis';

  @override
  String get slider_letter_spacing => 'Burtu atstarpes slīdnis';

  @override
  String get slider_line_height => 'Rindu augstuma slīdnis';

  @override
  String get theme_mode => 'Tēma';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Tēmas profils nav atpazīts',
      'seizureSafe': 'Drošs pret lēkmēm',
      'visionImpaired': 'Redzes traucējumi',
      'adhdFriendly': 'ADHD draudzīgs',
      'none': 'Noklusējuma',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Drošs pret lēkmēm profils';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Novērst atspīdēšanos un samazināt krāsas';

  @override
  String get theme_profile_seizure_safe_description =>
      'Šis profils ļauj lietotājiem, kuriem ir epilepsija un lēkmju risks, pārlūkot droši, novēršot lēkmju risku, ko izraisa mirgošana, animācijas un riskantās krāsu kombinācijas.';

  @override
  String get theme_profile_vision_impaired_title => 'Vājredzīgo profils';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Uzlabot lietotnes redzamību';

  @override
  String get theme_profile_vision_impaired_description =>
      'Šis profils pielāgo lietotni, lai tā būtu pieejama vairākumam redzes traucējumu, piemēram, vājredzībai, tuneļa redzes, kataraktas, glaukomas un citu redzes problēmu gadījumos.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD draudzīgs profils';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Lielāka koncentrācija un mazāk novēršanās iespēju';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Šis profils ievērojami samazina uzmanības novēršanas faktorus, palīdzot cilvēkiem ar ADHD un neiroattīstības traucējumiem vieglāk pārlūkot, lasīt un koncentrēties uz būtiskajiem lietotnes elementiem.';

  @override
  String get the_settings_have_been_reset => 'Iestatījumi ir atiestatīti.';

  @override
  String get toggle_dark_mode => 'Pārslēgt tumšo režīmu';

  @override
  String get toggle_effects_mode => 'Pārslēgt efektu režīmu';

  @override
  String get toggle_font_weight => 'Pārslēgt fonta biezumu';

  @override
  String get toggle_theme_profile => 'Pārslēgt tēmas profilu';

  @override
  String get word_spacing => 'Vārdu atstarpe';
}
