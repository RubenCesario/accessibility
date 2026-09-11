// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AccessibilityLocalizationsFr extends AccessibilityLocalizations {
  AccessibilityLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get accessibility => 'Accessibilité';

  @override
  String get accessibilitySettings => 'Paramètres d\'accessibilité';

  @override
  String get adjustBackgroundColors => 'Ajuster les couleurs d\'arrière-plan';

  @override
  String get adjustTextColors => 'Ajuster les couleurs du texte';

  @override
  String get alignCenter => 'Aligner au centre';

  @override
  String get alignLeft => 'Aligner à gauche';

  @override
  String get alignRight => 'Aligner à droite';

  @override
  String get textAlignment => 'Alignement du texte';

  @override
  String get boldText => 'Texte en gras';

  @override
  String get changeBoldText => 'Modifier le texte en gras';

  @override
  String get changePagesBackgroundColor =>
      'Changer la couleur d\'arrière-plan des pages pour : ';

  @override
  String get changeTextColor => 'Changer la couleur du texte pour : ';

  @override
  String get changeTextColorShade => 'Changer la nuance de couleur pour : ';

  @override
  String get colorAdjustment => 'Ajustement des couleurs';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Faible saturation',
      'normal': 'Normal',
      'highSaturation': 'Haute saturation',
      'monochrome': 'Monochrome',
      'highContrast': 'Contraste élevé',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Le profil de couleur actuel est : ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Couleur non reconnue',
      'cF44336': 'Rouge',
      'cE91E63': 'Rose',
      'c9C27B0': 'Violet',
      'c673AB7': 'Violet foncé',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Bleu',
      'c03A9F4': 'Bleu clair',
      'c00BCD4': 'Cyan',
      'c009688': 'Turquoise',
      'c4CAF50': 'Vert',
      'c8BC34A': 'Vert clair',
      'cCDDC39': 'Citron vert',
      'cFFEB3B': 'Jaune',
      'cFFC107': 'Ambre',
      'cFF9800': 'Orange',
      'cFF5722': 'Orange foncé',
      'c795548': 'Marron',
      'c9E9E9E': 'Gris',
      'c607D8B': 'Bleu-gris',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Diminuer l\'espacement des mots';

  @override
  String get decrementLetterSpacing => 'Diminuer l\'espacement des lettres';

  @override
  String get decrementLineHeight => 'Diminuer la hauteur de ligne';

  @override
  String get decrementTextScaleFactor =>
      'Diminuer le facteur d\'échelle du texte';

  @override
  String get effects => 'Effets';

  @override
  String get expandText => 'Développer le texte';

  @override
  String get fontSize => 'Taille de police';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Augmenter ou diminuer l\'espacement des mots';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Augmenter ou diminuer l\'espacement des lettres';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Augmenter ou diminuer la hauteur de ligne';

  @override
  String get increaseOrDecreaseTextSize =>
      'Augmenter ou diminuer la taille du texte';

  @override
  String get incrementWordSpacing => 'Augmenter l\'espacement des mots';

  @override
  String get incrementLetterSpacing => 'Augmenter l\'espacement des lettres';

  @override
  String get incrementLineHeight => 'Augmenter la hauteur de ligne';

  @override
  String get incrementTextScaleFactor =>
      'Augmenter le facteur d\'échelle du texte';

  @override
  String get lessInfo => 'Masquer les informations';

  @override
  String get letterSpacing => 'Espacement des lettres';

  @override
  String get lineHeight => 'Hauteur de ligne';

  @override
  String get moreInfo => 'Afficher les informations';

  @override
  String get readLess => 'Lire moins';

  @override
  String get readMore => 'Lire plus';

  @override
  String get reduceEffects => 'Réduire les effets à l\'écran';

  @override
  String get reduceText => 'Réduire le texte';

  @override
  String get restoreSettings => 'Rétablir les paramètres';

  @override
  String get restoreMainColor => 'Rétablir la couleur principale';

  @override
  String get returnToMainColors => 'Revenir aux couleurs principales';

  @override
  String get settings => 'Paramètres';

  @override
  String get sizeAndTextDisplay => 'Taille et affichage du texte';

  @override
  String get sliderWordSpacing => 'Curseur d\'espacement des mots';

  @override
  String get sliderLetterSpacing => 'Curseur d\'espacement des lettres';

  @override
  String get sliderLineHeight => 'Curseur de hauteur de ligne';

  @override
  String get themeMode => 'Thème';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil de thème non reconnu',
      'seizureSafe': 'Protection contre les crises',
      'visionImpaired': 'Déficience visuelle',
      'adhdFriendly': 'Adapté aux TDAH',
      'none': 'Profil par défaut',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'Profil de protection contre les crises';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Supprime les reflets et réduit les couleurs';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ce profil permet aux utilisateurs épileptiques et à risque de crises de naviguer en toute sécurité en éliminant le risque de crises résultant d\'animations clignotantes et de combinaisons de couleurs risquées.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profil pour déficience visuelle';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Améliore la visibilité de l\'application';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ce profil adapte l\'application pour la rendre accessible à la plupart des déficiences visuelles, comme les troubles de la vision, la vision tunnel, la cataracte, le glaucome et plus encore.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil adapté aux TDAH';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Plus de concentration et moins de distractions';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ce profil réduit considérablement les distractions, pour aider les personnes atteintes de TDAH et de troubles du développement neurologique à naviguer, lire et se concentrer plus facilement sur les éléments essentiels de l\'application.';

  @override
  String get theSettingsHaveBeenReset =>
      'Les paramètres ont été réinitialisés.';

  @override
  String get toggleDarkMode => 'Activer/désactiver le mode sombre';

  @override
  String get toggleEffectsMode => 'Activer/désactiver le mode effets';

  @override
  String get toggleFontWeight => 'Activer/désactiver la graisse de la police';

  @override
  String get toggleThemeProfile => 'Activer/désactiver le profil de thème';

  @override
  String get wordSpacing => 'Espacement des mots';

  @override
  String get accessibleFont => 'Police accessible';

  @override
  String get accessibleFontSubtitle =>
      'Utilisez une police accessible pour une meilleure lisibilité';

  @override
  String get accessibleFontEnabled => 'Police accessible activée';

  @override
  String get accessibleFontDisabled => 'Police accessible désactivée';

  @override
  String get toggleAccessibleFont => 'Activer/désactiver la police accessible';

  @override
  String get settingsLoading => 'Chargement des paramètres d\'accessibilité…';

  @override
  String get settingsLoadFailed =>
      'Impossible de charger les paramètres d\'accessibilité.';

  @override
  String get retry => 'Réessayer';

  @override
  String get themeModeSystem => 'Système';

  @override
  String get themeModeLight => 'Clair';

  @override
  String get themeModeDark => 'Sombre';

  @override
  String get effectsModeSystem => 'Système';

  @override
  String get effectsModeEnabled => 'Activé';

  @override
  String get effectsModeDisabled => 'Désactivé';
}
