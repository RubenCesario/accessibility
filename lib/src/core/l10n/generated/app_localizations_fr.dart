// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AccessibilityLocalizationsFr extends AccessibilityLocalizations {
  AccessibilityLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get accessibility => 'Accessibilité';

  @override
  String get accessibility_settings => 'Paramètres d\'accessibilité';

  @override
  String get adjust_background_colors => 'Ajuster les couleurs d\'arrière-plan';

  @override
  String get adjust_text_colors => 'Ajuster les couleurs du texte';

  @override
  String get align_center => 'Aligner au centre';

  @override
  String get align_left => 'Aligner à gauche';

  @override
  String get align_right => 'Aligner à droite';

  @override
  String get bold_text => 'Texte en gras';

  @override
  String get change_bold_text => 'Modifier le texte en gras';

  @override
  String get change_pages_background_color =>
      'Changer la couleur d\'arrière-plan des pages pour : ';

  @override
  String get change_text_color => 'Changer la couleur du texte pour : ';

  @override
  String get change_text_color_shade => 'Changer la nuance de couleur pour : ';

  @override
  String get color_adjustment => 'Ajustement des couleurs';

  @override
  String color_profile(String profile) {
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
  String get color_profile_changed_to => 'Le profil de couleur actuel est : ';

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
  String get decrement_word_spacing => 'Diminuer l\'espacement des mots';

  @override
  String get decrement_letter_spacing => 'Diminuer l\'espacement des lettres';

  @override
  String get decrement_line_height => 'Diminuer la hauteur de ligne';

  @override
  String get decrement_text_scale_factor =>
      'Diminuer le facteur d\'échelle du texte';

  @override
  String get effects => 'Effets';

  @override
  String get expand_text => 'Développer le texte';

  @override
  String get font_size => 'Taille de police';

  @override
  String get increase_or_decrease_word_spacing =>
      'Augmenter ou diminuer l\'espacement des mots';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Augmenter ou diminuer l\'espacement des lettres';

  @override
  String get increase_or_decrease_line_height =>
      'Augmenter ou diminuer la hauteur de ligne';

  @override
  String get increase_or_decrease_text_size =>
      'Augmenter ou diminuer la taille du texte';

  @override
  String get increment_word_spacing => 'Augmenter l\'espacement des mots';

  @override
  String get increment_letter_spacing => 'Augmenter l\'espacement des lettres';

  @override
  String get increment_line_height => 'Augmenter la hauteur de ligne';

  @override
  String get increment_text_scale_factor =>
      'Augmenter le facteur d\'échelle du texte';

  @override
  String get less_info => 'Masquer les informations';

  @override
  String get letter_spacing => 'Espacement des lettres';

  @override
  String get line_height => 'Hauteur de ligne';

  @override
  String get more_info => 'Afficher les informations';

  @override
  String get read_less => 'Lire moins';

  @override
  String get read_more => 'Lire plus';

  @override
  String get reduce_effects => 'Réduire les effets à l\'écran';

  @override
  String get reduce_text => 'Réduire le texte';

  @override
  String get restore_settings => 'Rétablir les paramètres';

  @override
  String get restore_main_color => 'Rétablir la couleur principale';

  @override
  String get return_to_main_colors => 'Revenir aux couleurs principales';

  @override
  String get settings => 'Paramètres';

  @override
  String get size_and_text_display => 'Taille et affichage du texte';

  @override
  String get slider_word_spacing => 'Curseur d\'espacement des mots';

  @override
  String get slider_letter_spacing => 'Curseur d\'espacement des lettres';

  @override
  String get slider_line_height => 'Curseur de hauteur de ligne';

  @override
  String get theme_mode => 'Thème';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil de thème non reconnu',
      'seizureSafe': 'Protection contre les crises',
      'visionImpaired': 'Déficience visuelle',
      'adhdFriendly': 'Adapté aux TDAH',
      'none': 'Par défaut',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profil de protection contre les crises';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Supprime les reflets et réduit les couleurs';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ce profil permet aux utilisateurs épileptiques et à risque de crises de naviguer en toute sécurité en éliminant le risque de crises résultant d\'animations clignotantes et de combinaisons de couleurs risquées.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil pour déficience visuelle';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Améliore la visibilité de l\'application';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ce profil adapte l\'application pour la rendre accessible à la plupart des déficiences visuelles, comme les troubles de la vision, la vision tunnel, la cataracte, le glaucome et plus encore.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil adapté aux TDAH';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Plus de concentration et moins de distractions';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ce profil réduit considérablement les distractions, pour aider les personnes atteintes de TDAH et de troubles du développement neurologique à naviguer, lire et se concentrer plus facilement sur les éléments essentiels de l\'application.';

  @override
  String get the_settings_have_been_reset =>
      'Les paramètres ont été réinitialisés.';

  @override
  String get toggle_dark_mode => 'Activer/désactiver le mode sombre';

  @override
  String get toggle_effects_mode => 'Activer/désactiver le mode effets';

  @override
  String get toggle_font_weight => 'Activer/désactiver la graisse de la police';

  @override
  String get toggle_theme_profile => 'Activer/désactiver le profil de thème';

  @override
  String get word_spacing => 'Espacement des mots';
}
