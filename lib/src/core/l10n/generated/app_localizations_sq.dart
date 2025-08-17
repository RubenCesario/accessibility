// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AccessibilityLocalizationsSq extends AccessibilityLocalizations {
  AccessibilityLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get accessibility => 'Aksesueshmëria';

  @override
  String get accessibility_settings => 'Cilësimet e aksesueshmërisë';

  @override
  String get adjust_background_colors => 'Rregullo ngjyrat e sfondit';

  @override
  String get adjust_text_colors => 'Rregullo ngjyrat e tekstit';

  @override
  String get align_center => 'Qendërzo';

  @override
  String get align_left => 'Vendos majtas';

  @override
  String get align_right => 'Vendos djathtas';

  @override
  String get bold_text => 'Tekst i trashë';

  @override
  String get change_bold_text => 'Ndrysho trashësinë e tekstit';

  @override
  String get change_pages_background_color =>
      'Ndrysho ngjyrën e sfondit të faqeve në: ';

  @override
  String get change_text_color => 'Ndrysho ngjyrën e tekstit në: ';

  @override
  String get change_text_color_shade => 'Ndrysho nuancën e ngjyrës në: ';

  @override
  String get color_adjustment => 'Rregullimi i ngjyrave';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Ngopje e ulët',
      'normal': 'Normal',
      'highSaturation': 'Ngopje e lartë',
      'monochrome': 'Monokromatike',
      'highContrast': 'Kontrast i lartë',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Profili aktual i ngjyrave është: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Ngjyra nuk njihet',
      'cF44336': 'E kuqe',
      'cE91E63': 'Rozë',
      'c9C27B0': 'Vjollcë',
      'c673AB7': 'Vjollcë e errët',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blu',
      'c03A9F4': 'Blu e çelët',
      'c00BCD4': 'Cian',
      'c009688': 'Blu e gjelbër',
      'c4CAF50': 'E gjelbrë',
      'c8BC34A': 'E gjelbrë e çelët',
      'cCDDC39': 'Limë',
      'cFFEB3B': 'E verdhë',
      'cFFC107': 'Qelibar',
      'cFF9800': 'Portokalli',
      'cFF5722': 'Portokalli e errët',
      'c795548': 'Kafe',
      'c9E9E9E': 'Gri',
      'c607D8B': 'Blu gri',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Zvogëlo hapësirën mes fjalëve';

  @override
  String get decrement_letter_spacing => 'Zvogëlo hapësirën mes shkronjave';

  @override
  String get decrement_line_height => 'Zvogëlo lartësinë e rreshtit';

  @override
  String get decrement_text_scale_factor =>
      'Zvogëlo faktorin e shkallëzimit të tekstit';

  @override
  String get effects => 'Efektet';

  @override
  String get expand_text => 'Zgjero tekstin';

  @override
  String get font_size => 'Madhësia e shkrimit';

  @override
  String get increase_or_decrease_word_spacing =>
      'Rrit ose zvogëlo hapësirën mes fjalëve';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Rrit ose zvogëlo hapësirën mes shkronjave';

  @override
  String get increase_or_decrease_line_height =>
      'Rrit ose zvogëlo lartësinë e rreshtit';

  @override
  String get increase_or_decrease_text_size =>
      'Rrit ose zvogëlo madhësinë e tekstit';

  @override
  String get increment_word_spacing => 'Rrit hapësirën mes fjalëve';

  @override
  String get increment_letter_spacing => 'Rrit hapësirën mes shkronjave';

  @override
  String get increment_line_height => 'Rrit lartësinë e rreshtit';

  @override
  String get increment_text_scale_factor =>
      'Rrit faktorin e shkallëzimit të tekstit';

  @override
  String get less_info => 'Fshih informacionin';

  @override
  String get letter_spacing => 'Hapësira mes shkronjave';

  @override
  String get line_height => 'Lartësia e rreshtit';

  @override
  String get more_info => 'Shfaq informacionin';

  @override
  String get read_less => 'Lexo më pak';

  @override
  String get read_more => 'Lexo më shumë';

  @override
  String get reduce_effects => 'Redukto efektet në ekran';

  @override
  String get reduce_text => 'Zvogëlo tekstin';

  @override
  String get restore_settings => 'Rikthe cilësimet';

  @override
  String get restore_main_color => 'Rikthe ngjyrën kryesore';

  @override
  String get return_to_main_colors => 'Kthehu te ngjyrat kryesore';

  @override
  String get settings => 'Cilësimet';

  @override
  String get size_and_text_display => 'Madhësia dhe shfaqja e tekstit';

  @override
  String get slider_word_spacing => 'Rrëshqitësi i hapësirës mes fjalëve';

  @override
  String get slider_letter_spacing => 'Rrëshqitësi i hapësirës mes shkronjave';

  @override
  String get slider_line_height => 'Rrëshqitësi i lartësisë së rreshtit';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profili i temës nuk njihet',
      'seizureSafe': 'I sigurt për epilepsi',
      'visionImpaired': 'Për shikim të dëmtuar',
      'adhdFriendly': 'Miqsor për ADHD',
      'none': 'Parazgjedhur',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Profil i sigurt për epilepsi';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Hiq reflektimet dhe redukto ngjyrat';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ky profil u mundeson përdoruesve që kanë epilepsi dhe janë në rrezik për kriza të shfletojnë në mënyrë të sigurt duke eliminuar rrezikun e krizave që vijnë nga animacionet vezulluese dhe kombinimet e rrezikshme të ngjyrave.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil për shikim të dëmtuar';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Përmirso dukshmerinë e aplikacionit';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ky profil përshtat aplikacionin që të jetë i aksesueshëm për shumë dëmtime të shikimit, si dëmtimi i shikimit, shikimi tunel, katarakti, glaukoma dhe më shumë.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil miqsor për ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Më shumë përqendrim dhe më pak shpërqendrime';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ky profil redukton në mënyrë të konsiderueshme shpërqendrimet, për të ndihmuar njerëzit me ADHD dhe çrregullime neurozhvillimore të navigojnë, lexojnë dhe të përqendrohen më lehtë në elementet thelbsore të aplikacionit.';

  @override
  String get the_settings_have_been_reset => 'Cilësimet janë rivendosur.';

  @override
  String get toggle_dark_mode => 'Ndryshoni modalitetin e errët';

  @override
  String get toggle_effects_mode => 'Ndryshoni modalitetin e efekteve';

  @override
  String get toggle_font_weight => 'Ndryshoni trashësinë e shkrimit';

  @override
  String get toggle_theme_profile => 'Ndryshoni profilin e temës';

  @override
  String get word_spacing => 'Hapësira mes fjalëve';
}
