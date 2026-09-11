// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AccessibilityLocalizationsHe extends AccessibilityLocalizations {
  AccessibilityLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get accessibility => 'נגישות';

  @override
  String get accessibilitySettings => 'הגדרות נגישות';

  @override
  String get adjustBackgroundColors => 'התאמת צבעי רקע';

  @override
  String get adjustTextColors => 'התאמת צבעי טקסט';

  @override
  String get alignCenter => 'יישור למרכז';

  @override
  String get alignLeft => 'יישור לשמאל';

  @override
  String get alignRight => 'יישור לימין';

  @override
  String get textAlignment => 'יישור טקסט';

  @override
  String get boldText => 'טקסט מודגש';

  @override
  String get changeBoldText => 'שינוי טקסט מודגש';

  @override
  String get changePagesBackgroundColor => 'שינוי צבע הרקע של העמודים ל: ';

  @override
  String get changeTextColor => 'שינוי צבע הטקסט ל: ';

  @override
  String get changeTextColorShade => 'שינוי גוון הצבע ל: ';

  @override
  String get colorAdjustment => 'התאמת צבעים';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'רגיל',
      'lowSaturation': 'רוויה נמוכה',
      'normal': 'רגיל',
      'highSaturation': 'רוויה גבוהה',
      'monochrome': 'חד-גווני',
      'highContrast': 'ניגודיות גבוהה',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'פרופיל הצבע הנוכחי הוא: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'צבע לא מזוהה',
      'cF44336': 'אדום',
      'cE91E63': 'ורוד',
      'c9C27B0': 'סגול',
      'c673AB7': 'סגול כהה',
      'c3F51B5': 'אינדיגו',
      'c2196F3': 'כחול',
      'c03A9F4': 'כחול בהיר',
      'c00BCD4': 'טורקיז',
      'c009688': 'כחול-ירוק',
      'c4CAF50': 'ירוק',
      'c8BC34A': 'ירוק בהיר',
      'cCDDC39': 'ליים',
      'cFFEB3B': 'צהוב',
      'cFFC107': 'ענבר',
      'cFF9800': 'כתום',
      'cFF5722': 'כתום כהה',
      'c795548': 'חום',
      'c9E9E9E': 'אפור',
      'c607D8B': 'אפור-כחול',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'הקטנת רווח בין מילים';

  @override
  String get decrementLetterSpacing => 'הקטנת רווח בין אותיות';

  @override
  String get decrementLineHeight => 'הקטנת גובה שורה';

  @override
  String get decrementTextScaleFactor => 'הקטנת מקדם גודל טקסט';

  @override
  String get effects => 'אפקטים';

  @override
  String get expandText => 'הרחבת טקסט';

  @override
  String get fontSize => 'גודל גופן';

  @override
  String get increaseOrDecreaseWordSpacing => 'הגדלת או הקטנת רווח בין מילים';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'הגדלת או הקטנת רווח בין אותיות';

  @override
  String get increaseOrDecreaseLineHeight => 'הגדלת או הקטנת גובה שורה';

  @override
  String get increaseOrDecreaseTextSize => 'הגדלת או הקטנת גודל טקסט';

  @override
  String get incrementWordSpacing => 'הגדלת רווח בין מילים';

  @override
  String get incrementLetterSpacing => 'הגדלת רווח בין אותיות';

  @override
  String get incrementLineHeight => 'הגדלת גובה שורה';

  @override
  String get incrementTextScaleFactor => 'הגדלת מקדם גודל טקסט';

  @override
  String get lessInfo => 'הסתרת מידע';

  @override
  String get letterSpacing => 'רווח בין אותיות';

  @override
  String get lineHeight => 'גובה שורה';

  @override
  String get moreInfo => 'הצגת מידע';

  @override
  String get readLess => 'קרא פחות';

  @override
  String get readMore => 'קרא עוד';

  @override
  String get reduceEffects => 'הפחתת אפקטים במסך';

  @override
  String get reduceText => 'הקטנת טקסט';

  @override
  String get restoreSettings => 'שחזור הגדרות';

  @override
  String get restoreMainColor => 'שחזור צבע ראשי';

  @override
  String get returnToMainColors => 'חזרה לצבעים ראשיים';

  @override
  String get settings => 'הגדרות';

  @override
  String get sizeAndTextDisplay => 'גודל ותצוגת טקסט';

  @override
  String get sliderWordSpacing => 'מחוון רווח בין מילים';

  @override
  String get sliderLetterSpacing => 'מחוון רווח בין אותיות';

  @override
  String get sliderLineHeight => 'מחוון גובה שורה';

  @override
  String get themeMode => 'ערכת נושא';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'פרופיל ערכת נושא לא מזוהה',
      'seizureSafe': 'בטוח לחולי אפילפסיה',
      'visionImpaired': 'ללקויי ראייה',
      'adhdFriendly': 'ידותי ל-ADHD',
      'none': 'פרופיל ברירת מחדל',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'פרופיל בטוח לחולי אפילפסיה';

  @override
  String get themeProfileSeizureSafeSubtitle => 'הסרת השתקפויות והפחתת צבע';

  @override
  String get themeProfileSeizureSafeDescription =>
      'פרופיל זה מאפשר למשתמשים עם אפילפסיה ובסיכון להתקפים לגלוש באינטרנט בבטחה על ידי ביטול הסיכון להתקפים הנובעים מאנימציות מהבהבות ושילובי צבעים מסוכנים.';

  @override
  String get themeProfileVisionImpairedTitle => 'פרופיל ללקויי ראייה';

  @override
  String get themeProfileVisionImpairedSubtitle => 'שיפור נראות היישום';

  @override
  String get themeProfileVisionImpairedDescription =>
      'פרופיל זה מתאים את היישום להיות נגיש לרוב לקויות הראייה, כגון לקוי ראייה, ראיית מנהרה, קטרקט, גלאוקומה ועוד.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'פרופיל ידותי ל-ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'יותר ריכוז ופחות הסחות דעת';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'פרופיל זה מפחית באופן משמעותי את הסחות הדעת, כדי לעזור לאנשים עם ADHD והפרעות התפתחות נוירולוגיות לנווט, לקרוא ולהתמקד באלמנטים החיוניים של היישום בקלות רבה יותר.';

  @override
  String get theSettingsHaveBeenReset => 'ההגדרות אופסו.';

  @override
  String get toggleDarkMode => 'הפעלת/כיבוי מצב כהה';

  @override
  String get toggleEffectsMode => 'הפעלת/כיבוי מצב אפקטים';

  @override
  String get toggleFontWeight => 'הפעלת/כיבוי משקל גופן';

  @override
  String get toggleThemeProfile => 'הפעלת/כיבוי פרופיל ערכת נושא';

  @override
  String get wordSpacing => 'רווח בין מילים';

  @override
  String get accessibleFont => 'גופן נגיש';

  @override
  String get accessibleFontSubtitle => 'השתמש בגופן נגיש לקריאות טובה יותר';

  @override
  String get accessibleFontEnabled => 'גופן נגיש מופעל';

  @override
  String get accessibleFontDisabled => 'גופן נגיש מושבת';

  @override
  String get toggleAccessibleFont => 'הפעלת/כיבוי גופן נגיש';

  @override
  String get settingsLoading => 'טוען את הגדרות הנגישות…';

  @override
  String get settingsLoadFailed => 'לא ניתן היה לטעון את הגדרות הנגישות.';

  @override
  String get retry => 'נסה שוב';

  @override
  String get themeModeSystem => 'מערכת';

  @override
  String get themeModeLight => 'בהיר';

  @override
  String get themeModeDark => 'כהה';

  @override
  String get effectsModeSystem => 'מערכת';

  @override
  String get effectsModeEnabled => 'פועל';

  @override
  String get effectsModeDisabled => 'כבוי';
}
