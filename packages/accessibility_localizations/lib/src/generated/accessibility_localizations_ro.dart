// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AccessibilityLocalizationsRo extends AccessibilityLocalizations {
  AccessibilityLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get accessibility => 'Accesibilitate';

  @override
  String get accessibilitySettings => 'Setări de accesibilitate';

  @override
  String get adjustBackgroundColors => 'Ajustează culorile de fundal';

  @override
  String get adjustTextColors => 'Ajustează culorile textului';

  @override
  String get alignCenter => 'Aliniere centru';

  @override
  String get alignLeft => 'Aliniere stânga';

  @override
  String get alignRight => 'Aliniere dreapta';

  @override
  String get textAlignment => 'Alinierea textului';

  @override
  String get boldText => 'Text îngroșat';

  @override
  String get changeBoldText => 'Schimbă textul îngroșat';

  @override
  String get changePagesBackgroundColor =>
      'Schimbă culoarea de fundal a paginilor în: ';

  @override
  String get changeTextColor => 'Schimbă culoarea textului în: ';

  @override
  String get changeTextColorShade => 'Schimbă nuanța culorii în: ';

  @override
  String get colorAdjustment => 'Ajustare culoare';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Saturație scăzută',
      'normal': 'Normal',
      'highSaturation': 'Saturație ridicată',
      'monochrome': 'Monocrom',
      'highContrast': 'Contrast ridicat',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Profilul de culoare actual este: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Culoare nerecunoscută',
      'cF44336': 'Roșu',
      'cE91E63': 'Roz',
      'c9C27B0': 'Violet',
      'c673AB7': 'Violet închis',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Albastru',
      'c03A9F4': 'Albastru deschis',
      'c00BCD4': 'Cyan',
      'c009688': 'Turcoaz',
      'c4CAF50': 'Verde',
      'c8BC34A': 'Verde deschis',
      'cCDDC39': 'Verde lime',
      'cFFEB3B': 'Galben',
      'cFFC107': 'Chihlimbar',
      'cFF9800': 'Portocaliu',
      'cFF5722': 'Portocaliu închis',
      'c795548': 'Maro',
      'c9E9E9E': 'Gri',
      'c607D8B': 'Gri-albastru',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Micșorează spațierea cuvintelor';

  @override
  String get decrementLetterSpacing => 'Micșorează spațierea literelor';

  @override
  String get decrementLineHeight => 'Micșorează înălțimea liniei';

  @override
  String get decrementTextScaleFactor =>
      'Micșorează factorul de scalare a textului';

  @override
  String get effects => 'Efecte';

  @override
  String get expandText => 'Extinde textul';

  @override
  String get fontSize => 'Dimensiunea fontului';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Mărește sau micșorează spațierea cuvintelor';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Mărește sau micșorează spațierea literelor';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Mărește sau micșorează înălțimea liniei';

  @override
  String get increaseOrDecreaseTextSize =>
      'Mărește sau micșorează dimensiunea textului';

  @override
  String get incrementWordSpacing => 'Mărește spațierea cuvintelor';

  @override
  String get incrementLetterSpacing => 'Mărește spațierea literelor';

  @override
  String get incrementLineHeight => 'Mărește înălțimea liniei';

  @override
  String get incrementTextScaleFactor =>
      'Mărește factorul de scalare a textului';

  @override
  String get lessInfo => 'Ascunde informații';

  @override
  String get letterSpacing => 'Spațierea literelor';

  @override
  String get lineHeight => 'Înălțimea liniei';

  @override
  String get moreInfo => 'Arată informații';

  @override
  String get readLess => 'Citește mai puțin';

  @override
  String get readMore => 'Citește mai mult';

  @override
  String get reduceEffects => 'Reduce efectele pe ecran';

  @override
  String get reduceText => 'Reduce textul';

  @override
  String get restoreSettings => 'Restaurează setările';

  @override
  String get restoreMainColor => 'Restaurează culoarea principală';

  @override
  String get returnToMainColors => 'Revino la culorile principale';

  @override
  String get settings => 'Setări';

  @override
  String get sizeAndTextDisplay => 'Dimensiune și afișare text';

  @override
  String get sliderWordSpacing => 'Glisor pentru spațierea cuvintelor';

  @override
  String get sliderLetterSpacing => 'Glisor pentru spațierea literelor';

  @override
  String get sliderLineHeight => 'Glisor pentru înălțimea liniei';

  @override
  String get themeMode => 'Temă';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil de temă nerecunoscut',
      'seizureSafe': 'Sigur pentru epilepsie',
      'visionImpaired': 'Deficiență de vedere',
      'adhdFriendly': 'Prietenos pentru ADHD',
      'none': 'Profil implicit',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil sigur pentru epilepsie';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Elimină reflexiile și reduce culoarea';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Acest profil permite utilizatorilor care au epilepsie și sunt în risc de convulsii să navigheze în siguranță, eliminând riscul convulsiilor care rezultă din animații intermitente și combinații de culori riscante.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profil pentru deficiențe de vedere';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Îmbunătățește vizibilitatea aplicației';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Acest profil adaptează aplicația pentru a fi accesibilă majorității deficiențelor vizuale, cum ar fi deficiența de vedere, vederea de tunel, cataracta, glaucomul și altele.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil prietenos pentru ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mai multă concentrare și mai puține distracții';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Acest profil reduce semnificativ distracțiile, pentru a ajuta persoanele cu ADHD și tulburări de neurodezvoltare să navigheze, să citească și să se concentreze pe elementele esențiale ale aplicației mai ușor.';

  @override
  String get theSettingsHaveBeenReset => 'Setările au fost resetate.';

  @override
  String get toggleDarkMode => 'Comută modul întunecat';

  @override
  String get toggleEffectsMode => 'Comută modul de efecte';

  @override
  String get toggleFontWeight => 'Comută grosimea fontului';

  @override
  String get toggleThemeProfile => 'Comută profilul de temă';

  @override
  String get wordSpacing => 'Spațierea cuvintelor';

  @override
  String get accessibleFont => 'Font accesibil';

  @override
  String get accessibleFontSubtitle =>
      'Folosește un font accesibil pentru o lizibilitate mai bună';

  @override
  String get accessibleFontEnabled => 'Font accesibil activat';

  @override
  String get accessibleFontDisabled => 'Font accesibil dezactivat';

  @override
  String get toggleAccessibleFont => 'Comută fontul accesibil';

  @override
  String get settingsLoading => 'Se încarcă setările de accesibilitate…';

  @override
  String get settingsLoadFailed =>
      'Setările de accesibilitate nu au putut fi încărcate.';

  @override
  String get retry => 'Încearcă din nou';
}
