import 'package:accessibility/src/core/l10n/generated/app_localizations_fr.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsFr', () {
    late AccessibilityLocalizationsFr loc;

    setUp(() {
      loc = AccessibilityLocalizationsFr();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('fr'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Accessibilité'));
      expect(
        loc.accessibility_settings,
        equals("Paramètres d'accessibilité"),
      );
      expect(
        loc.adjust_background_colors,
        equals("Ajuster les couleurs d'arrière-plan"),
      );
      expect(
        loc.adjust_text_colors,
        equals('Ajuster les couleurs du texte'),
      );
      expect(loc.align_center, equals('Aligner au centre'));
      expect(loc.align_left, equals('Aligner à gauche'));
      expect(loc.align_right, equals('Aligner à droite'));
      expect(loc.bold_text, equals('Texte en gras'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('Modifier le texte en gras'),
      );
      expect(
        loc.change_pages_background_color,
        equals("Changer la couleur d'arrière-plan des pages pour : "),
      );
      expect(
        loc.change_text_color,
        equals('Changer la couleur du texte pour : '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Changer la nuance de couleur pour : '),
      );
      expect(
        loc.color_adjustment,
        equals('Ajustement des couleurs'),
      );
      expect(
        loc.color_profile_changed_to,
        equals('Le profil de couleur actuel est : '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals("Diminuer l'espacement des mots"),
      );
      expect(
        loc.decrement_letter_spacing,
        equals("Diminuer l'espacement des lettres"),
      );
      expect(
        loc.decrement_line_height,
        equals('Diminuer la hauteur de ligne'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals("Diminuer le facteur d'échelle du texte"),
      );
      expect(
        loc.increment_word_spacing,
        equals("Augmenter l'espacement des mots"),
      );
      expect(
        loc.increment_letter_spacing,
        equals("Augmenter l'espacement des lettres"),
      );
      expect(
        loc.increment_line_height,
        equals('Augmenter la hauteur de ligne'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals("Augmenter le facteur d'échelle du texte"),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals("Augmenter ou diminuer l'espacement des mots"),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals("Augmenter ou diminuer l'espacement des lettres"),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Augmenter ou diminuer la hauteur de ligne'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Augmenter ou diminuer la taille du texte'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effets'));
      expect(loc.expand_text, equals('Développer le texte'));
      expect(loc.font_size, equals('Taille de police'));
      expect(loc.less_info, equals('Masquer les informations'));
      expect(loc.letter_spacing, equals('Espacement des lettres'));
      expect(loc.line_height, equals('Hauteur de ligne'));
      expect(loc.more_info, equals('Afficher les informations'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Lire moins'));
      expect(loc.read_more, equals('Lire plus'));
      expect(
        loc.reduce_effects,
        equals("Réduire les effets à l'écran"),
      );
      expect(loc.reduce_text, equals('Réduire le texte'));
      expect(
        loc.restore_settings,
        equals('Rétablir les paramètres'),
      );
      expect(
        loc.restore_main_color,
        equals('Rétablir la couleur principale'),
      );
      expect(
        loc.return_to_main_colors,
        equals('Revenir aux couleurs principales'),
      );
      expect(loc.settings, equals('Paramètres'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Taille et affichage du texte'),
      );
      expect(
        loc.slider_word_spacing,
        equals("Curseur d'espacement des mots"),
      );
      expect(
        loc.slider_letter_spacing,
        equals("Curseur d'espacement des lettres"),
      );
      expect(
        loc.slider_line_height,
        equals('Curseur de hauteur de ligne'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Profil de thème non reconnu'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Protection contre les crises'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Déficience visuelle'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Adapté aux TDAH'),
      );
      expect(loc.theme_profile('none'), equals('Par défaut'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil de protection contre les crises'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Supprime les reflets et réduit les couleurs'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ce profil permet aux utilisateurs épileptiques et '
          'à risque de crises de naviguer en toute sécurité en '
          "éliminant le risque de crises résultant d'animations "
          'clignotantes et de combinaisons de couleurs risquées.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil pour déficience visuelle'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals("Améliore la visibilité de l'application"),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          "Ce profil adapte l'application pour la rendre accessible "
          'à la plupart des déficiences visuelles, comme les '
          'troubles de la vision, la vision tunnel, la cataracte, '
          'le glaucome et plus encore.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil adapté aux TDAH'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Plus de concentration et moins de distractions'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ce profil réduit considérablement les distractions, '
          'pour aider les personnes atteintes de TDAH et de '
          'troubles du développement neurologique à naviguer, '
          'lire et se concentrer plus facilement sur les '
          "éléments essentiels de l'application.",
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Les paramètres ont été réinitialisés.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(
        loc.toggle_dark_mode,
        equals('Activer/désactiver le mode sombre'),
      );
      expect(
        loc.toggle_effects_mode,
        equals('Activer/désactiver le mode effets'),
      );
      expect(
        loc.toggle_font_weight,
        equals('Activer/désactiver la graisse de la police'),
      );
      expect(loc.word_spacing, equals('Espacement des mots'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Faible saturation'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Haute saturation'),
      );
      expect(loc.color_profile('monochrome'), equals('Monochrome'));
      expect(
        loc.color_profile('highContrast'),
        equals('Contraste élevé'),
      );
      expect(
        loc.color_profile('unknown'),
        equals('Normal'),
      );
    });

    test('should handle color selection logic correctly', () {
      // Test a sample of colors
      expect(loc.color('cF44336'), equals('Rouge'));
      expect(loc.color('cE91E63'), equals('Rose'));
      expect(loc.color('c9C27B0'), equals('Violet'));
      expect(loc.color('c673AB7'), equals('Violet foncé'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Bleu'));
      expect(loc.color('c03A9F4'), equals('Bleu clair'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Turquoise'));
      expect(loc.color('c4CAF50'), equals('Vert'));
      expect(loc.color('c8BC34A'), equals('Vert clair'));
      expect(loc.color('cCDDC39'), equals('Citron vert'));
      expect(loc.color('cFFEB3B'), equals('Jaune'));
      expect(loc.color('cFFC107'), equals('Ambre'));
      expect(loc.color('cFF9800'), equals('Orange'));
      expect(loc.color('cFF5722'), equals('Orange foncé'));
      expect(loc.color('c795548'), equals('Marron'));
      expect(loc.color('c9E9E9E'), equals('Gris'));
      expect(loc.color('c607D8B'), equals('Bleu-gris'));
      expect(
        loc.color('unknown'),
        equals('Couleur non reconnue'),
      );
    });
  });
}
