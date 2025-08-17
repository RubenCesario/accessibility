import 'package:accessibility/src/core/l10n/generated/app_localizations_he.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsHe', () {
    late AccessibilityLocalizationsHe loc;

    setUp(() {
      loc = AccessibilityLocalizationsHe();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('he'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('נגישות'));
      expect(loc.accessibility_settings, equals('הגדרות נגישות'));
      expect(loc.adjust_background_colors, equals('התאמת צבעי רקע'));
      expect(loc.adjust_text_colors, equals('התאמת צבעי טקסט'));
      expect(loc.align_center, equals('יישור למרכז'));
      expect(loc.align_left, equals('יישור לשמאל'));
      expect(loc.align_right, equals('יישור לימין'));
      expect(loc.bold_text, equals('טקסט מודגש'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('שינוי טקסט מודגש'));
      expect(
        loc.change_pages_background_color,
        equals('שינוי צבע הרקע של העמודים ל: '),
      );
      expect(loc.change_text_color, equals('שינוי צבע הטקסט ל: '));
      expect(loc.change_text_color_shade, equals('שינוי גוון הצבע ל: '));
      expect(loc.color_adjustment, equals('התאמת צבעים'));
      expect(
        loc.color_profile_changed_to,
        equals('פרופיל הצבע הנוכחי הוא: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('הקטנת רווח בין מילים'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('הקטנת רווח בין אותיות'),
      );
      expect(loc.decrement_line_height, equals('הקטנת גובה שורה'));
      expect(
        loc.decrement_text_scale_factor,
        equals('הקטנת מקדם גודל טקסט'),
      );
      expect(loc.increment_word_spacing, equals('הגדלת רווח בין מילים'));
      expect(loc.increment_letter_spacing, equals('הגדלת רווח בין אותיות'));
      expect(loc.increment_line_height, equals('הגדלת גובה שורה'));
      expect(
        loc.increment_text_scale_factor,
        equals('הגדלת מקדם גודל טקסט'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('הגדלת או הקטנת רווח בין מילים'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('הגדלת או הקטנת רווח בין אותיות'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('הגדלת או הקטנת גובה שורה'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('הגדלת או הקטנת גודל טקסט'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('אפקטים'));
      expect(loc.expand_text, equals('הרחבת טקסט'));
      expect(loc.font_size, equals('גודל גופן'));
      expect(loc.less_info, equals('הסתרת מידע'));
      expect(loc.letter_spacing, equals('רווח בין אותיות'));
      expect(loc.line_height, equals('גובה שורה'));
      expect(loc.more_info, equals('הצגת מידע'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('קרא פחות'));
      expect(loc.read_more, equals('קרא עוד'));
      expect(loc.reduce_effects, equals('הפחתת אפקטים במסך'));
      expect(loc.reduce_text, equals('הקטנת טקסט'));
      expect(loc.restore_settings, equals('שחזור הגדרות'));
      expect(loc.restore_main_color, equals('שחזור צבע ראשי'));
      expect(loc.return_to_main_colors, equals('חזרה לצבעים ראשיים'));
      expect(loc.settings, equals('הגדרות'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('גודל ותצוגת טקסט'));
      expect(loc.slider_word_spacing, equals('מחוון רווח בין מילים'));
      expect(loc.slider_letter_spacing, equals('מחוון רווח בין אותיות'));
      expect(loc.slider_line_height, equals('מחוון גובה שורה'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('ערכת נושא'));
      expect(
        loc.theme_profile('other'),
        equals('פרופיל ערכת נושא לא מזוהה'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('בטוח לחולי אפילפסיה'));
      expect(loc.theme_profile('visionImpaired'), equals('ללקויי ראייה'));
      expect(loc.theme_profile('adhdFriendly'), equals('ידותי ל-ADHD'));
      expect(loc.theme_profile('none'), equals('ברירת מחדל'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('פרופיל בטוח לחולי אפילפסיה'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('הסרת השתקפויות והפחתת צבע'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'פרופיל זה מאפשר למשתמשים עם אפילפסיה ובסיכון להתקפים '
          'לגלוש באינטרנט בבטחה על ידי ביטול הסיכון להתקפים '
          'הנובעים מאנימציות מהבהבות ושילובי צבעים מסוכנים.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('פרופיל ללקויי ראייה'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('שיפור נראות היישום'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'פרופיל זה מתאים את היישום להיות נגיש לרוב לקויות הראייה, '
          'כגון לקוי ראייה, ראיית מנהרה, קטרקט, גלאוקומה ועוד.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('פרופיל ידותי ל-ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('יותר ריכוז ופחות הסחות דעת'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'פרופיל זה מפחית באופן משמעותי את הסחות הדעת, כדי לעזור '
          'לאנשים עם ADHD והפרעות התפתחות נוירולוגיות לנווט, לקרוא '
          'ולהתמקד באלמנטים החיוניים של היישום בקלות רבה יותר.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ההגדרות אופסו.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('הפעלת/כיבוי מצב כהה'));
      expect(loc.toggle_effects_mode, equals('הפעלת/כיבוי מצב אפקטים'));
      expect(loc.toggle_font_weight, equals('הפעלת/כיבוי משקל גופן'));
      expect(loc.toggle_theme_profile, equals('הפעלת/כיבוי פרופיל ערכת נושא'));
      expect(loc.word_spacing, equals('רווח בין מילים'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('רוויה נמוכה'),
      );
      expect(loc.color_profile('normal'), equals('רגיל'));
      expect(
        loc.color_profile('highSaturation'),
        equals('רוויה גבוהה'),
      );
      expect(loc.color_profile('monochrome'), equals('חד-גווני'));
      expect(loc.color_profile('highContrast'), equals('ניגודיות גבוהה'));
      expect(loc.color_profile('unknown'), equals('רגיל'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('אדום'));
      expect(loc.color('cE91E63'), equals('ורוד'));
      expect(loc.color('c9C27B0'), equals('סגול'));
      expect(loc.color('c673AB7'), equals('סגול כהה'));
      expect(loc.color('c3F51B5'), equals('אינדיגו'));
      expect(loc.color('c2196F3'), equals('כחול'));
      expect(loc.color('c03A9F4'), equals('כחול בהיר'));
      expect(loc.color('c00BCD4'), equals('טורקיז'));
      expect(loc.color('c009688'), equals('כחול-ירוק'));
      expect(loc.color('c4CAF50'), equals('ירוק'));
      expect(loc.color('c8BC34A'), equals('ירוק בהיר'));
      expect(loc.color('cCDDC39'), equals('ליים'));
      expect(loc.color('cFFEB3B'), equals('צהוב'));
      expect(loc.color('cFFC107'), equals('ענבר'));
      expect(loc.color('cFF9800'), equals('כתום'));
      expect(loc.color('cFF5722'), equals('כתום כהה'));
      expect(loc.color('c795548'), equals('חום'));
      expect(loc.color('c9E9E9E'), equals('אפור'));
      expect(loc.color('c607D8B'), equals('אפור-כחול'));
      expect(
        loc.color('unknown'),
        equals('צבע לא מזוהה'),
      );
    });
  });
}
