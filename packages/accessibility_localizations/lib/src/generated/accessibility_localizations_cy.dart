// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AccessibilityLocalizationsCy extends AccessibilityLocalizations {
  AccessibilityLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get accessibility => 'Hygyrchedd';

  @override
  String get accessibilitySettings => 'Gosodiadau hygyrchedd';

  @override
  String get adjustBackgroundColors => 'Addasu lliwiau cefndir';

  @override
  String get adjustTextColors => 'Addasu lliwiau testun';

  @override
  String get alignCenter => 'Alinio i\'r canol';

  @override
  String get alignLeft => 'Alinio i\'r chwith';

  @override
  String get alignRight => 'Alinio i\'r dde';

  @override
  String get textAlignment => 'Aliniad testun';

  @override
  String get boldText => 'Testun bras';

  @override
  String get changeBoldText => 'Newid testun bras';

  @override
  String get changePagesBackgroundColor =>
      'Newid lliw cefndir y tudalennau i: ';

  @override
  String get changeTextColor => 'Newid lliw testun i: ';

  @override
  String get changeTextColorShade => 'Newid arlliw lliw i: ';

  @override
  String get colorAdjustment => 'Addasiad lliw';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Arferol',
      'lowSaturation': 'Dirlawnder isel',
      'normal': 'Arferol',
      'highSaturation': 'Dirlawnder uchel',
      'monochrome': 'Du a gwyn',
      'highContrast': 'Cyferbyniad uchel',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Y proffil lliw presennol yw: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Lliw heb ei gydnabod',
      'cF44336': 'Coch',
      'cE91E63': 'Pinc',
      'c9C27B0': 'Porffor',
      'c673AB7': 'Porffor Tywyll',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Glas',
      'c03A9F4': 'Glas Golau',
      'c00BCD4': 'Cyan',
      'c009688': 'Gwyrddlas',
      'c4CAF50': 'Gwyrdd',
      'c8BC34A': 'Gwyrdd Golau',
      'cCDDC39': 'Leim',
      'cFFEB3B': 'Melyn',
      'cFFC107': 'Ambr',
      'cFF9800': 'Oren',
      'cFF5722': 'Oren Tywyll',
      'c795548': 'Brown',
      'c9E9E9E': 'Llwyd',
      'c607D8B': 'Llwyd Glas',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Lleihau bylchau rhwng geiriau';

  @override
  String get decrementLetterSpacing => 'Lleihau bylchau rhwng llythrennau';

  @override
  String get decrementLineHeight => 'Lleihau uchder llinell';

  @override
  String get decrementTextScaleFactor => 'Lleihau ffactor graddio testun';

  @override
  String get effects => 'Effeithiau';

  @override
  String get expandText => 'Ehangu testun';

  @override
  String get fontSize => 'Maint ffont';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Cynyddu neu leihau bylchau rhwng geiriau';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Cynyddu neu leihau bylchau rhwng llythrennau';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Cynyddu neu leihau uchder llinell';

  @override
  String get increaseOrDecreaseTextSize => 'Cynyddu neu leihau maint testun';

  @override
  String get incrementWordSpacing => 'Cynyddu bylchau rhwng geiriau';

  @override
  String get incrementLetterSpacing => 'Cynyddu bylchau rhwng llythrennau';

  @override
  String get incrementLineHeight => 'Cynyddu uchder llinell';

  @override
  String get incrementTextScaleFactor => 'Cynyddu ffactor graddio testun';

  @override
  String get lessInfo => 'Cuddio gwybodaeth';

  @override
  String get letterSpacing => 'Bylchau llythrennau';

  @override
  String get lineHeight => 'Uchder llinell';

  @override
  String get moreInfo => 'Dangos gwybodaeth';

  @override
  String get readLess => 'Darllen llai';

  @override
  String get readMore => 'Darllen mwy';

  @override
  String get reduceEffects => 'Lleihau effeithiau ar y sgrin';

  @override
  String get reduceText => 'Lleihau testun';

  @override
  String get restoreSettings => 'Adfer gosodiadau';

  @override
  String get restoreMainColor => 'Adfer prif liw';

  @override
  String get returnToMainColors => 'Dychwelyd i\'r prif liwiau';

  @override
  String get settings => 'Gosodiadau';

  @override
  String get sizeAndTextDisplay => 'Maint a dangosiad testun';

  @override
  String get sliderWordSpacing => 'Llithrydd bylchau geiriau';

  @override
  String get sliderLetterSpacing => 'Llithrydd bylchau llythrennau';

  @override
  String get sliderLineHeight => 'Llithrydd uchder llinell';

  @override
  String get themeMode => 'Thema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Proffil thema heb ei gydnabod',
      'seizureSafe': 'Diogel rhag ffit',
      'visionImpaired': 'Nam ar y golwg',
      'adhdFriendly': 'Cyfeillgar i ADHD',
      'none': 'Proffil rhagosodedig',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Proffil diogel rhag ffit';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Dileu adlewyrchiadau a lleihau lliw';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Mae\'r proffil hwn yn galluogi defnyddwyr sydd ag epilepsi ac sydd mewn perygl o ffitiau i bori\'n ddiogel trwy ddileu\'r risg o ffitiau sy\'n deillio o animeiddiadau fflachio a chyfuniadau lliw peryglus.';

  @override
  String get themeProfileVisionImpairedTitle => 'Proffil nam ar y golwg';

  @override
  String get themeProfileVisionImpairedSubtitle => 'Gwella gwelededd y rhaglen';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Mae\'r proffil hwn yn addasu\'r rhaglen i fod yn hygyrch i\'r rhan fwyaf o namau ar y golwg, megis nam ar y golwg, golwg twnnel, cataractau, glawcoma a mwy.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Proffil cyfeillgar i ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mwy o ganolbwyntio a llai o dargyfeiriadau';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Mae\'r proffil hwn yn lleihau tynnu sylw yn sylweddol, i helpu pobl ag ADHD ac anhwylderau niwroddatblygiadol i lywio, darllen, a chanolbwyntio ar elfennau hanfodol y rhaglen yn haws.';

  @override
  String get theSettingsHaveBeenReset => 'Mae\'r gosodiadau wedi\'u hailosod.';

  @override
  String get toggleDarkMode => 'Toglo modd tywyll';

  @override
  String get toggleEffectsMode => 'Toglo modd effeithiau';

  @override
  String get toggleFontWeight => 'Toglo pwysau ffont';

  @override
  String get toggleThemeProfile => 'Toglo proffil thema';

  @override
  String get wordSpacing => 'Bylchau geiriau';

  @override
  String get accessibleFont => 'Ffont hygyrch';

  @override
  String get accessibleFontSubtitle =>
      'Defnyddiwch ffont hygyrch ar gyfer darllenedd gwell';

  @override
  String get accessibleFontEnabled => 'Ffont hygyrch wedi\'i galluogi';

  @override
  String get accessibleFontDisabled => 'Ffont hygyrch wedi\'i analluogi';

  @override
  String get toggleAccessibleFont => 'Toglo ffont hygyrch';

  @override
  String get settingsLoading => 'Wrthi\'n llwytho\'r gosodiadau hygyrchedd…';

  @override
  String get settingsLoadFailed => 'Methwyd llwytho\'r gosodiadau hygyrchedd.';

  @override
  String get retry => 'Ceisiwch eto';
}
