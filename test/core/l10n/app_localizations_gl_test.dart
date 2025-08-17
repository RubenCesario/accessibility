import 'package:accessibility/src/core/l10n/generated/app_localizations_gl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsGl', () {
    late AccessibilityLocalizationsGl loc;

    setUp(() {
      loc = AccessibilityLocalizationsGl();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('gl'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Accesibilidade'));
      expect(
        loc.accessibility_settings,
        equals('Configuración de accesibilidade'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Axustar as cores de fondo'),
      );
      expect(loc.adjust_text_colors, equals('Axustar as cores do texto'));
      expect(loc.align_center, equals('Alinear ao centro'));
      expect(loc.align_left, equals('Alinear á esquerda'));
      expect(loc.align_right, equals('Alinear á dereita'));
      expect(loc.bold_text, equals('Texto en negriña'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Cambiar texto en negriña'));
      expect(
        loc.change_pages_background_color,
        equals('Cambiar a cor de fondo das páxinas a: '),
      );
      expect(
        loc.change_text_color,
        equals('Cambiar a cor do texto a: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Cambiar a tonalidade da cor a: '),
      );
      expect(loc.color_adjustment, equals('Axuste de cor'));
      expect(
        loc.color_profile_changed_to,
        equals('O perfil de cor actual é: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Diminuir o espazamento entre palabras'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Diminuir o espazamento entre letras'),
      );
      expect(loc.decrement_line_height, equals('Diminuir a altura da liña'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Diminuir o factor de escala do texto'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Aumentar o espazamento entre palabras'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Aumentar o espazamento entre letras'),
      );
      expect(loc.increment_line_height, equals('Aumentar a altura da liña'));
      expect(
        loc.increment_text_scale_factor,
        equals('Aumentar o factor de escala do texto'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Aumentar ou diminuir o espazamento entre palabras'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Aumentar ou diminuir o espazamento entre letras'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Aumentar ou diminuir a altura da liña'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Aumentar ou diminuir o tamaño do texto'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efectos'));
      expect(loc.expand_text, equals('Expandir texto'));
      expect(loc.font_size, equals('Tamaño da fonte'));
      expect(loc.less_info, equals('Ocultar información'));
      expect(loc.letter_spacing, equals('Espazamento entre letras'));
      expect(loc.line_height, equals('Altura da liña'));
      expect(loc.more_info, equals('Amosar información'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Ler menos'));
      expect(loc.read_more, equals('Ler máis'));
      expect(
        loc.reduce_effects,
        equals('Reducir os efectos na pantalla'),
      );
      expect(loc.reduce_text, equals('Reducir texto'));
      expect(loc.restore_settings, equals('Restaurar configuración'));
      expect(loc.restore_main_color, equals('Restaurar cor principal'));
      expect(
        loc.return_to_main_colors,
        equals('Volver ás cores principais'),
      );
      expect(loc.settings, equals('Configuración'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Tamaño e visualización do texto'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Control deslizante de espazamento entre palabras'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Control deslizante de espazamento entre letras'),
      );
      expect(
        loc.slider_line_height,
        equals('Control deslizante de altura da liña'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Perfil de tema non recoñecido'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Seguro para epilepsia'));
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Deficiencia visual'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Adaptado para TDAH'),
      );
      expect(loc.theme_profile('none'), equals('Predeterminado'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Perfil seguro para epilepsia'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Eliminar reflexos e reducir cor'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Este perfil permite aos usuarios con epilepsia e en risco de '
          'sufrir convulsións navegar de forma segura ao eliminar o risco '
          'de convulsións que resultan de animacións parpadeantes e '
          'combinacións de cores arriscadas.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Perfil para deficiencia visual'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Mellorar a visibilidade da aplicación'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Este perfil adapta a aplicación para que sexa accesible á '
          'maioría das deficiencias visuais, como a discapacidade '
          'visual, a visión en túnel, as cataratas, o glaucoma e máis.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Perfil adaptado para TDAH'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Máis concentración e menos distraccións'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Este perfil reduce significativamente as distraccións, para '
          'axudar ás persoas con TDAH e trastornos do desenvolvemento '
          'neurolóxico a navegar, ler e centrarse máis facilmente nos '
          'elementos esenciais da aplicación.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('A configuración foi restablecida.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Alternar modo escuro'));
      expect(loc.toggle_effects_mode, equals('Alternar modo de efectos'));
      expect(loc.toggle_font_weight, equals('Alternar o grosor da fonte'));
      expect(loc.toggle_theme_profile, equals('Alternar perfil de tema'));
      expect(loc.word_spacing, equals('Espazamento entre palabras'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Baixa saturación'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Alta saturación'),
      );
      expect(loc.color_profile('monochrome'), equals('Monocromático'));
      expect(loc.color_profile('highContrast'), equals('Alto contraste'));
      expect(loc.color_profile('unknown'), equals('Normal'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Vermello'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Lila'));
      expect(loc.color('c673AB7'), equals('Lila intenso'));
      expect(loc.color('c3F51B5'), equals('Añil'));
      expect(loc.color('c2196F3'), equals('Azul'));
      expect(loc.color('c03A9F4'), equals('Azul claro'));
      expect(loc.color('c00BCD4'), equals('Cian'));
      expect(loc.color('c009688'), equals('Verde azulado'));
      expect(loc.color('c4CAF50'), equals('Verde'));
      expect(loc.color('c8BC34A'), equals('Verde claro'));
      expect(loc.color('cCDDC39'), equals('Verde lima'));
      expect(loc.color('cFFEB3B'), equals('Amarelo'));
      expect(loc.color('cFFC107'), equals('Ámbar'));
      expect(loc.color('cFF9800'), equals('Laranxa'));
      expect(loc.color('cFF5722'), equals('Laranxa intenso'));
      expect(loc.color('c795548'), equals('Marrón'));
      expect(loc.color('c9E9E9E'), equals('Gris'));
      expect(loc.color('c607D8B'), equals('Gris azulado'));
      expect(
        loc.color('unknown'),
        equals('Cor non recoñecida'),
      );
    });
  });
}
