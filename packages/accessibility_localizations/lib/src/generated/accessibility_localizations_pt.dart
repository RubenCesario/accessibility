// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AccessibilityLocalizationsPt extends AccessibilityLocalizations {
  AccessibilityLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get accessibility => 'Acessibilidade';

  @override
  String get accessibilitySettings => 'Configurações de acessibilidade';

  @override
  String get adjustBackgroundColors => 'Ajustar cores de fundo';

  @override
  String get adjustTextColors => 'Ajustar cores do texto';

  @override
  String get alignCenter => 'Alinhar ao centro';

  @override
  String get alignLeft => 'Alinhar à esquerda';

  @override
  String get alignRight => 'Alinhar à direita';

  @override
  String get textAlignment => 'Alinhamento do texto';

  @override
  String get boldText => 'Texto em negrito';

  @override
  String get changeBoldText => 'Alterar texto em negrito';

  @override
  String get changePagesBackgroundColor =>
      'Alterar a cor de fundo das páginas para: ';

  @override
  String get changeTextColor => 'Alterar a cor do texto para: ';

  @override
  String get changeTextColorShade => 'Alterar o tom da cor para: ';

  @override
  String get colorAdjustment => 'Ajuste de cor';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => 'O perfil de cor atual é: ';

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
  String get decrementWordSpacing => 'Diminuir espaçamento entre palavras';

  @override
  String get decrementLetterSpacing => 'Diminuir espaçamento entre letras';

  @override
  String get decrementLineHeight => 'Diminuir altura da linha';

  @override
  String get decrementTextScaleFactor => 'Diminuir fator de escala do texto';

  @override
  String get effects => 'Efeitos';

  @override
  String get expandText => 'Expandir texto';

  @override
  String get fontSize => 'Tamanho da fonte';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Aumentar ou diminuir espaçamento entre palavras';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Aumentar ou diminuir espaçamento entre letras';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Aumentar ou diminuir altura da linha';

  @override
  String get increaseOrDecreaseTextSize =>
      'Aumentar ou diminuir tamanho do texto';

  @override
  String get incrementWordSpacing => 'Aumentar espaçamento entre palavras';

  @override
  String get incrementLetterSpacing => 'Aumentar espaçamento entre letras';

  @override
  String get incrementLineHeight => 'Aumentar altura da linha';

  @override
  String get incrementTextScaleFactor => 'Aumentar fator de escala do texto';

  @override
  String get lessInfo => 'Ocultar informações';

  @override
  String get letterSpacing => 'Espaçamento entre letras';

  @override
  String get lineHeight => 'Altura da linha';

  @override
  String get moreInfo => 'Mostrar informações';

  @override
  String get readLess => 'Ler menos';

  @override
  String get readMore => 'Ler mais';

  @override
  String get reduceEffects => 'Reduzir efeitos na tela';

  @override
  String get reduceText => 'Reduzir texto';

  @override
  String get restoreSettings => 'Restaurar configurações';

  @override
  String get restoreMainColor => 'Restaurar cor principal';

  @override
  String get returnToMainColors => 'Voltar às cores principais';

  @override
  String get settings => 'Configurações';

  @override
  String get sizeAndTextDisplay => 'Tamanho e exibição de texto';

  @override
  String get sliderWordSpacing =>
      'Controle deslizante de espaçamento entre palavras';

  @override
  String get sliderLetterSpacing =>
      'Controle deslizante de espaçamento entre letras';

  @override
  String get sliderLineHeight => 'Controle deslizante de altura da linha';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Perfil de tema não reconhecido',
      'seizureSafe': 'Seguro para epilepsia',
      'visionImpaired': 'Deficiência visual',
      'adhdFriendly': 'Amigável para TDAH',
      'none': 'Perfil padrão',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Perfil seguro para epilepsia';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Remover reflexões e reduzir cor';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Este perfil permite que usuários com epilepsia e em risco de convulsões naveguem com segurança, eliminando o risco de convulsões resultantes de animações piscantes e combinações de cores arriscadas.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Perfil para deficiência visual';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Melhorar visibilidade do aplicativo';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Este perfil adapta o aplicativo para ser acessível à maioria das deficiências visuais, como baixa visão, visão em túnel, catarata, glaucoma e mais.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Perfil amigável para TDAH';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mais concentração e menos distrações';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Este perfil reduz significativamente as distrações, para ajudar pessoas com TDAH e transtornos do neurodesenvolvimento a navegar, ler e focar nos elementos essenciais do aplicativo com mais facilidade.';

  @override
  String get theSettingsHaveBeenReset => 'As configurações foram redefinidas.';

  @override
  String get toggleDarkMode => 'Alternar modo escuro';

  @override
  String get toggleEffectsMode => 'Alternar modo de efeitos';

  @override
  String get toggleFontWeight => 'Alternar peso da fonte';

  @override
  String get toggleThemeProfile => 'Alternar perfil de tema';

  @override
  String get wordSpacing => 'Espaçamento entre palavras';

  @override
  String get accessibleFont => 'Fonte acessível';

  @override
  String get accessibleFontSubtitle =>
      'Use uma fonte acessível para melhor legibilidade';

  @override
  String get accessibleFontEnabled => 'Fonte acessível ativada';

  @override
  String get accessibleFontDisabled => 'Fonte acessível desativada';

  @override
  String get toggleAccessibleFont => 'Alternar fonte acessível';

  @override
  String get settingsLoading =>
      'Carregando as configurações de acessibilidade…';

  @override
  String get settingsLoadFailed =>
      'Não foi possível carregar as configurações de acessibilidade.';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get themeModeSystem => 'Sistema';

  @override
  String get themeModeLight => 'Claro';

  @override
  String get themeModeDark => 'Escuro';

  @override
  String get effectsModeSystem => 'Sistema';

  @override
  String get effectsModeEnabled => 'Ativado';

  @override
  String get effectsModeDisabled => 'Desativado';
}
