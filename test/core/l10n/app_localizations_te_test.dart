import 'package:accessibility/src/core/l10n/generated/app_localizations_te.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsTe', () {
    late AccessibilityLocalizationsTe loc;

    setUp(() {
      loc = AccessibilityLocalizationsTe();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('te'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ప్రాప్యత'));
      expect(
        loc.accessibility_settings,
        equals('ప్రాప్యత సెట్టింగ్స్'),
      );
      expect(
        loc.adjust_background_colors,
        equals('నేపథ్య రంగులను సర్దుబాటు చేయండి'),
      );
      expect(
        loc.adjust_text_colors,
        equals('టెక్స్ట్ రంగులను సర్దుబాటు చేయండి'),
      );
      expect(loc.align_center, equals('మధ్యలో సరిపరచు'));
      expect(loc.align_left, equals('ఎడమవైపు సరిపరచు'));
      expect(loc.align_right, equals('కుడివైపు సరిపరచు'));
      expect(loc.bold_text, equals('బోల్డ్ టెక్స్ట్'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('బోల్డ్ టెక్స్ట్ని మార్చండి'));
      expect(
        loc.change_pages_background_color,
        equals('పేజీల నేపథ్య రంగును ఈ విధంగా మార్చండి: '),
      );
      expect(
        loc.change_text_color,
        equals('టెక్స్ట్ రంగును ఈ విధంగా మార్చండి: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('రంగు షేడ్ని ఈ విధంగా మార్చండి: '),
      );
      expect(loc.color_adjustment, equals('రంగు సర్దుబాటు'));
      expect(
        loc.color_profile_changed_to,
        equals('ప్రస్తుత రంగు ప్రొఫైల్: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('పదాల మధ్య స్థలాన్ని తగ్గించు'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('అక్షరాల మధ్య స్థలాన్ని తగ్గించు'),
      );
      expect(loc.decrement_line_height, equals('లైన్ ఎత్తును తగ్గించు'));
      expect(
        loc.decrement_text_scale_factor,
        equals('టెక్స్ట్ స్కేల్ ఫ్యాక్టర్ని తగ్గించు'),
      );
      expect(
        loc.increment_word_spacing,
        equals('పదాల మధ్య స్థలాన్ని పెంచు'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('అక్షరాల మధ్య స్థలాన్ని పెంచు'),
      );
      expect(loc.increment_line_height, equals('లైన్ ఎత్తును పెంచు'));
      expect(
        loc.increment_text_scale_factor,
        equals('టెక్స్ట్ స్కేల్ ఫ్యాక్టర్ని పెంచు'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('పదాల మధ్య స్థలాన్ని పెంచు లేదా తగ్గించు'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('అక్షరాల మధ్య స్థలాన్ని పెంచు లేదా తగ్గించు'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('లైన్ ఎత్తును పెంచు లేదా తగ్గించు'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('టెక్స్ట్ సైజును పెంచు లేదా తగ్గించు'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ఎఫెక్ట్స్'));
      expect(loc.expand_text, equals('టెక్స్ట్ని విస్తరించు'));
      expect(loc.font_size, equals('ఫాంట్ సైజు'));
      expect(loc.less_info, equals('సమాచారాన్ని దాచు'));
      expect(loc.letter_spacing, equals('అక్షరాల మధ్య స్థలం'));
      expect(loc.line_height, equals('లైన్ ఎత్తు'));
      expect(loc.more_info, equals('సమాచారాన్ని చూపించు'));
      expect(loc.word_spacing, equals('పదాల మధ్య స్థలం'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('తక్కువ చదవండి'));
      expect(loc.read_more, equals('మరింత చదవండి'));
      expect(
        loc.reduce_effects,
        equals('స్క్రీన్ ఎఫెక్ట్స్‌ని తగ్గించు'),
      );
      expect(loc.reduce_text, equals('టెక్స్ట్‌ని తగ్గించు'));
      expect(loc.restore_settings, equals('సెట్టింగ్స్‌ని పునరుద్ధరించు'));
      expect(loc.restore_main_color, equals('ప్రధాన రంగును పునరుద్ధరించు'));
      expect(
        loc.return_to_main_colors,
        equals('ప్రధాన రంగులకు తిరిగి వెళ్ళు'),
      );
      expect(loc.settings, equals('సెట్టింగ్స్'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('సైజు మరియు టెక్స్ట్ ప్రదర్శన'),
      );
      expect(
        loc.slider_word_spacing,
        equals('స్లైడర్ పదాల మధ్య స్థలం'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('స్లైడర్ అక్షరాల మధ్య స్థలం'),
      );
      expect(loc.slider_line_height, equals('స్లైడర్ లైన్ ఎత్తు'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('థీమ్'));
      expect(
        loc.theme_profile('other'),
        equals('థీమ్ ప్రొఫైల్ గుర్తించబడలేదు'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('సీజర్ సేఫ్'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('దృష్టి లోపం'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD అనుకూలం'),
      );
      expect(loc.theme_profile('none'), equals('డిఫాల్ట్'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('సీజర్ సేఫ్ ప్రొఫైల్'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ప్రతిబింబాలను తొలగించి రంగును తగ్గించండి'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ఈ ప్రొఫైల్ మృగీ వ్యాధి ఉన్న మరియు సీజర్ల ప్రమాదంలో '
          'ఉన్న వినియోగదారులు ఫ్లాషింగ్ యానిమేషన్లు మరియు '
          'ప్రమాదకరమైన రంగుల కలయికల వల్ల వచ్చే సీజర్ల '
          'ప్రమాదాన్ని తొలగించడం ద్వారా సురక్షితంగా '
          'బ్రౌజ్ చేయడానికి అనుమతిస్తుంది.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('దృష్టి లోపం ప్రొఫైల్'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('అప్లికేషన్ దృశ్యమానతను మెరుగుపరచండి'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ఈ ప్రొఫైల్ దృష్టి లోపం, టన్నెల్ విజన్, కంటి పొర, '
          'గ్లాకోమా మరియు మరిన్ని వంటి చాలా దృష్టి లోపాలకు '
          'అందుబాటులో ఉండేలా అప్లికేషన్‌ను అనుకూలంగా '
          'మారుస్తుంది.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-అనుకూల ప్రొఫైల్'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ఎక్కువ ఏకాగ్రత మరియు తక్కువ విచలనాలు'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ఈ ప్రొఫైల్ ADHD మరియు న్యూరోడెవలప్‌మెంటల్ '
          'డిజార్డర్స్ ఉన్న వ్యక్తులు నావిగేట్ చేయడానికి, '
          'చదవడానికి మరియు అప్లికేషన్ యొక్క ముఖ్యమైన '
          'అంశాలపై సులభంగా దృష్టి పెట్టడానికి '
          'సహాయపడటానికి విచలనాలను గణనీయంగా తగ్గిస్తుంది.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('సెట్టింగ్స్ రీసెట్ చేయబడ్డాయి.'),
      );
      expect(
        loc.toggle_dark_mode,
        equals('డార్క్ మోడ్‌ని టాగుల్ చేయండి'),
      );
      expect(
        loc.toggle_effects_mode,
        equals('ఎఫెక్ట్స్ మోడ్‌ని టాగుల్ చేయండి'),
      );
      expect(
        loc.toggle_font_weight,
        equals('ఫాంట్ బరువును టాగుల్ చేయండి'),
      );
      expect(
        loc.toggle_theme_profile,
        equals('థీమ్ ప్రొఫైల్‌ని టాగుల్ చేయండి'),
      );
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('సాధారణ'));
      expect(loc.color_profile('lowSaturation'), equals('తక్కువ సాచురేషన్'));
      expect(loc.color_profile('normal'), equals('సాధారణ'));
      expect(
        loc.color_profile('highSaturation'),
        equals('అధిక సాచురేషన్'),
      );
      expect(loc.color_profile('monochrome'), equals('మోనోక్రోమ్'));
      expect(
        loc.color_profile('highContrast'),
        equals('అధిక వ్యత్యాసం'),
      );
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('రంగు గుర్తించబడలేదు'));
      expect(loc.color('cF44336'), equals('ఎరుపు'));
      expect(loc.color('cE91E63'), equals('గులాబీ'));
      expect(loc.color('c9C27B0'), equals('ఉదా'));
      expect(loc.color('c673AB7'), equals('లోతైన ఉదా'));
      expect(loc.color('c3F51B5'), equals('నీలిరంగు'));
      expect(loc.color('c2196F3'), equals('నీలం'));
      expect(loc.color('c03A9F4'), equals('లేత నీలం'));
      expect(loc.color('c00BCD4'), equals('సైయన్'));
      expect(loc.color('c009688'), equals('టీల్'));
      expect(loc.color('c4CAF50'), equals('ఆకుపచ్చ'));
      expect(loc.color('c8BC34A'), equals('లేత ఆకుపచ్చ'));
      expect(loc.color('cCDDC39'), equals('లైమ్'));
      expect(loc.color('cFFEB3B'), equals('పసుపు'));
      expect(loc.color('cFFC107'), equals('ఆంబర్'));
      expect(loc.color('cFF9800'), equals('నారింజ'));
      expect(loc.color('cFF5722'), equals('లోతైన నారింజ'));
      expect(loc.color('c795548'), equals('గోధుమ రంగు'));
      expect(loc.color('c9E9E9E'), equals('బూడిద'));
      expect(loc.color('c607D8B'), equals('నీలి బూడిద'));
    });
  });
}
