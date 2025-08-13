import 'package:accessibility/src/core/l10n/generated/app_localizations_es.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsEs', () {
    late AccessibilityLocalizationsEs loc;

    setUp(() {
      loc = AccessibilityLocalizationsEs();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('es'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Accesibilidad'));
      expect(
        loc.accessibility_settings,
        equals('Configuración de accesibilidad'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Ajustar colores de fondo'),
      );
      expect(
        loc.adjust_text_colors,
        equals('Ajustar colores de texto'),
      );
      expect(loc.align_center, equals('Alineación central'));
      expect(loc.align_left, equals('Alineación izquierda'));
      expect(loc.align_right, equals('Alineación derecha'));
      expect(loc.bold_text, equals('Texto en negrita'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('Cambiar texto en negrita'),
      );
      expect(
        loc.change_pages_background_color,
        equals('Cambiar el color de fondo de las páginas a: '),
      );
      expect(
        loc.change_text_color,
        equals('Cambiar el color del texto a: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Cambiar el tono del color a: '),
      );
      expect(loc.color_adjustment, equals('Ajuste de color'));
      expect(
        loc.color_profile_changed_to,
        equals('El perfil de color actual es: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Reducir espacio entre palabras'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Reducir espacio entre letras'),
      );
      expect(
        loc.decrement_line_height,
        equals('Reducir altura de línea'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Reducir factor de escala de texto'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Aumentar espacio entre palabras'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Aumentar espacio entre letras'),
      );
      expect(
        loc.increment_line_height,
        equals('Aumentar altura de línea'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Aumentar factor de escala de texto'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Aumentar o reducir espacio entre palabras'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Aumentar o reducir espacio entre letras'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Aumentar o reducir altura de línea'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Aumentar o reducir tamaño de texto'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efectos'));
      expect(loc.expand_text, equals('Expandir texto'));
      expect(loc.font_size, equals('Tamaño de fuente'));
      expect(loc.less_info, equals('Ocultar información'));
      expect(loc.letter_spacing, equals('Espacio entre letras'));
      expect(loc.line_height, equals('Altura de línea'));
      expect(loc.more_info, equals('Mostrar información'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Leer menos'));
      expect(loc.read_more, equals('Leer más'));
      expect(
        loc.reduce_effects,
        equals('Reducir efectos de pantalla'),
      );
      expect(loc.reduce_text, equals('Reducir texto'));
      expect(loc.restore_settings, equals('Restaurar configuración'));
      expect(
        loc.restore_main_color,
        equals('Restaurar color principal'),
      );
      expect(
        loc.return_to_main_colors,
        equals('Volver a colores principales'),
      );
      expect(loc.settings, equals('Configuración'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Tamaño y visualización de texto'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Deslizador de espacio entre palabras'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Deslizador de espacio entre letras'),
      );
      expect(
        loc.slider_line_height,
        equals('Deslizador de altura de línea'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Perfil de tema no reconocido'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Seguro para epilepsia'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Problemas de visión'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Amigable para TDAH'),
      );
      expect(loc.theme_profile('none'), equals('Predeterminado'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Perfil seguro para epilepsia'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Eliminar reflejos y reducir color'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Este perfil permite a los usuarios con epilepsia '
          'y en riesgo de convulsiones navegar de forma segura '
          'eliminando el riesgo de convulsiones causadas por '
          'animaciones intermitentes y combinaciones de colores riesgosas.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Perfil para problemas de visión'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Mejorar visibilidad de la aplicación'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Este perfil adapta la aplicación para que sea accesible '
          'para la mayoría de las discapacidades visuales, como '
          'visión reducida, visión en túnel, cataratas, glaucoma y más.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Perfil amigable para TDAH'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Más concentración y menos distracciones'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Este perfil reduce significativamente las distracciones, '
          'para ayudar a las personas con TDAH y trastornos del '
          'neurodesarrollo a navegar, leer y concentrarse en los '
          'elementos esenciales de la aplicación con mayor facilidad.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('La configuración ha sido restablecida.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Alternar modo oscuro'));
      expect(
        loc.toggle_effects_mode,
        equals('Alternar modo de efectos'),
      );
      expect(
        loc.toggle_font_weight,
        equals('Alternar grosor de fuente'),
      );
      expect(loc.word_spacing, equals('Espacio entre palabras'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Baja saturación'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Alta saturación'),
      );
      expect(loc.color_profile('monochrome'), equals('Monocromo'));
      expect(
        loc.color_profile('highContrast'),
        equals('Alto contraste'),
      );
      expect(
        loc.color_profile('unknown'),
        equals('Normal'),
      );
    });

    test('should handle color selection logic correctly', () {
      // Test a sample of colors
      expect(loc.color('cF44336'), equals('Rojo'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Púrpura'));
      expect(loc.color('c673AB7'), equals('Púrpura oscuro'));
      expect(loc.color('c3F51B5'), equals('Índigo'));
      expect(loc.color('c2196F3'), equals('Azul'));
      expect(loc.color('c03A9F4'), equals('Azul claro'));
      expect(loc.color('c00BCD4'), equals('Cian'));
      expect(loc.color('c009688'), equals('Verde azulado'));
      expect(loc.color('c4CAF50'), equals('Verde'));
      expect(loc.color('c8BC34A'), equals('Verde claro'));
      expect(loc.color('cCDDC39'), equals('Lima'));
      expect(loc.color('cFFEB3B'), equals('Amarillo'));
      expect(loc.color('cFFC107'), equals('Ámbar'));
      expect(loc.color('cFF9800'), equals('Naranja'));
      expect(loc.color('cFF5722'), equals('Naranja oscuro'));
      expect(loc.color('c795548'), equals('Marrón'));
      expect(loc.color('c9E9E9E'), equals('Gris'));
      expect(loc.color('c607D8B'), equals('Azul grisáceo'));
      expect(
        loc.color('unknown'),
        equals('Color no reconocido'),
      );
    });
  });
}
