// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AccessibilityLocalizationsCa extends AccessibilityLocalizations {
  AccessibilityLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get accessibility => 'Accessibilitat';

  @override
  String get accessibility_settings => 'Configuració d\'accessibilitat';

  @override
  String get adjust_background_colors => 'Ajustar colors de fons';

  @override
  String get adjust_text_colors => 'Ajustar colors del text';

  @override
  String get align_center => 'Alineació al centre';

  @override
  String get align_left => 'Alineació a l\'esquerra';

  @override
  String get align_right => 'Alineació a la dreta';

  @override
  String get bold_text => 'Text en negreta';

  @override
  String get change_bold_text => 'Canviar text en negreta';

  @override
  String get change_pages_background_color =>
      'Canviar el color de fons de les pàgines a: ';

  @override
  String get change_text_color => 'Canviar el color del text a: ';

  @override
  String get change_text_color_shade => 'Canviar el to del color a: ';

  @override
  String get color_adjustment => 'Ajustament de color';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Baixa saturació',
        'normal': 'Normal',
        'highSaturation': 'Alta saturació',
        'monochrome': 'Monocrom',
        'highContrast': 'Alt contrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'El perfil de color actual és: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Color no reconegut',
        'cF44336': 'Vermell',
        'cE91E63': 'Rosa',
        'c9C27B0': 'Lila',
        'c673AB7': 'Lila fosc',
        'c3F51B5': 'Indi',
        'c2196F3': 'Blau',
        'c03A9F4': 'Blau clar',
        'c00BCD4': 'Cian',
        'c009688': 'Turquesa',
        'c4CAF50': 'Verd',
        'c8BC34A': 'Verd clar',
        'cCDDC39': 'Llima',
        'cFFEB3B': 'Groc',
        'cFFC107': 'Àmbar',
        'cFF9800': 'Taronja',
        'cFF5722': 'Taronja fosc',
        'c795548': 'Marró',
        'c9E9E9E': 'Gris',
        'c607D8B': 'Gris blavós',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Disminuir espai entre paraules';

  @override
  String get decrement_letter_spacing => 'Disminuir espai entre lletres';

  @override
  String get decrement_line_height => 'Disminuir alçada de línia';

  @override
  String get decrement_text_scale_factor =>
      'Disminuir factor d\'escala de text';

  @override
  String get effects => 'Efectes';

  @override
  String get expand_text => 'Expandir text';

  @override
  String get font_size => 'Mida de la font';

  @override
  String get increase_or_decrease_word_spacing =>
      'Augmentar o disminuir espai entre paraules';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Augmentar o disminuir espai entre lletres';

  @override
  String get increase_or_decrease_line_height =>
      'Augmentar o disminuir alçada de línia';

  @override
  String get increase_or_decrease_text_size =>
      'Augmentar o disminuir la mida del text';

  @override
  String get increment_word_spacing => 'Augmentar espai entre paraules';

  @override
  String get increment_letter_spacing => 'Augmentar espai entre lletres';

  @override
  String get increment_line_height => 'Augmentar alçada de línia';

  @override
  String get increment_text_scale_factor =>
      'Augmentar factor d\'escala de text';

  @override
  String get less_info => 'Amagar informació';

  @override
  String get letter_spacing => 'Espai entre lletres';

  @override
  String get line_height => 'Alçada de línia';

  @override
  String get more_info => 'Mostrar informació';

  @override
  String get read_less => 'Llegir menys';

  @override
  String get read_more => 'Llegir més';

  @override
  String get reduce_effects => 'Reduir efectes a la pantalla';

  @override
  String get reduce_text => 'Reduir text';

  @override
  String get restore_settings => 'Restaurar configuració';

  @override
  String get restore_main_color => 'Restaurar color principal';

  @override
  String get return_to_main_colors => 'Tornar als colors principals';

  @override
  String get settings => 'Configuració';

  @override
  String get size_and_text_display => 'Mida i visualització del text';

  @override
  String get slider_word_spacing => 'Control lliscant d\'espai entre paraules';

  @override
  String get slider_letter_spacing => 'Control lliscant d\'espai entre lletres';

  @override
  String get slider_line_height => 'Control lliscant d\'alçada de línia';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Perfil de tema no reconegut',
        'seizureSafe': 'Segur per a epilepsia',
        'visionImpaired': 'Visió reduïda',
        'adhdFriendly': 'Favorable per a TDAH',
        'none': 'Predeterminat',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Perfil segur per a epilepsia';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Eliminar reflexos i reduir color';

  @override
  String get theme_profile_seizure_safe_description =>
      'Aquest perfil permet als usuaris amb epilepsia i amb risc de patir convulsions navegar de manera segura eliminant el risc de convulsions provocades per animacions parpellejants i combinacions de colors arriscades.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Perfil per a visió reduïda';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Millorar la visibilitat de l\'aplicació';

  @override
  String get theme_profile_vision_impaired_description =>
      'Aquest perfil adapta l\'aplicació perquè sigui accessible a la majoria de deficiències visuals, com ara discapacitat visual, visió de túnel, cataractes, glaucoma i més.';

  @override
  String get theme_profile_adhd_friendly_title => 'Perfil favorable per a TDAH';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Més concentració i menys distraccions';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Aquest perfil redueix significativament les distraccions, per ajudar les persones amb TDAH i trastorns del neurodesenvolupament a navegar, llegir i centrar-se en els elements essencials de l\'aplicació amb més facilitat.';

  @override
  String get the_settings_have_been_reset =>
      'S\'ha restablert la configuració.';

  @override
  String get toggle_dark_mode => 'Activar/desactivar mode fosc';

  @override
  String get toggle_effects_mode => 'Activar/desactivar mode d\'efectes';

  @override
  String get toggle_font_weight => 'Activar/desactivar pes de la font';

  @override
  String get toggle_theme_profile => 'Activar/desactivar perfil de tema';

  @override
  String get word_spacing => 'Espai entre paraules';
}
