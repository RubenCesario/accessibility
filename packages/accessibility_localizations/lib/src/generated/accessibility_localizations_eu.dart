// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AccessibilityLocalizationsEu extends AccessibilityLocalizations {
  AccessibilityLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get accessibility => 'Irisgarritasuna';

  @override
  String get accessibilitySettings => 'Irisgarritasun ezarpenak';

  @override
  String get adjustBackgroundColors => 'Doitu atzeko planoko koloreak';

  @override
  String get adjustTextColors => 'Doitu testuaren koloreak';

  @override
  String get alignCenter => 'Erdiratu';

  @override
  String get alignLeft => 'Ezkerrera lerrokatu';

  @override
  String get alignRight => 'Eskuinera lerrokatu';

  @override
  String get textAlignment => 'Testuaren lerrokatzea';

  @override
  String get boldText => 'Testu lodia';

  @override
  String get changeBoldText => 'Aldatu testuaren lodiera';

  @override
  String get changePagesBackgroundColor =>
      'Aldatu orrien atzeko planoaren kolorea honetara: ';

  @override
  String get changeTextColor => 'Aldatu testuaren kolorea honetara: ';

  @override
  String get changeTextColorShade => 'Aldatu kolorearen itzala honetara: ';

  @override
  String get colorAdjustment => 'Koloreen doikuntza';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normala',
      'lowSaturation': 'Saturazioa baxua',
      'normal': 'Normala',
      'highSaturation': 'Saturazioa altua',
      'monochrome': 'Monokromatikoa',
      'highContrast': 'Kontraste altua',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Uneko kolore profila hau da: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Kolorea ez da ezagutu',
      'cF44336': 'Gorria',
      'cE91E63': 'Arrosa',
      'c9C27B0': 'Morea',
      'c673AB7': 'More sakona',
      'c3F51B5': 'Indigoa',
      'c2196F3': 'Urdina',
      'c03A9F4': 'Urdin argia',
      'c00BCD4': 'Ziana',
      'c009688': 'Urdin berdexka',
      'c4CAF50': 'Berdea',
      'c8BC34A': 'Berde argia',
      'cCDDC39': 'Lima',
      'cFFEB3B': 'Horia',
      'cFFC107': 'Anbar',
      'cFF9800': 'Laranja',
      'cFF5722': 'Laranja sakona',
      'c795548': 'Marroia',
      'c9E9E9E': 'Grisa',
      'c607D8B': 'Urdin grisaxka',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Gutxitu hitzen arteko espazioa';

  @override
  String get decrementLetterSpacing => 'Gutxitu letren arteko espazioa';

  @override
  String get decrementLineHeight => 'Gutxitu lerroaren altuera';

  @override
  String get decrementTextScaleFactor => 'Gutxitu testuaren eskala faktorea';

  @override
  String get effects => 'Efektuak';

  @override
  String get expandText => 'Zabaldu testua';

  @override
  String get fontSize => 'Letra tamaina';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Handitu edo gutxitu hitzen arteko espazioa';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Handitu edo gutxitu letren arteko espazioa';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Handitu edo gutxitu lerroaren altuera';

  @override
  String get increaseOrDecreaseTextSize =>
      'Handitu edo gutxitu testuaren tamaina';

  @override
  String get incrementWordSpacing => 'Handitu hitzen arteko espazioa';

  @override
  String get incrementLetterSpacing => 'Handitu letren arteko espazioa';

  @override
  String get incrementLineHeight => 'Handitu lerroaren altuera';

  @override
  String get incrementTextScaleFactor => 'Handitu testuaren eskala faktorea';

  @override
  String get lessInfo => 'Ezkutatu informazioa';

  @override
  String get letterSpacing => 'Letren arteko espazioa';

  @override
  String get lineHeight => 'Lerroaren altuera';

  @override
  String get moreInfo => 'Erakutsi informazioa';

  @override
  String get readLess => 'Irakurri gutxiago';

  @override
  String get readMore => 'Irakurri gehiago';

  @override
  String get reduceEffects => 'Gutxitu pantailaren efektuak';

  @override
  String get reduceText => 'Txikiagotu testua';

  @override
  String get restoreSettings => 'Leheneratu ezarpenak';

  @override
  String get restoreMainColor => 'Leheneratu kolore nagusia';

  @override
  String get returnToMainColors => 'Itzuli kolore nagusietara';

  @override
  String get settings => 'Ezarpenak';

  @override
  String get sizeAndTextDisplay => 'Tamaina eta testu bistaratzea';

  @override
  String get sliderWordSpacing => 'Hitzen arteko espazioa irristatzailearekin';

  @override
  String get sliderLetterSpacing =>
      'Letren arteko espazioa irristatzailearekin';

  @override
  String get sliderLineHeight => 'Lerro altuera irristatzailearekin';

  @override
  String get themeMode => 'Gaia';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Ez da gai profila ezagutzen',
      'seizureSafe': 'Krisi epileptikoetarako segurua',
      'visionImpaired': 'Ikusmen urritasunerako',
      'adhdFriendly': 'AGNH-lagungarria',
      'none': 'Profil lehenetsia',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'Krisi epileptikoetarako profil segurua';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Kendu islak eta murriztu kolorea';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Profil honek epilepsia duten eta krisi epileptikoen arriskuan dauden erabiltzaileei modu seguruan nabigatzeko aukera ematen die, animazio distiratsuek eta kolore konbinazio arriskutsuek eragin ditzaketen krisien arriskuak ezabatuz.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Ikusmen urritasunerako profila';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Hobetu aplikazioaren ikusgaitasuna';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Profil honek aplikazioa ikusmen urritasun gehienetarako irisgarria izateko moldatzen du, hala nola ikusmen urritasuna, tunel ikusmena, kataratak, glaukoma eta abar.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'AGNH-lagungarri profila';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Kontzentrazio gehiago eta distrakzio gutxiago';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Profil honek nabarmen gutxitzen ditu distrakzioak, AGNH (Arreta Gabe eta Hiperaktibitate Nahasmendua) eta garapen neurologikoko nahasmenduak dituzten pertsonei aplikazioaren funtsezko elementuetan errazago nabigatzen, irakurtzen eta arreta jartzen laguntzeko.';

  @override
  String get theSettingsHaveBeenReset => 'Ezarpenak berrezarri dira.';

  @override
  String get toggleDarkMode => 'Modu iluna txandakatu';

  @override
  String get toggleEffectsMode => 'Efektuen modua txandakatu';

  @override
  String get toggleFontWeight => 'Letraren pisua txandakatu';

  @override
  String get toggleThemeProfile => 'Gai profila txandakatu';

  @override
  String get wordSpacing => 'Hitzen arteko espazioa';

  @override
  String get accessibleFont => 'Irisgarritasun letra-tipoa';

  @override
  String get accessibleFontSubtitle =>
      'Erabili letra-tipo eskuragarri bat irakurgarritasun hobea lortzeko';

  @override
  String get accessibleFontEnabled => 'Irisgarritasun letra-tipoa gaituta';

  @override
  String get accessibleFontDisabled => 'Irisgarritasun letra-tipoa desgaituta';

  @override
  String get toggleAccessibleFont => 'Irisgarritasun letra-tipoa txandakatu';

  @override
  String get settingsLoading => 'Irisgarritasun ezarpenak kargatzen…';

  @override
  String get settingsLoadFailed =>
      'Ezin izan dira irisgarritasun ezarpenak kargatu.';

  @override
  String get retry => 'Saiatu berriro';

  @override
  String get themeModeSystem => 'Sistema';

  @override
  String get themeModeLight => 'Argia';

  @override
  String get themeModeDark => 'Iluna';

  @override
  String get effectsModeSystem => 'Sistema';

  @override
  String get effectsModeEnabled => 'Aktibatuta';

  @override
  String get effectsModeDisabled => 'Desaktibatuta';
}
