// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AccessibilityLocalizationsEs extends AccessibilityLocalizations {
  AccessibilityLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get accessibility => 'Accesibilidad';

  @override
  String get accessibility_settings => 'Configuración de accesibilidad';

  @override
  String get adjust_background_colors => 'Ajustar colores de fondo';

  @override
  String get adjust_text_colors => 'Ajustar colores de texto';

  @override
  String get align_center => 'Alineación central';

  @override
  String get align_left => 'Alineación izquierda';

  @override
  String get align_right => 'Alineación derecha';

  @override
  String get bold_text => 'Texto en negrita';

  @override
  String get change_bold_text => 'Cambiar texto en negrita';

  @override
  String get change_pages_background_color =>
      'Cambiar el color de fondo de las páginas a: ';

  @override
  String get change_text_color => 'Cambiar el color del texto a: ';

  @override
  String get change_text_color_shade => 'Cambiar el tono del color a: ';

  @override
  String get color_adjustment => 'Ajuste de color';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Baja saturación',
      'normal': 'Normal',
      'highSaturation': 'Alta saturación',
      'monochrome': 'Monocromo',
      'highContrast': 'Alto contraste',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'El perfil de color actual es: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Color no reconocido',
      'cF44336': 'Rojo',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Púrpura',
      'c673AB7': 'Púrpura oscuro',
      'c3F51B5': 'Índigo',
      'c2196F3': 'Azul',
      'c03A9F4': 'Azul claro',
      'c00BCD4': 'Cian',
      'c009688': 'Verde azulado',
      'c4CAF50': 'Verde',
      'c8BC34A': 'Verde claro',
      'cCDDC39': 'Lima',
      'cFFEB3B': 'Amarillo',
      'cFFC107': 'Ámbar',
      'cFF9800': 'Naranja',
      'cFF5722': 'Naranja oscuro',
      'c795548': 'Marrón',
      'c9E9E9E': 'Gris',
      'c607D8B': 'Azul grisáceo',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Reducir espacio entre palabras';

  @override
  String get decrement_letter_spacing => 'Reducir espacio entre letras';

  @override
  String get decrement_line_height => 'Reducir altura de línea';

  @override
  String get decrement_text_scale_factor => 'Reducir factor de escala de texto';

  @override
  String get effects => 'Efectos';

  @override
  String get expand_text => 'Expandir texto';

  @override
  String get font_size => 'Tamaño de fuente';

  @override
  String get increase_or_decrease_word_spacing =>
      'Aumentar o reducir espacio entre palabras';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Aumentar o reducir espacio entre letras';

  @override
  String get increase_or_decrease_line_height =>
      'Aumentar o reducir altura de línea';

  @override
  String get increase_or_decrease_text_size =>
      'Aumentar o reducir tamaño de texto';

  @override
  String get increment_word_spacing => 'Aumentar espacio entre palabras';

  @override
  String get increment_letter_spacing => 'Aumentar espacio entre letras';

  @override
  String get increment_line_height => 'Aumentar altura de línea';

  @override
  String get increment_text_scale_factor =>
      'Aumentar factor de escala de texto';

  @override
  String get less_info => 'Ocultar información';

  @override
  String get letter_spacing => 'Espacio entre letras';

  @override
  String get line_height => 'Altura de línea';

  @override
  String get more_info => 'Mostrar información';

  @override
  String get read_less => 'Leer menos';

  @override
  String get read_more => 'Leer más';

  @override
  String get reduce_effects => 'Reducir efectos de pantalla';

  @override
  String get reduce_text => 'Reducir texto';

  @override
  String get restore_settings => 'Restaurar configuración';

  @override
  String get restore_main_color => 'Restaurar color principal';

  @override
  String get return_to_main_colors => 'Volver a colores principales';

  @override
  String get settings => 'Configuración';

  @override
  String get size_and_text_display => 'Tamaño y visualización de texto';

  @override
  String get slider_word_spacing => 'Deslizador de espacio entre palabras';

  @override
  String get slider_letter_spacing => 'Deslizador de espacio entre letras';

  @override
  String get slider_line_height => 'Deslizador de altura de línea';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Perfil de tema no reconocido',
      'seizureSafe': 'Seguro para epilepsia',
      'visionImpaired': 'Problemas de visión',
      'adhdFriendly': 'Amigable para TDAH',
      'none': 'Predeterminado',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Perfil seguro para epilepsia';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Eliminar reflejos y reducir color';

  @override
  String get theme_profile_seizure_safe_description =>
      'Este perfil permite a los usuarios con epilepsia y en riesgo de convulsiones navegar de forma segura eliminando el riesgo de convulsiones causadas por animaciones intermitentes y combinaciones de colores riesgosas.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Perfil para problemas de visión';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Mejorar visibilidad de la aplicación';

  @override
  String get theme_profile_vision_impaired_description =>
      'Este perfil adapta la aplicación para que sea accesible para la mayoría de las discapacidades visuales, como visión reducida, visión en túnel, cataratas, glaucoma y más.';

  @override
  String get theme_profile_adhd_friendly_title => 'Perfil amigable para TDAH';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Más concentración y menos distracciones';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Este perfil reduce significativamente las distracciones, para ayudar a las personas con TDAH y trastornos del neurodesarrollo a navegar, leer y concentrarse en los elementos esenciales de la aplicación con mayor facilidad.';

  @override
  String get the_settings_have_been_reset =>
      'La configuración ha sido restablecida.';

  @override
  String get toggle_dark_mode => 'Alternar modo oscuro';

  @override
  String get toggle_effects_mode => 'Alternar modo de efectos';

  @override
  String get toggle_font_weight => 'Alternar grosor de fuente';

  @override
  String get toggle_theme_profile => 'Alternar perfil de tema';

  @override
  String get word_spacing => 'Espacio entre palabras';
}
