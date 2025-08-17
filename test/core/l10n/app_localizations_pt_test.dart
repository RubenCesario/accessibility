import 'package:accessibility/src/core/l10n/generated/app_localizations_pt.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsPt', () {
    late AccessibilityLocalizationsPt loc;

    setUp(() {
      loc = AccessibilityLocalizationsPt();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('pt'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Acessibilidade'));
      expect(
        loc.accessibility_settings,
        equals('Configurações de acessibilidade'),
      );
      expect(loc.adjust_background_colors, equals('Ajustar cores de fundo'));
      expect(loc.adjust_text_colors, equals('Ajustar cores do texto'));
      expect(loc.align_center, equals('Alinhar ao centro'));
      expect(loc.align_left, equals('Alinhar à esquerda'));
      expect(loc.align_right, equals('Alinhar à direita'));
      expect(loc.bold_text, equals('Texto em negrito'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Alterar texto em negrito'));
      expect(
        loc.change_pages_background_color,
        equals('Alterar a cor de fundo das páginas para: '),
      );
      expect(loc.change_text_color, equals('Alterar a cor do texto para: '));
      expect(
        loc.change_text_color_shade,
        equals('Alterar o tom da cor para: '),
      );
      expect(loc.color_adjustment, equals('Ajuste de cor'));
      expect(
        loc.color_profile_changed_to,
        equals('O perfil de cor atual é: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Diminuir espaçamento entre palavras'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Diminuir espaçamento entre letras'),
      );
      expect(loc.decrement_line_height, equals('Diminuir altura da linha'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Diminuir fator de escala do texto'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Aumentar espaçamento entre palavras'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Aumentar espaçamento entre letras'),
      );
      expect(loc.increment_line_height, equals('Aumentar altura da linha'));
      expect(
        loc.increment_text_scale_factor,
        equals('Aumentar fator de escala do texto'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Aumentar ou diminuir espaçamento entre palavras'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Aumentar ou diminuir espaçamento entre letras'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Aumentar ou diminuir altura da linha'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Aumentar ou diminuir tamanho do texto'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efeitos'));
      expect(loc.expand_text, equals('Expandir texto'));
      expect(loc.font_size, equals('Tamanho da fonte'));
      expect(loc.less_info, equals('Ocultar informações'));
      expect(loc.letter_spacing, equals('Espaçamento entre letras'));
      expect(loc.line_height, equals('Altura da linha'));
      expect(loc.more_info, equals('Mostrar informações'));
      expect(loc.word_spacing, equals('Espaçamento entre palavras'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Ler menos'));
      expect(loc.read_more, equals('Ler mais'));
      expect(loc.reduce_effects, equals('Reduzir efeitos na tela'));
      expect(loc.reduce_text, equals('Reduzir texto'));
      expect(loc.restore_settings, equals('Restaurar configurações'));
      expect(loc.restore_main_color, equals('Restaurar cor principal'));
      expect(
        loc.return_to_main_colors,
        equals('Voltar às cores principais'),
      );
      expect(loc.settings, equals('Configurações'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Tamanho e exibição de texto'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Controle deslizante de espaçamento entre palavras'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Controle deslizante de espaçamento entre letras'),
      );
      expect(
        loc.slider_line_height,
        equals('Controle deslizante de altura da linha'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Perfil de tema não reconhecido'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Seguro para epilepsia'));
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Deficiência visual'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Amigável para TDAH'),
      );
      expect(loc.theme_profile('none'), equals('Padrão'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Perfil seguro para epilepsia'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Remover reflexões e reduzir cor'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Este perfil permite que usuários com epilepsia e em '
          'risco de convulsões naveguem com segurança, '
          'eliminando o risco de convulsões resultantes de '
          'animações piscantes e combinações de cores '
          'arriscadas.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Perfil para deficiência visual'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Melhorar visibilidade do aplicativo'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Este perfil adapta o aplicativo para ser acessível à '
          'maioria das deficiências visuais, como baixa visão, '
          'visão em túnel, catarata, glaucoma e mais.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Perfil amigável para TDAH'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mais concentração e menos distrações'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Este perfil reduz significativamente as distrações, '
          'para ajudar pessoas com TDAH e transtornos do '
          'neurodesenvolvimento a navegar, ler e focar nos '
          'elementos essenciais do aplicativo com mais '
          'facilidade.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('As configurações foram redefinidas.'),
      );
      expect(loc.toggle_dark_mode, equals('Alternar modo escuro'));
      expect(loc.toggle_effects_mode, equals('Alternar modo de efeitos'));
      expect(loc.toggle_font_weight, equals('Alternar peso da fonte'));
      expect(loc.toggle_theme_profile, equals('Alternar perfil de tema'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(loc.color_profile('lowSaturation'), equals('Baixa saturação'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(loc.color_profile('highSaturation'), equals('Alta saturação'));
      expect(loc.color_profile('monochrome'), equals('Monocromático'));
      expect(loc.color_profile('highContrast'), equals('Alto contraste'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Cor não reconhecida'));
      expect(loc.color('cF44336'), equals('Vermelho'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Roxo'));
      expect(loc.color('c673AB7'), equals('Roxo escuro'));
      expect(loc.color('c3F51B5'), equals('Índigo'));
      expect(loc.color('c2196F3'), equals('Azul'));
      expect(loc.color('c03A9F4'), equals('Azul claro'));
      expect(loc.color('c00BCD4'), equals('Ciano'));
      expect(loc.color('c009688'), equals('Verde-azulado'));
      expect(loc.color('c4CAF50'), equals('Verde'));
      expect(loc.color('c8BC34A'), equals('Verde claro'));
      expect(loc.color('cCDDC39'), equals('Lima'));
      expect(loc.color('cFFEB3B'), equals('Amarelo'));
      expect(loc.color('cFFC107'), equals('Âmbar'));
      expect(loc.color('cFF9800'), equals('Laranja'));
      expect(loc.color('cFF5722'), equals('Laranja escuro'));
      expect(loc.color('c795548'), equals('Marrom'));
      expect(loc.color('c9E9E9E'), equals('Cinza'));
      expect(loc.color('c607D8B'), equals('Cinza azulado'));
    });
  });
}
