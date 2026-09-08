// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AccessibilityLocalizationsFi extends AccessibilityLocalizations {
  AccessibilityLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get accessibility => 'Esteettömyys';

  @override
  String get accessibilitySettings => 'Esteettömyysasetukset';

  @override
  String get adjustBackgroundColors => 'Säädä taustavärejä';

  @override
  String get adjustTextColors => 'Säädä tekstin värejä';

  @override
  String get alignCenter => 'Keskitä';

  @override
  String get alignLeft => 'Tasaa vasemmalle';

  @override
  String get alignRight => 'Tasaa oikealle';

  @override
  String get textAlignment => 'Tekstin tasaus';

  @override
  String get boldText => 'Lihavoitu teksti';

  @override
  String get changeBoldText => 'Muuta lihavoitua tekstiä';

  @override
  String get changePagesBackgroundColor => 'Muuta sivujen taustaväri: ';

  @override
  String get changeTextColor => 'Muuta tekstin väri: ';

  @override
  String get changeTextColorShade => 'Muuta värin sävyä: ';

  @override
  String get colorAdjustment => 'Värien säätäminen';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normaali',
      'lowSaturation': 'Matala värikylläisyys',
      'normal': 'Normaali',
      'highSaturation': 'Korkea värikylläisyys',
      'monochrome': 'Mustavalko',
      'highContrast': 'Korkea kontrasti',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Nykyinen väriprofiili on: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Väriä ei tunnistettu',
      'cF44336': 'Punainen',
      'cE91E63': 'Pinkki',
      'c9C27B0': 'Violetti',
      'c673AB7': 'Tumma violetti',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Sininen',
      'c03A9F4': 'Vaalean sininen',
      'c00BCD4': 'Syaani',
      'c009688': 'Turkoosi',
      'c4CAF50': 'Vihreä',
      'c8BC34A': 'Vaalean vihreä',
      'cCDDC39': 'Lime',
      'cFFEB3B': 'Keltainen',
      'cFFC107': 'Meripihka',
      'cFF9800': 'Oranssi',
      'cFF5722': 'Syvä oranssi',
      'c795548': 'Ruskea',
      'c9E9E9E': 'Harmaa',
      'c607D8B': 'Siniharmaa',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Pienennä sanaetäisyyttä';

  @override
  String get decrementLetterSpacing => 'Pienennä kirjainvälejä';

  @override
  String get decrementLineHeight => 'Pienennä rivikorkeuttä';

  @override
  String get decrementTextScaleFactor => 'Pienennä tekstin skaalauskerrointa';

  @override
  String get effects => 'Tehosteet';

  @override
  String get expandText => 'Laajenna tekstiä';

  @override
  String get fontSize => 'Fonttikoko';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Lisää tai vähennä sanaetäisyyttä';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Lisää tai vähennä kirjainvälejä';

  @override
  String get increaseOrDecreaseLineHeight => 'Lisää tai vähennä rivikorkeutta';

  @override
  String get increaseOrDecreaseTextSize => 'Lisää tai vähennä tekstin kokoa';

  @override
  String get incrementWordSpacing => 'Kasvata sanaetäisyyttä';

  @override
  String get incrementLetterSpacing => 'Kasvata kirjainvälejä';

  @override
  String get incrementLineHeight => 'Kasvata rivikorkeutta';

  @override
  String get incrementTextScaleFactor => 'Kasvata tekstin skaalauskerrointa';

  @override
  String get lessInfo => 'Piilota tiedot';

  @override
  String get letterSpacing => 'Kirjainväli';

  @override
  String get lineHeight => 'Rivikorkeus';

  @override
  String get moreInfo => 'Näytä tiedot';

  @override
  String get readLess => 'Lue vähemmän';

  @override
  String get readMore => 'Lue lisää';

  @override
  String get reduceEffects => 'Vähennä näytön tehosteita';

  @override
  String get reduceText => 'Pienennä tekstiä';

  @override
  String get restoreSettings => 'Palauta asetukset';

  @override
  String get restoreMainColor => 'Palauta pääväri';

  @override
  String get returnToMainColors => 'Palaa pääväreihin';

  @override
  String get settings => 'Asetukset';

  @override
  String get sizeAndTextDisplay => 'Koko ja tekstin näyttö';

  @override
  String get sliderWordSpacing => 'Sanaetäisyyden liukusäädin';

  @override
  String get sliderLetterSpacing => 'Kirjainvälin liukusäädin';

  @override
  String get sliderLineHeight => 'Rivikorkeuden liukusäädin';

  @override
  String get themeMode => 'Teema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Teemaprofiilia ei tunnistettu',
      'seizureSafe': 'Kohtausturvallinen',
      'visionImpaired': 'Näkövammainen',
      'adhdFriendly': 'ADHD-ystävällinen',
      'none': 'Oletusprofiili',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Kohtausturvallinen profiili';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Poista heijastukset ja vähennä väriä';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Tämä profiili mahdollistaa käyttäjille, joilla on epilepsia ja jotka ovat alttiita kohtauksille, turvallisen selaamisen poistamalla välkkyvien animaatioiden ja riskialttiiden väriyhdistelmien aiheuttamat kohtausriskit.';

  @override
  String get themeProfileVisionImpairedTitle => 'Näkövammainen profiili';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Paranna sovelluksen näkyvyyttä';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Tämä profiili mukauttaa sovelluksen saavutettavaksi useimmille näkövammoille, kuten näkövammaisuus, putkinäkö, kaihi, glaukooma ja muut.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-ystävällinen profiili';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Enemmän keskittymistä ja vähemmän häiriöitä';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Tämä profiili vähentää merkittävästi häiriötekijöitä auttaakseen ADHD:sta ja neuropsykiatrisista häiriöistä kärsiviä ihmisiä navigoimaan, lukemaan ja keskittymään sovelluksen olennaisiin elementteihin helpommin.';

  @override
  String get theSettingsHaveBeenReset => 'Asetukset on palautettu.';

  @override
  String get toggleDarkMode => 'Vaihda tumma tila';

  @override
  String get toggleEffectsMode => 'Vaihda tehosteita';

  @override
  String get toggleFontWeight => 'Vaihda fontin paksuutta';

  @override
  String get toggleThemeProfile => 'Vaihda teemaprofiilia';

  @override
  String get wordSpacing => 'Sanaetäisyys';

  @override
  String get accessibleFont => 'Saavutettava fontti';

  @override
  String get accessibleFontSubtitle =>
      'Käytä helppolukuista fonttia paremman luettavuuden saavuttamiseksi';

  @override
  String get accessibleFontEnabled => 'Saavutettava fontti käytössä';

  @override
  String get accessibleFontDisabled => 'Saavutettava fontti pois käytöstä';

  @override
  String get toggleAccessibleFont => 'Vaihda saavutettavaa fonttia';

  @override
  String get settingsLoading => 'Ladataan esteettömyysasetuksia…';

  @override
  String get settingsLoadFailed => 'Esteettömyysasetuksia ei voitu ladata.';

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get themeModeSystem => 'Järjestelmä';

  @override
  String get themeModeLight => 'Vaalea';

  @override
  String get themeModeDark => 'Tumma';

  @override
  String get effectsModeSystem => 'Järjestelmä';

  @override
  String get effectsModeEnabled => 'Päällä';

  @override
  String get effectsModeDisabled => 'Pois päältä';
}
