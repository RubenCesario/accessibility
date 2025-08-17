// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AccessibilityLocalizationsHe extends AccessibilityLocalizations {
  AccessibilityLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get accessibility => 'נגישות';

  @override
  String get accessibility_settings => 'הגדרות נגישות';

  @override
  String get adjust_background_colors => 'התאמת צבעי רקע';

  @override
  String get adjust_text_colors => 'התאמת צבעי טקסט';

  @override
  String get align_center => 'יישור למרכז';

  @override
  String get align_left => 'יישור לשמאל';

  @override
  String get align_right => 'יישור לימין';

  @override
  String get bold_text => 'טקסט מודגש';

  @override
  String get change_bold_text => 'שינוי טקסט מודגש';

  @override
  String get change_pages_background_color => 'שינוי צבע הרקע של העמודים ל: ';

  @override
  String get change_text_color => 'שינוי צבע הטקסט ל: ';

  @override
  String get change_text_color_shade => 'שינוי גוון הצבע ל: ';

  @override
  String get color_adjustment => 'התאמת צבעים';

  @override
  String color_profile(String profile) {
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
  String get color_profile_changed_to => 'פרופיל הצבע הנוכחי הוא: ';

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
  String get decrement_word_spacing => 'הקטנת רווח בין מילים';

  @override
  String get decrement_letter_spacing => 'הקטנת רווח בין אותיות';

  @override
  String get decrement_line_height => 'הקטנת גובה שורה';

  @override
  String get decrement_text_scale_factor => 'הקטנת מקדם גודל טקסט';

  @override
  String get effects => 'אפקטים';

  @override
  String get expand_text => 'הרחבת טקסט';

  @override
  String get font_size => 'גודל גופן';

  @override
  String get increase_or_decrease_word_spacing =>
      'הגדלת או הקטנת רווח בין מילים';

  @override
  String get increase_or_decrease_letter_spacing =>
      'הגדלת או הקטנת רווח בין אותיות';

  @override
  String get increase_or_decrease_line_height => 'הגדלת או הקטנת גובה שורה';

  @override
  String get increase_or_decrease_text_size => 'הגדלת או הקטנת גודל טקסט';

  @override
  String get increment_word_spacing => 'הגדלת רווח בין מילים';

  @override
  String get increment_letter_spacing => 'הגדלת רווח בין אותיות';

  @override
  String get increment_line_height => 'הגדלת גובה שורה';

  @override
  String get increment_text_scale_factor => 'הגדלת מקדם גודל טקסט';

  @override
  String get less_info => 'הסתרת מידע';

  @override
  String get letter_spacing => 'רווח בין אותיות';

  @override
  String get line_height => 'גובה שורה';

  @override
  String get more_info => 'הצגת מידע';

  @override
  String get read_less => 'קרא פחות';

  @override
  String get read_more => 'קרא עוד';

  @override
  String get reduce_effects => 'הפחתת אפקטים במסך';

  @override
  String get reduce_text => 'הקטנת טקסט';

  @override
  String get restore_settings => 'שחזור הגדרות';

  @override
  String get restore_main_color => 'שחזור צבע ראשי';

  @override
  String get return_to_main_colors => 'חזרה לצבעים ראשיים';

  @override
  String get settings => 'הגדרות';

  @override
  String get size_and_text_display => 'גודל ותצוגת טקסט';

  @override
  String get slider_word_spacing => 'מחוון רווח בין מילים';

  @override
  String get slider_letter_spacing => 'מחוון רווח בין אותיות';

  @override
  String get slider_line_height => 'מחוון גובה שורה';

  @override
  String get theme_mode => 'ערכת נושא';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'פרופיל ערכת נושא לא מזוהה',
      'seizureSafe': 'בטוח לחולי אפילפסיה',
      'visionImpaired': 'ללקויי ראייה',
      'adhdFriendly': 'ידותי ל-ADHD',
      'none': 'ברירת מחדל',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'פרופיל בטוח לחולי אפילפסיה';

  @override
  String get theme_profile_seizure_safe_subtitle => 'הסרת השתקפויות והפחתת צבע';

  @override
  String get theme_profile_seizure_safe_description =>
      'פרופיל זה מאפשר למשתמשים עם אפילפסיה ובסיכון להתקפים לגלוש באינטרנט בבטחה על ידי ביטול הסיכון להתקפים הנובעים מאנימציות מהבהבות ושילובי צבעים מסוכנים.';

  @override
  String get theme_profile_vision_impaired_title => 'פרופיל ללקויי ראייה';

  @override
  String get theme_profile_vision_impaired_subtitle => 'שיפור נראות היישום';

  @override
  String get theme_profile_vision_impaired_description =>
      'פרופיל זה מתאים את היישום להיות נגיש לרוב לקויות הראייה, כגון לקוי ראייה, ראיית מנהרה, קטרקט, גלאוקומה ועוד.';

  @override
  String get theme_profile_adhd_friendly_title => 'פרופיל ידותי ל-ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'יותר ריכוז ופחות הסחות דעת';

  @override
  String get theme_profile_adhd_friendly_description =>
      'פרופיל זה מפחית באופן משמעותי את הסחות הדעת, כדי לעזור לאנשים עם ADHD והפרעות התפתחות נוירולוגיות לנווט, לקרוא ולהתמקד באלמנטים החיוניים של היישום בקלות רבה יותר.';

  @override
  String get the_settings_have_been_reset => 'ההגדרות אופסו.';

  @override
  String get toggle_dark_mode => 'הפעלת/כיבוי מצב כהה';

  @override
  String get toggle_effects_mode => 'הפעלת/כיבוי מצב אפקטים';

  @override
  String get toggle_font_weight => 'הפעלת/כיבוי משקל גופן';

  @override
  String get toggle_theme_profile => 'הפעלת/כיבוי פרופיל ערכת נושא';

  @override
  String get word_spacing => 'רווח בין מילים';
}
