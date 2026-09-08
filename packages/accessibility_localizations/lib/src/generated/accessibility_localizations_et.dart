// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AccessibilityLocalizationsEt extends AccessibilityLocalizations {
  AccessibilityLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get accessibility => 'Ligipääsetavus';

  @override
  String get accessibilitySettings => 'Ligipääsetavuse seaded';

  @override
  String get adjustBackgroundColors => 'Kohanda taustavärve';

  @override
  String get adjustTextColors => 'Kohanda tekstivärve';

  @override
  String get alignCenter => 'Joonda keskele';

  @override
  String get alignLeft => 'Joonda vasakule';

  @override
  String get alignRight => 'Joonda paremale';

  @override
  String get textAlignment => 'Teksti joondus';

  @override
  String get boldText => 'Rasvane tekst';

  @override
  String get changeBoldText => 'Muuda teksti paksust';

  @override
  String get changePagesBackgroundColor =>
      'Muuda lehtede taustavärv järgnevaks: ';

  @override
  String get changeTextColor => 'Muuda teksti värv järgnevaks: ';

  @override
  String get changeTextColorShade => 'Muuda värvitooni järgnevaks: ';

  @override
  String get colorAdjustment => 'Värvikorrektsioon';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normaal',
      'lowSaturation': 'Madal küllastus',
      'normal': 'Normaal',
      'highSaturation': 'Kõrge küllastus',
      'monochrome': 'Monokroomne',
      'highContrast': 'Kõrge kontrastsus',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Praegune värviprofiil on: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Värvi ei tunta ära',
      'cF44336': 'Punane',
      'cE91E63': 'Roosa',
      'c9C27B0': 'Lilla',
      'c673AB7': 'Tumesinine',
      'c3F51B5': 'Indigovärvine',
      'c2196F3': 'Sinine',
      'c03A9F4': 'Helesinine',
      'c00BCD4': 'Tsüaan',
      'c009688': 'Rohekassinine',
      'c4CAF50': 'Roheline',
      'c8BC34A': 'Heleroheline',
      'cCDDC39': 'Laimiroheline',
      'cFFEB3B': 'Kollane',
      'cFFC107': 'Merevaikkollane',
      'cFF9800': 'Oranž',
      'cFF5722': 'Tumeoranž',
      'c795548': 'Pruun',
      'c9E9E9E': 'Hall',
      'c607D8B': 'Sinakashall',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Vähenda sõnadevahelisi vahesid';

  @override
  String get decrementLetterSpacing => 'Vähenda tähtede vahesid';

  @override
  String get decrementLineHeight => 'Vähenda reavahet';

  @override
  String get decrementTextScaleFactor => 'Vähenda teksti skaalat';

  @override
  String get effects => 'Efektid';

  @override
  String get expandText => 'Laienda teksti';

  @override
  String get fontSize => 'Fondi suurus';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Suurenda või vähenda sõnadevahelisi vahesid';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Suurenda või vähenda tähtede vahesid';

  @override
  String get increaseOrDecreaseLineHeight => 'Suurenda või vähenda reavahet';

  @override
  String get increaseOrDecreaseTextSize =>
      'Suurenda või vähenda teksti suurust';

  @override
  String get incrementWordSpacing => 'Suurenda sõnadevahelisi vahesid';

  @override
  String get incrementLetterSpacing => 'Suurenda tähtede vahesid';

  @override
  String get incrementLineHeight => 'Suurenda reavahet';

  @override
  String get incrementTextScaleFactor => 'Suurenda teksti skaalat';

  @override
  String get lessInfo => 'Peida info';

  @override
  String get letterSpacing => 'Tähtede vahed';

  @override
  String get lineHeight => 'Reavahe';

  @override
  String get moreInfo => 'Näita infot';

  @override
  String get readLess => 'Loe vähem';

  @override
  String get readMore => 'Loe rohkem';

  @override
  String get reduceEffects => 'Vähenda ekraani efekte';

  @override
  String get reduceText => 'Vähenda teksti';

  @override
  String get restoreSettings => 'Taasta seaded';

  @override
  String get restoreMainColor => 'Taasta põhivärv';

  @override
  String get returnToMainColors => 'Naase põhivärvide juurde';

  @override
  String get settings => 'Seaded';

  @override
  String get sizeAndTextDisplay => 'Suurus ja teksti kuva';

  @override
  String get sliderWordSpacing => 'Sõnavahed liuguriga';

  @override
  String get sliderLetterSpacing => 'Tähevahed liuguriga';

  @override
  String get sliderLineHeight => 'Reavahe liuguriga';

  @override
  String get themeMode => 'Kujundus';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Teemaprofiile ei tuvastatud',
      'seizureSafe': 'Epilepsia-ohutu',
      'visionImpaired': 'Nägemispuudega',
      'adhdFriendly': 'ATH-sõbralik',
      'none': 'Vaikeprofiil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsia-ohutu profiil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Eemalda peegeldused ja vähenda värve';

  @override
  String get themeProfileSeizureSafeDescription =>
      'See profiil võimaldab epilepsiaga ja epilepsiahoogude riskiga kasutajatel sirvida ohutult, kõrvaldades vilkuvatest animatsioonidest ja ohtlikest värvikombinatsioonidest tulenevate hoogude riski.';

  @override
  String get themeProfileVisionImpairedTitle => 'Nägemispuudega profiil';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Paranda rakenduse nähtavust';

  @override
  String get themeProfileVisionImpairedDescription =>
      'See profiil kohandab rakendust, et see oleks juurdepääsetav enamikule nägemispuuetele, nagu nägemislangus, tunnelnägemine, kataraktid, glaukoom ja muud.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ATH-sõbralik profiil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Rohkem keskendumist ja vähem häirefaktoreid';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'See profiil vähendab oluliselt tähelepanu hajumist, et aidata ATH ja neuroarenguhäiretega inimestel lihtsamini navigeerida, lugeda ja keskenduda rakenduse olulistele elementidele.';

  @override
  String get theSettingsHaveBeenReset => 'Seaded on lähtestatud.';

  @override
  String get toggleDarkMode => 'Lülita tumedat režiimi';

  @override
  String get toggleEffectsMode => 'Lülita efektide režiimi';

  @override
  String get toggleFontWeight => 'Lülita fondi paksust';

  @override
  String get toggleThemeProfile => 'Lülita teemaprofiili';

  @override
  String get wordSpacing => 'Sõnadevahelised vahed';

  @override
  String get accessibleFont => 'Ligipääsetav font';

  @override
  String get accessibleFontSubtitle =>
      'Kasutage parema loetavuse jaoks juurdepääsetavat fonti';

  @override
  String get accessibleFontEnabled => 'Ligipääsetav font lubatud';

  @override
  String get accessibleFontDisabled => 'Ligipääsetav font keelatud';

  @override
  String get toggleAccessibleFont => 'Lülita ligipääsetavat fonti';

  @override
  String get settingsLoading => 'Ligipääsetavuse seadete laadimine…';

  @override
  String get settingsLoadFailed =>
      'Ligipääsetavuse seadeid ei õnnestunud laadida.';

  @override
  String get retry => 'Proovi uuesti';

  @override
  String get themeModeSystem => 'Süsteem';

  @override
  String get themeModeLight => 'Hele';

  @override
  String get themeModeDark => 'Tume';

  @override
  String get effectsModeSystem => 'Süsteem';

  @override
  String get effectsModeEnabled => 'Sees';

  @override
  String get effectsModeDisabled => 'Väljas';
}
