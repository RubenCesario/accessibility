import 'package:accessibility/src/core/l10n/generated/app_localizations_ca.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsCa', () {
    late AccessibilityLocalizationsCa loc;

    setUp(() {
      loc = AccessibilityLocalizationsCa();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ca'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Accessibilitat'));
      expect(
        loc.accessibility_settings,
        equals("Configuració d'accessibilitat"),
      );
      expect(loc.adjust_background_colors, equals('Ajustar colors de fons'));
      expect(loc.adjust_text_colors, equals('Ajustar colors del text'));
      expect(loc.align_center, equals('Alineació al centre'));
      expect(loc.align_left, equals("Alineació a l'esquerra"));
      expect(loc.align_right, equals('Alineació a la dreta'));
      expect(loc.bold_text, equals('Text en negreta'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Canviar text en negreta'));
      expect(
        loc.change_pages_background_color,
        equals('Canviar el color de fons de les pàgines a: '),
      );
      expect(loc.change_text_color, equals('Canviar el color del text a: '));
      expect(
        loc.change_text_color_shade,
        equals('Canviar el to del color a: '),
      );
      expect(loc.color_adjustment, equals('Ajustament de color'));
      expect(
        loc.color_profile_changed_to,
        equals('El perfil de color actual és: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Disminuir espai entre paraules'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Disminuir espai entre lletres'),
      );
      expect(loc.decrement_line_height, equals('Disminuir alçada de línia'));
      expect(
        loc.decrement_text_scale_factor,
        equals("Disminuir factor d'escala de text"),
      );
      expect(
        loc.increment_word_spacing,
        equals('Augmentar espai entre paraules'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Augmentar espai entre lletres'),
      );
      expect(loc.increment_line_height, equals('Augmentar alçada de línia'));
      expect(
        loc.increment_text_scale_factor,
        equals("Augmentar factor d'escala de text"),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Augmentar o disminuir espai entre paraules'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Augmentar o disminuir espai entre lletres'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Augmentar o disminuir alçada de línia'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Augmentar o disminuir la mida del text'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efectes'));
      expect(loc.expand_text, equals('Expandir text'));
      expect(loc.font_size, equals('Mida de la font'));
      expect(loc.less_info, equals('Amagar informació'));
      expect(loc.letter_spacing, equals('Espai entre lletres'));
      expect(loc.line_height, equals('Alçada de línia'));
      expect(loc.more_info, equals('Mostrar informació'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Llegir menys'));
      expect(loc.read_more, equals('Llegir més'));
      expect(loc.reduce_effects, equals('Reduir efectes a la pantalla'));
      expect(loc.reduce_text, equals('Reduir text'));
      expect(loc.restore_settings, equals('Restaurar configuració'));
      expect(loc.restore_main_color, equals('Restaurar color principal'));
      expect(loc.return_to_main_colors, equals('Tornar als colors principals'));
      expect(loc.settings, equals('Configuració'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Mida i visualització del text'),
      );
      expect(
        loc.slider_word_spacing,
        equals("Control lliscant d'espai entre paraules"),
      );
      expect(
        loc.slider_letter_spacing,
        equals("Control lliscant d'espai entre lletres"),
      );
      expect(
        loc.slider_line_height,
        equals("Control lliscant d'alçada de línia"),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Perfil de tema no reconegut'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Segur per a epilepsia'));
      expect(loc.theme_profile('visionImpaired'), equals('Visió reduïda'));
      expect(loc.theme_profile('adhdFriendly'), equals('Favorable per a TDAH'));
      expect(loc.theme_profile('none'), equals('Predeterminat'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Perfil segur per a epilepsia'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Eliminar reflexos i reduir color'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Aquest perfil permet als usuaris amb epilepsia i amb '
          'risc de patir convulsions navegar de manera segura '
          'eliminant el risc de convulsions provocades per animacions '
          'parpellejants i combinacions de colors arriscades.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Perfil per a visió reduïda'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals("Millorar la visibilitat de l'aplicació"),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          "Aquest perfil adapta l'aplicació perquè sigui accessible "
          'a la majoria de deficiències visuals, com ara '
          'discapacitat visual, visió de túnel, cataractes, '
          'glaucoma i més.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Perfil favorable per a TDAH'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Més concentració i menys distraccions'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Aquest perfil redueix significativament les distraccions, '
          'per ajudar les persones amb TDAH i trastorns del '
          'neurodesenvolupament '
          'a navegar, llegir i centrar-se en els elements essencials '
          "de l'aplicació amb més facilitat.",
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals("S'ha restablert la configuració."),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Activar/desactivar mode fosc'));
      expect(
        loc.toggle_effects_mode,
        equals("Activar/desactivar mode d'efectes"),
      );
      expect(
        loc.toggle_font_weight,
        equals('Activar/desactivar pes de la font'),
      );
      expect(
        loc.toggle_theme_profile,
        equals('Activar/desactivar perfil de tema'),
      );
      expect(loc.word_spacing, equals('Espai entre paraules'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Baixa saturació'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(loc.color_profile('highSaturation'), equals('Alta saturació'));
      expect(loc.color_profile('monochrome'), equals('Monocrom'));
      expect(loc.color_profile('highContrast'), equals('Alt contrast'));
      expect(loc.color_profile('unknown'), equals('Normal'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Vermell'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Lila'));
      expect(loc.color('c673AB7'), equals('Lila fosc'));
      expect(loc.color('c3F51B5'), equals('Indi'));
      expect(loc.color('c2196F3'), equals('Blau'));
      expect(loc.color('c03A9F4'), equals('Blau clar'));
      expect(loc.color('c00BCD4'), equals('Cian'));
      expect(loc.color('c009688'), equals('Turquesa'));
      expect(loc.color('c4CAF50'), equals('Verd'));
      expect(loc.color('c8BC34A'), equals('Verd clar'));
      expect(loc.color('cCDDC39'), equals('Llima'));
      expect(loc.color('cFFEB3B'), equals('Groc'));
      expect(loc.color('cFFC107'), equals('Àmbar'));
      expect(loc.color('cFF9800'), equals('Taronja'));
      expect(loc.color('cFF5722'), equals('Taronja fosc'));
      expect(loc.color('c795548'), equals('Marró'));
      expect(loc.color('c9E9E9E'), equals('Gris'));
      expect(loc.color('c607D8B'), equals('Gris blavós'));
      expect(loc.color('unknown'), equals('Color no reconegut'));
    });
  });
}
