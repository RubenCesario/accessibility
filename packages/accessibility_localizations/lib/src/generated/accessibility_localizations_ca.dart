// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AccessibilityLocalizationsCa extends AccessibilityLocalizations {
  AccessibilityLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get accessibility => 'Accessibilitat';

  @override
  String get accessibilitySettings => 'Configuració d\'accessibilitat';

  @override
  String get adjustBackgroundColors => 'Ajustar colors de fons';

  @override
  String get adjustTextColors => 'Ajustar colors del text';

  @override
  String get alignCenter => 'Alineació al centre';

  @override
  String get alignLeft => 'Alineació a l\'esquerra';

  @override
  String get alignRight => 'Alineació a la dreta';

  @override
  String get textAlignment => 'Alineació del text';

  @override
  String get boldText => 'Text en negreta';

  @override
  String get changeBoldText => 'Canviar text en negreta';

  @override
  String get changePagesBackgroundColor =>
      'Canviar el color de fons de les pàgines a: ';

  @override
  String get changeTextColor => 'Canviar el color del text a: ';

  @override
  String get changeTextColorShade => 'Canviar el to del color a: ';

  @override
  String get colorAdjustment => 'Ajustament de color';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Baixa saturació',
      'normal': 'Normal',
      'highSaturation': 'Alta saturació',
      'monochrome': 'Monocrom',
      'highContrast': 'Alt contrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'El perfil de color actual és: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Disminuir espai entre paraules';

  @override
  String get decrementLetterSpacing => 'Disminuir espai entre lletres';

  @override
  String get decrementLineHeight => 'Disminuir alçada de línia';

  @override
  String get decrementTextScaleFactor => 'Disminuir factor d\'escala de text';

  @override
  String get effects => 'Efectes';

  @override
  String get expandText => 'Expandir text';

  @override
  String get fontSize => 'Mida de la font';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Augmentar o disminuir espai entre paraules';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Augmentar o disminuir espai entre lletres';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Augmentar o disminuir alçada de línia';

  @override
  String get increaseOrDecreaseTextSize =>
      'Augmentar o disminuir la mida del text';

  @override
  String get incrementWordSpacing => 'Augmentar espai entre paraules';

  @override
  String get incrementLetterSpacing => 'Augmentar espai entre lletres';

  @override
  String get incrementLineHeight => 'Augmentar alçada de línia';

  @override
  String get incrementTextScaleFactor => 'Augmentar factor d\'escala de text';

  @override
  String get lessInfo => 'Amagar informació';

  @override
  String get letterSpacing => 'Espai entre lletres';

  @override
  String get lineHeight => 'Alçada de línia';

  @override
  String get moreInfo => 'Mostrar informació';

  @override
  String get readLess => 'Llegir menys';

  @override
  String get readMore => 'Llegir més';

  @override
  String get reduceEffects => 'Reduir efectes a la pantalla';

  @override
  String get reduceText => 'Reduir text';

  @override
  String get restoreSettings => 'Restaurar configuració';

  @override
  String get restoreMainColor => 'Restaurar color principal';

  @override
  String get returnToMainColors => 'Tornar als colors principals';

  @override
  String get settings => 'Configuració';

  @override
  String get sizeAndTextDisplay => 'Mida i visualització del text';

  @override
  String get sliderWordSpacing => 'Control lliscant d\'espai entre paraules';

  @override
  String get sliderLetterSpacing => 'Control lliscant d\'espai entre lletres';

  @override
  String get sliderLineHeight => 'Control lliscant d\'alçada de línia';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Perfil de tema no reconegut',
      'seizureSafe': 'Segur per a epilepsia',
      'visionImpaired': 'Visió reduïda',
      'adhdFriendly': 'Favorable per a TDAH',
      'none': 'Perfil predeterminat',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Perfil segur per a epilepsia';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Eliminar reflexos i reduir color';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Aquest perfil permet als usuaris amb epilepsia i amb risc de patir convulsions navegar de manera segura eliminant el risc de convulsions provocades per animacions parpellejants i combinacions de colors arriscades.';

  @override
  String get themeProfileVisionImpairedTitle => 'Perfil per a visió reduïda';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Millorar la visibilitat de l\'aplicació';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Aquest perfil adapta l\'aplicació perquè sigui accessible a la majoria de deficiències visuals, com ara discapacitat visual, visió de túnel, cataractes, glaucoma i més.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Perfil favorable per a TDAH';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Més concentració i menys distraccions';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Aquest perfil redueix significativament les distraccions, per ajudar les persones amb TDAH i trastorns del neurodesenvolupament a navegar, llegir i centrar-se en els elements essencials de l\'aplicació amb més facilitat.';

  @override
  String get theSettingsHaveBeenReset => 'S\'ha restablert la configuració.';

  @override
  String get toggleDarkMode => 'Activar/desactivar mode fosc';

  @override
  String get toggleEffectsMode => 'Activar/desactivar mode d\'efectes';

  @override
  String get toggleFontWeight => 'Activar/desactivar pes de la font';

  @override
  String get toggleThemeProfile => 'Activar/desactivar perfil de tema';

  @override
  String get wordSpacing => 'Espai entre paraules';

  @override
  String get accessibleFont => 'Font accessible';

  @override
  String get accessibleFontSubtitle =>
      'Utilitzeu una lletra accessible per a una millor llegibilitat';

  @override
  String get accessibleFontEnabled => 'Font accessible activada';

  @override
  String get accessibleFontDisabled => 'Font accessible desactivada';

  @override
  String get toggleAccessibleFont => 'Activar/desactivar font accessible';

  @override
  String get settingsLoading =>
      'S\'està carregant la configuració d\'accessibilitat…';

  @override
  String get settingsLoadFailed =>
      'No s\'ha pogut carregar la configuració d\'accessibilitat.';

  @override
  String get retry => 'Torna-ho a provar';
}
