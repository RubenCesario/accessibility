// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AccessibilityLocalizationsPt extends AccessibilityLocalizations {
  AccessibilityLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get accessibility => 'Acessibilidade';

  @override
  String get accessibility_settings => 'Configurações de acessibilidade';

  @override
  String get adjust_background_colors => 'Ajustar cores de fundo';

  @override
  String get adjust_text_colors => 'Ajustar cores do texto';

  @override
  String get align_center => 'Alinhar ao centro';

  @override
  String get align_left => 'Alinhar à esquerda';

  @override
  String get align_right => 'Alinhar à direita';

  @override
  String get bold_text => 'Texto em negrito';

  @override
  String get change_bold_text => 'Alterar texto em negrito';

  @override
  String get change_pages_background_color =>
      'Alterar a cor de fundo das páginas para: ';

  @override
  String get change_text_color => 'Alterar a cor do texto para: ';

  @override
  String get change_text_color_shade => 'Alterar o tom da cor para: ';

  @override
  String get color_adjustment => 'Ajuste de cor';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Baixa saturação',
      'normal': 'Normal',
      'highSaturation': 'Alta saturação',
      'monochrome': 'Monocromático',
      'highContrast': 'Alto contraste',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'O perfil de cor atual é: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Cor não reconhecida',
      'cF44336': 'Vermelho',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Roxo',
      'c673AB7': 'Roxo escuro',
      'c3F51B5': 'Índigo',
      'c2196F3': 'Azul',
      'c03A9F4': 'Azul claro',
      'c00BCD4': 'Ciano',
      'c009688': 'Verde-azulado',
      'c4CAF50': 'Verde',
      'c8BC34A': 'Verde claro',
      'cCDDC39': 'Lima',
      'cFFEB3B': 'Amarelo',
      'cFFC107': 'Âmbar',
      'cFF9800': 'Laranja',
      'cFF5722': 'Laranja escuro',
      'c795548': 'Marrom',
      'c9E9E9E': 'Cinza',
      'c607D8B': 'Cinza azulado',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Diminuir espaçamento entre palavras';

  @override
  String get decrement_letter_spacing => 'Diminuir espaçamento entre letras';

  @override
  String get decrement_line_height => 'Diminuir altura da linha';

  @override
  String get decrement_text_scale_factor => 'Diminuir fator de escala do texto';

  @override
  String get effects => 'Efeitos';

  @override
  String get expand_text => 'Expandir texto';

  @override
  String get font_size => 'Tamanho da fonte';

  @override
  String get increase_or_decrease_word_spacing =>
      'Aumentar ou diminuir espaçamento entre palavras';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Aumentar ou diminuir espaçamento entre letras';

  @override
  String get increase_or_decrease_line_height =>
      'Aumentar ou diminuir altura da linha';

  @override
  String get increase_or_decrease_text_size =>
      'Aumentar ou diminuir tamanho do texto';

  @override
  String get increment_word_spacing => 'Aumentar espaçamento entre palavras';

  @override
  String get increment_letter_spacing => 'Aumentar espaçamento entre letras';

  @override
  String get increment_line_height => 'Aumentar altura da linha';

  @override
  String get increment_text_scale_factor => 'Aumentar fator de escala do texto';

  @override
  String get less_info => 'Ocultar informações';

  @override
  String get letter_spacing => 'Espaçamento entre letras';

  @override
  String get line_height => 'Altura da linha';

  @override
  String get more_info => 'Mostrar informações';

  @override
  String get read_less => 'Ler menos';

  @override
  String get read_more => 'Ler mais';

  @override
  String get reduce_effects => 'Reduzir efeitos na tela';

  @override
  String get reduce_text => 'Reduzir texto';

  @override
  String get restore_settings => 'Restaurar configurações';

  @override
  String get restore_main_color => 'Restaurar cor principal';

  @override
  String get return_to_main_colors => 'Voltar às cores principais';

  @override
  String get settings => 'Configurações';

  @override
  String get size_and_text_display => 'Tamanho e exibição de texto';

  @override
  String get slider_word_spacing =>
      'Controle deslizante de espaçamento entre palavras';

  @override
  String get slider_letter_spacing =>
      'Controle deslizante de espaçamento entre letras';

  @override
  String get slider_line_height => 'Controle deslizante de altura da linha';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Perfil de tema não reconhecido',
      'seizureSafe': 'Seguro para epilepsia',
      'visionImpaired': 'Deficiência visual',
      'adhdFriendly': 'Amigável para TDAH',
      'none': 'Padrão',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Perfil seguro para epilepsia';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Remover reflexões e reduzir cor';

  @override
  String get theme_profile_seizure_safe_description =>
      'Este perfil permite que usuários com epilepsia e em risco de convulsões naveguem com segurança, eliminando o risco de convulsões resultantes de animações piscantes e combinações de cores arriscadas.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Perfil para deficiência visual';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Melhorar visibilidade do aplicativo';

  @override
  String get theme_profile_vision_impaired_description =>
      'Este perfil adapta o aplicativo para ser acessível à maioria das deficiências visuais, como baixa visão, visão em túnel, catarata, glaucoma e mais.';

  @override
  String get theme_profile_adhd_friendly_title => 'Perfil amigável para TDAH';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mais concentração e menos distrações';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Este perfil reduz significativamente as distrações, para ajudar pessoas com TDAH e transtornos do neurodesenvolvimento a navegar, ler e focar nos elementos essenciais do aplicativo com mais facilidade.';

  @override
  String get the_settings_have_been_reset =>
      'As configurações foram redefinidas.';

  @override
  String get toggle_dark_mode => 'Alternar modo escuro';

  @override
  String get toggle_effects_mode => 'Alternar modo de efeitos';

  @override
  String get toggle_font_weight => 'Alternar peso da fonte';

  @override
  String get toggle_theme_profile => 'Alternar perfil de tema';

  @override
  String get word_spacing => 'Espaçamento entre palavras';
}
