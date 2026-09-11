// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AccessibilityLocalizationsEs extends AccessibilityLocalizations {
  AccessibilityLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get accessibility => 'Accesibilidad';

  @override
  String get accessibilitySettings => 'Configuración de accesibilidad';

  @override
  String get adjustBackgroundColors => 'Ajustar colores de fondo';

  @override
  String get adjustTextColors => 'Ajustar colores de texto';

  @override
  String get alignCenter => 'Alineación central';

  @override
  String get alignLeft => 'Alineación izquierda';

  @override
  String get alignRight => 'Alineación derecha';

  @override
  String get textAlignment => 'Alineación del texto';

  @override
  String get boldText => 'Texto en negrita';

  @override
  String get changeBoldText => 'Cambiar texto en negrita';

  @override
  String get changePagesBackgroundColor =>
      'Cambiar el color de fondo de las páginas a: ';

  @override
  String get changeTextColor => 'Cambiar el color del texto a: ';

  @override
  String get changeTextColorShade => 'Cambiar el tono del color a: ';

  @override
  String get colorAdjustment => 'Ajuste de color';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => 'El perfil de color actual es: ';

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
  String get decrementWordSpacing => 'Reducir espacio entre palabras';

  @override
  String get decrementLetterSpacing => 'Reducir espacio entre letras';

  @override
  String get decrementLineHeight => 'Reducir altura de línea';

  @override
  String get decrementTextScaleFactor => 'Reducir factor de escala de texto';

  @override
  String get effects => 'Efectos';

  @override
  String get expandText => 'Expandir texto';

  @override
  String get fontSize => 'Tamaño de fuente';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Aumentar o reducir espacio entre palabras';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Aumentar o reducir espacio entre letras';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Aumentar o reducir altura de línea';

  @override
  String get increaseOrDecreaseTextSize => 'Aumentar o reducir tamaño de texto';

  @override
  String get incrementWordSpacing => 'Aumentar espacio entre palabras';

  @override
  String get incrementLetterSpacing => 'Aumentar espacio entre letras';

  @override
  String get incrementLineHeight => 'Aumentar altura de línea';

  @override
  String get incrementTextScaleFactor => 'Aumentar factor de escala de texto';

  @override
  String get lessInfo => 'Ocultar información';

  @override
  String get letterSpacing => 'Espacio entre letras';

  @override
  String get lineHeight => 'Altura de línea';

  @override
  String get moreInfo => 'Mostrar información';

  @override
  String get readLess => 'Leer menos';

  @override
  String get readMore => 'Leer más';

  @override
  String get reduceEffects => 'Reducir efectos de pantalla';

  @override
  String get reduceText => 'Reducir texto';

  @override
  String get restoreSettings => 'Restaurar configuración';

  @override
  String get restoreMainColor => 'Restaurar color principal';

  @override
  String get returnToMainColors => 'Volver a colores principales';

  @override
  String get settings => 'Configuración';

  @override
  String get sizeAndTextDisplay => 'Tamaño y visualización de texto';

  @override
  String get sliderWordSpacing => 'Deslizador de espacio entre palabras';

  @override
  String get sliderLetterSpacing => 'Deslizador de espacio entre letras';

  @override
  String get sliderLineHeight => 'Deslizador de altura de línea';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Perfil de tema no reconocido',
      'seizureSafe': 'Seguro para epilepsia',
      'visionImpaired': 'Problemas de visión',
      'adhdFriendly': 'Amigable para TDAH',
      'none': 'Perfil predeterminado',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Perfil seguro para epilepsia';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Eliminar reflejos y reducir color';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Este perfil permite a los usuarios con epilepsia y en riesgo de convulsiones navegar de forma segura eliminando el riesgo de convulsiones causadas por animaciones intermitentes y combinaciones de colores riesgosas.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Perfil para problemas de visión';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Mejorar visibilidad de la aplicación';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Este perfil adapta la aplicación para que sea accesible para la mayoría de las discapacidades visuales, como visión reducida, visión en túnel, cataratas, glaucoma y más.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Perfil amigable para TDAH';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Más concentración y menos distracciones';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Este perfil reduce significativamente las distracciones, para ayudar a las personas con TDAH y trastornos del neurodesarrollo a navegar, leer y concentrarse en los elementos esenciales de la aplicación con mayor facilidad.';

  @override
  String get theSettingsHaveBeenReset =>
      'La configuración ha sido restablecida.';

  @override
  String get toggleDarkMode => 'Alternar modo oscuro';

  @override
  String get toggleEffectsMode => 'Alternar modo de efectos';

  @override
  String get toggleFontWeight => 'Alternar grosor de fuente';

  @override
  String get toggleThemeProfile => 'Alternar perfil de tema';

  @override
  String get wordSpacing => 'Espacio entre palabras';

  @override
  String get accessibleFont => 'Fuente accesible';

  @override
  String get accessibleFontSubtitle =>
      'Usa una fuente accesible para mejor legibilidad';

  @override
  String get accessibleFontEnabled => 'Fuente accesible activada';

  @override
  String get accessibleFontDisabled => 'Fuente accesible desactivada';

  @override
  String get toggleAccessibleFont => 'Alternar fuente accesible';

  @override
  String get settingsLoading => 'Cargando la configuración de accesibilidad…';

  @override
  String get settingsLoadFailed =>
      'No se pudo cargar la configuración de accesibilidad.';

  @override
  String get retry => 'Reintentar';

  @override
  String get themeModeSystem => 'Sistema';

  @override
  String get themeModeLight => 'Claro';

  @override
  String get themeModeDark => 'Oscuro';

  @override
  String get effectsModeSystem => 'Sistema';

  @override
  String get effectsModeEnabled => 'Activado';

  @override
  String get effectsModeDisabled => 'Desactivado';
}
