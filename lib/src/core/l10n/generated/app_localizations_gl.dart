// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AccessibilityLocalizationsGl extends AccessibilityLocalizations {
  AccessibilityLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get accessibility => 'Accesibilidade';

  @override
  String get accessibility_settings => 'Configuración de accesibilidade';

  @override
  String get adjust_background_colors => 'Axustar as cores de fondo';

  @override
  String get adjust_text_colors => 'Axustar as cores do texto';

  @override
  String get align_center => 'Alinear ao centro';

  @override
  String get align_left => 'Alinear á esquerda';

  @override
  String get align_right => 'Alinear á dereita';

  @override
  String get bold_text => 'Texto en negriña';

  @override
  String get change_bold_text => 'Cambiar texto en negriña';

  @override
  String get change_pages_background_color =>
      'Cambiar a cor de fondo das páxinas a: ';

  @override
  String get change_text_color => 'Cambiar a cor do texto a: ';

  @override
  String get change_text_color_shade => 'Cambiar a tonalidade da cor a: ';

  @override
  String get color_adjustment => 'Axuste de cor';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Baixa saturación',
      'normal': 'Normal',
      'highSaturation': 'Alta saturación',
      'monochrome': 'Monocromático',
      'highContrast': 'Alto contraste',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'O perfil de cor actual é: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Cor non recoñecida',
      'cF44336': 'Vermello',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Lila',
      'c673AB7': 'Lila intenso',
      'c3F51B5': 'Añil',
      'c2196F3': 'Azul',
      'c03A9F4': 'Azul claro',
      'c00BCD4': 'Cian',
      'c009688': 'Verde azulado',
      'c4CAF50': 'Verde',
      'c8BC34A': 'Verde claro',
      'cCDDC39': 'Verde lima',
      'cFFEB3B': 'Amarelo',
      'cFFC107': 'Ámbar',
      'cFF9800': 'Laranxa',
      'cFF5722': 'Laranxa intenso',
      'c795548': 'Marrón',
      'c9E9E9E': 'Gris',
      'c607D8B': 'Gris azulado',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Diminuir o espazamento entre palabras';

  @override
  String get decrement_letter_spacing => 'Diminuir o espazamento entre letras';

  @override
  String get decrement_line_height => 'Diminuir a altura da liña';

  @override
  String get decrement_text_scale_factor =>
      'Diminuir o factor de escala do texto';

  @override
  String get effects => 'Efectos';

  @override
  String get expand_text => 'Expandir texto';

  @override
  String get font_size => 'Tamaño da fonte';

  @override
  String get increase_or_decrease_word_spacing =>
      'Aumentar ou diminuir o espazamento entre palabras';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Aumentar ou diminuir o espazamento entre letras';

  @override
  String get increase_or_decrease_line_height =>
      'Aumentar ou diminuir a altura da liña';

  @override
  String get increase_or_decrease_text_size =>
      'Aumentar ou diminuir o tamaño do texto';

  @override
  String get increment_word_spacing => 'Aumentar o espazamento entre palabras';

  @override
  String get increment_letter_spacing => 'Aumentar o espazamento entre letras';

  @override
  String get increment_line_height => 'Aumentar a altura da liña';

  @override
  String get increment_text_scale_factor =>
      'Aumentar o factor de escala do texto';

  @override
  String get less_info => 'Ocultar información';

  @override
  String get letter_spacing => 'Espazamento entre letras';

  @override
  String get line_height => 'Altura da liña';

  @override
  String get more_info => 'Amosar información';

  @override
  String get read_less => 'Ler menos';

  @override
  String get read_more => 'Ler máis';

  @override
  String get reduce_effects => 'Reducir os efectos na pantalla';

  @override
  String get reduce_text => 'Reducir texto';

  @override
  String get restore_settings => 'Restaurar configuración';

  @override
  String get restore_main_color => 'Restaurar cor principal';

  @override
  String get return_to_main_colors => 'Volver ás cores principais';

  @override
  String get settings => 'Configuración';

  @override
  String get size_and_text_display => 'Tamaño e visualización do texto';

  @override
  String get slider_word_spacing =>
      'Control deslizante de espazamento entre palabras';

  @override
  String get slider_letter_spacing =>
      'Control deslizante de espazamento entre letras';

  @override
  String get slider_line_height => 'Control deslizante de altura da liña';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Perfil de tema non recoñecido',
      'seizureSafe': 'Seguro para epilepsia',
      'visionImpaired': 'Deficiencia visual',
      'adhdFriendly': 'Adaptado para TDAH',
      'none': 'Predeterminado',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Perfil seguro para epilepsia';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Eliminar reflexos e reducir cor';

  @override
  String get theme_profile_seizure_safe_description =>
      'Este perfil permite aos usuarios con epilepsia e en risco de sufrir convulsións navegar de forma segura ao eliminar o risco de convulsións que resultan de animacións parpadeantes e combinacións de cores arriscadas.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Perfil para deficiencia visual';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Mellorar a visibilidade da aplicación';

  @override
  String get theme_profile_vision_impaired_description =>
      'Este perfil adapta a aplicación para que sexa accesible á maioría das deficiencias visuais, como a discapacidade visual, a visión en túnel, as cataratas, o glaucoma e máis.';

  @override
  String get theme_profile_adhd_friendly_title => 'Perfil adaptado para TDAH';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Máis concentración e menos distraccións';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Este perfil reduce significativamente as distraccións, para axudar ás persoas con TDAH e trastornos do desenvolvemento neurolóxico a navegar, ler e centrarse máis facilmente nos elementos esenciais da aplicación.';

  @override
  String get the_settings_have_been_reset =>
      'A configuración foi restablecida.';

  @override
  String get toggle_dark_mode => 'Alternar modo escuro';

  @override
  String get toggle_effects_mode => 'Alternar modo de efectos';

  @override
  String get toggle_font_weight => 'Alternar o grosor da fonte';

  @override
  String get toggle_theme_profile => 'Alternar perfil de tema';

  @override
  String get word_spacing => 'Espazamento entre palabras';
}
