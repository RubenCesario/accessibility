// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AccessibilityLocalizationsIt extends AccessibilityLocalizations {
  AccessibilityLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get accessibility => 'Accessibilità';

  @override
  String get accessibilitySettings => 'Impostazioni accessibilità';

  @override
  String get adjustBackgroundColors => 'Regola i colori dello sfondo';

  @override
  String get adjustTextColors => 'Regola i colori del testo';

  @override
  String get alignCenter => 'Allinea al centro';

  @override
  String get alignLeft => 'Allinea a sinistra';

  @override
  String get alignRight => 'Allinea a destra';

  @override
  String get textAlignment => 'Allineamento del testo';

  @override
  String get boldText => 'Testo in grassetto';

  @override
  String get changeBoldText => 'Formatta tutto il testo in grassetto';

  @override
  String get changePagesBackgroundColor =>
      'Cambia il colore di sfondo delle pagine in: ';

  @override
  String get changeTextColor => 'Cambia il colore del testo in: ';

  @override
  String get changeTextColorShade =>
      'Cambia la tonalità del colore scelto in: ';

  @override
  String get colorAdjustment => 'Regolazione del colore';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Tema normale',
      'lowSaturation': 'Saturazione bassa',
      'normal': 'Tema normale',
      'highSaturation': 'Saturazione elevata',
      'monochrome': 'Monocromatico',
      'highContrast': 'Contrasto elevato',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Il profilo di colore corrente è: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Colore non riconosciuto',
      'cF44336': 'Rosso',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Viola',
      'c673AB7': 'Viola scuro',
      'c3F51B5': 'Indaco',
      'c2196F3': 'Blu',
      'c03A9F4': 'Azzurro',
      'c00BCD4': 'Ciano',
      'c009688': 'Turchese',
      'c4CAF50': 'Verde',
      'c8BC34A': 'Verde chiaro',
      'cCDDC39': 'Lime',
      'cFFEB3B': 'Giallo',
      'cFFC107': 'Ambra',
      'cFF9800': 'Arancione',
      'cFF5722': 'Arancione scuro',
      'c795548': 'Marrone',
      'c9E9E9E': 'Grigio',
      'c607D8B': 'Grigio bluastro',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Diminuisci spaziatura parole';

  @override
  String get decrementLetterSpacing => 'Diminuisci spaziatura lettere';

  @override
  String get decrementLineHeight => 'Diminuisci altezza righe';

  @override
  String get decrementTextScaleFactor => 'Diminuisci dimensione carattere';

  @override
  String get effects => 'Effetti';

  @override
  String get expandText => 'Espandi testo';

  @override
  String get fontSize => 'Dimensioni carattere';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Aumenta o riduci lo spaziatura delle parole';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Aumenta o riduci lo spaziatura delle lettere';

  @override
  String get increaseOrDecreaseLineHeight => 'Aumenta o riduci l\'interlinea';

  @override
  String get increaseOrDecreaseTextSize =>
      'Aumenta o riduci la dimensione del testo';

  @override
  String get incrementWordSpacing => 'Aumenta la spaziatura delle parole';

  @override
  String get incrementLetterSpacing => 'Aumenta la spaziatura delle lettere';

  @override
  String get incrementLineHeight => 'Aumenta l\'interlinea';

  @override
  String get incrementTextScaleFactor => 'Aumenta la dimensione del carattere';

  @override
  String get lessInfo => 'Nascondi info';

  @override
  String get letterSpacing => 'Spaziatura lettere';

  @override
  String get lineHeight => 'Altezza righe';

  @override
  String get moreInfo => 'Mostra info';

  @override
  String get readLess => 'Mostra meno';

  @override
  String get readMore => 'Leggi tutto';

  @override
  String get reduceEffects => 'Meno effetti a schermo';

  @override
  String get reduceText => 'Riduci testo';

  @override
  String get restoreSettings => 'Ripristina impostazioni';

  @override
  String get restoreMainColor => 'Ripristina colore iniziale';

  @override
  String get returnToMainColors => 'Torna ai colori principali';

  @override
  String get settings => 'Impostazioni';

  @override
  String get sizeAndTextDisplay => 'Regolazione dei contenuti';

  @override
  String get sliderWordSpacing => 'Slider Spaziatura parole';

  @override
  String get sliderLetterSpacing => 'Slider Spaziatura lettere';

  @override
  String get sliderLineHeight => 'Slider Altezza righe';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Tema non riconosciuto',
      'seizureSafe': 'Profilo a prova di convulsioni',
      'visionImpaired': 'Profilo delle persone ipovedenti',
      'adhdFriendly': 'Profilo adattato all\'ADHD',
      'none': 'Profilo default',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profilo a prova di convulsioni';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Elimina i riflessi e riduce il colore';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Questo profilo consente agli utenti epilettici e a rischio di convulsioni di navigare in tutta sicurezza eliminando il rischio di convulsioni derivanti da animazioni lampeggianti e combinazioni di colori rischiose.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profilo delle persone ipovedenti';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Migliora la visibilità dell\'applicazione';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Questo profilo adatta l\'applicazione in modo che sia accessibile alla maggior parte delle disabilità visive, come il deterioramento della vista, la visione a tunnel, la cataratta, il glaucoma e altre ancora.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profilo adatto all\'ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Più concentrazione e meno distrazioni';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Questo profilo riduce in modo significativo le distrazioni, per aiutare le persone con ADHD e disturbi del neurosviluppo a navigare, leggere e concentrarsi più facilmente sugli elementi essenziali dell\'applicazione.';

  @override
  String get theSettingsHaveBeenReset =>
      'Le impostazioni sono state ripristinate.';

  @override
  String get toggleDarkMode => 'Passa al tema scuro';

  @override
  String get toggleEffectsMode => 'Cambia modalità effetti';

  @override
  String get toggleFontWeight => 'Cambia peso del font';

  @override
  String get toggleThemeProfile => 'Cambia profilo tema a';

  @override
  String get wordSpacing => 'Spaziatura parole';

  @override
  String get accessibleFont => 'Font accessibile';

  @override
  String get accessibleFontSubtitle =>
      'Usa un carattere accessibile per una migliore leggibilità';

  @override
  String get accessibleFontEnabled => 'Font accessibile attivato';

  @override
  String get accessibleFontDisabled => 'Font accessibile disattivato';

  @override
  String get toggleAccessibleFont => 'Cambia font accessibile';

  @override
  String get settingsLoading =>
      'Caricamento delle impostazioni di accessibilità…';

  @override
  String get settingsLoadFailed =>
      'Impossibile caricare le impostazioni di accessibilità.';

  @override
  String get retry => 'Riprova';
}
