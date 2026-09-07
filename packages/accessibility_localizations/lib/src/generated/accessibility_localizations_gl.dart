// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AccessibilityLocalizationsGl extends AccessibilityLocalizations {
  AccessibilityLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get accessibility => 'Accesibilidade';

  @override
  String get accessibilitySettings => 'Configuración de accesibilidade';

  @override
  String get adjustBackgroundColors => 'Axustar as cores de fondo';

  @override
  String get adjustTextColors => 'Axustar as cores do texto';

  @override
  String get alignCenter => 'Alinear ao centro';

  @override
  String get alignLeft => 'Alinear á esquerda';

  @override
  String get alignRight => 'Alinear á dereita';

  @override
  String get textAlignment => 'Aliñación do texto';

  @override
  String get boldText => 'Texto en negriña';

  @override
  String get changeBoldText => 'Cambiar texto en negriña';

  @override
  String get changePagesBackgroundColor =>
      'Cambiar a cor de fondo das páxinas a: ';

  @override
  String get changeTextColor => 'Cambiar a cor do texto a: ';

  @override
  String get changeTextColorShade => 'Cambiar a tonalidade da cor a: ';

  @override
  String get colorAdjustment => 'Axuste de cor';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => 'O perfil de cor actual é: ';

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
  String get decrementWordSpacing => 'Diminuir o espazamento entre palabras';

  @override
  String get decrementLetterSpacing => 'Diminuir o espazamento entre letras';

  @override
  String get decrementLineHeight => 'Diminuir a altura da liña';

  @override
  String get decrementTextScaleFactor => 'Diminuir o factor de escala do texto';

  @override
  String get effects => 'Efectos';

  @override
  String get expandText => 'Expandir texto';

  @override
  String get fontSize => 'Tamaño da fonte';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Aumentar ou diminuir o espazamento entre palabras';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Aumentar ou diminuir o espazamento entre letras';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Aumentar ou diminuir a altura da liña';

  @override
  String get increaseOrDecreaseTextSize =>
      'Aumentar ou diminuir o tamaño do texto';

  @override
  String get incrementWordSpacing => 'Aumentar o espazamento entre palabras';

  @override
  String get incrementLetterSpacing => 'Aumentar o espazamento entre letras';

  @override
  String get incrementLineHeight => 'Aumentar a altura da liña';

  @override
  String get incrementTextScaleFactor => 'Aumentar o factor de escala do texto';

  @override
  String get lessInfo => 'Ocultar información';

  @override
  String get letterSpacing => 'Espazamento entre letras';

  @override
  String get lineHeight => 'Altura da liña';

  @override
  String get moreInfo => 'Amosar información';

  @override
  String get readLess => 'Ler menos';

  @override
  String get readMore => 'Ler máis';

  @override
  String get reduceEffects => 'Reducir os efectos na pantalla';

  @override
  String get reduceText => 'Reducir texto';

  @override
  String get restoreSettings => 'Restaurar configuración';

  @override
  String get restoreMainColor => 'Restaurar cor principal';

  @override
  String get returnToMainColors => 'Volver ás cores principais';

  @override
  String get settings => 'Configuración';

  @override
  String get sizeAndTextDisplay => 'Tamaño e visualización do texto';

  @override
  String get sliderWordSpacing =>
      'Control deslizante de espazamento entre palabras';

  @override
  String get sliderLetterSpacing =>
      'Control deslizante de espazamento entre letras';

  @override
  String get sliderLineHeight => 'Control deslizante de altura da liña';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Perfil de tema non recoñecido',
      'seizureSafe': 'Seguro para epilepsia',
      'visionImpaired': 'Deficiencia visual',
      'adhdFriendly': 'Adaptado para TDAH',
      'none': 'Perfil predeterminado',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Perfil seguro para epilepsia';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Eliminar reflexos e reducir cor';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Este perfil permite aos usuarios con epilepsia e en risco de sufrir convulsións navegar de forma segura ao eliminar o risco de convulsións que resultan de animacións parpadeantes e combinacións de cores arriscadas.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Perfil para deficiencia visual';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Mellorar a visibilidade da aplicación';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Este perfil adapta a aplicación para que sexa accesible á maioría das deficiencias visuais, como a discapacidade visual, a visión en túnel, as cataratas, o glaucoma e máis.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Perfil adaptado para TDAH';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Máis concentración e menos distraccións';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Este perfil reduce significativamente as distraccións, para axudar ás persoas con TDAH e trastornos do desenvolvemento neurolóxico a navegar, ler e centrarse máis facilmente nos elementos esenciais da aplicación.';

  @override
  String get theSettingsHaveBeenReset => 'A configuración foi restablecida.';

  @override
  String get toggleDarkMode => 'Alternar modo escuro';

  @override
  String get toggleEffectsMode => 'Alternar modo de efectos';

  @override
  String get toggleFontWeight => 'Alternar o grosor da fonte';

  @override
  String get toggleThemeProfile => 'Alternar perfil de tema';

  @override
  String get wordSpacing => 'Espazamento entre palabras';

  @override
  String get accessibleFont => 'Fonte accesible';

  @override
  String get accessibleFontSubtitle =>
      'Usa unha fonte accesible para unha mellor lexibilidade';

  @override
  String get accessibleFontEnabled => 'Fonte accesible activada';

  @override
  String get accessibleFontDisabled => 'Fonte accesible desactivada';

  @override
  String get toggleAccessibleFont => 'Alternar fonte accesible';

  @override
  String get settingsLoading => 'Cargando a configuración de accesibilidade…';

  @override
  String get settingsLoadFailed =>
      'Non se puido cargar a configuración de accesibilidade.';

  @override
  String get retry => 'Tentar de novo';
}
