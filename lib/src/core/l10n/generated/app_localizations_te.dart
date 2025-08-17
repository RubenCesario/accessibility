// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AccessibilityLocalizationsTe extends AccessibilityLocalizations {
  AccessibilityLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get accessibility => 'ప్రాప్యత';

  @override
  String get accessibility_settings => 'ప్రాప్యత సెట్టింగ్స్';

  @override
  String get adjust_background_colors => 'నేపథ్య రంగులను సర్దుబాటు చేయండి';

  @override
  String get adjust_text_colors => 'టెక్స్ట్ రంగులను సర్దుబాటు చేయండి';

  @override
  String get align_center => 'మధ్యలో సరిపరచు';

  @override
  String get align_left => 'ఎడమవైపు సరిపరచు';

  @override
  String get align_right => 'కుడివైపు సరిపరచు';

  @override
  String get bold_text => 'బోల్డ్ టెక్స్ట్';

  @override
  String get change_bold_text => 'బోల్డ్ టెక్స్ట్ని మార్చండి';

  @override
  String get change_pages_background_color =>
      'పేజీల నేపథ్య రంగును ఈ విధంగా మార్చండి: ';

  @override
  String get change_text_color => 'టెక్స్ట్ రంగును ఈ విధంగా మార్చండి: ';

  @override
  String get change_text_color_shade => 'రంగు షేడ్ని ఈ విధంగా మార్చండి: ';

  @override
  String get color_adjustment => 'రంగు సర్దుబాటు';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'సాధారణ',
      'lowSaturation': 'తక్కువ సాచురేషన్',
      'normal': 'సాధారణ',
      'highSaturation': 'అధిక సాచురేషన్',
      'monochrome': 'మోనోక్రోమ్',
      'highContrast': 'అధిక వ్యత్యాసం',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'ప్రస్తుత రంగు ప్రొఫైల్: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'రంగు గుర్తించబడలేదు',
      'cF44336': 'ఎరుపు',
      'cE91E63': 'గులాబీ',
      'c9C27B0': 'ఉదా',
      'c673AB7': 'లోతైన ఉదా',
      'c3F51B5': 'నీలిరంగు',
      'c2196F3': 'నీలం',
      'c03A9F4': 'లేత నీలం',
      'c00BCD4': 'సైయన్',
      'c009688': 'టీల్',
      'c4CAF50': 'ఆకుపచ్చ',
      'c8BC34A': 'లేత ఆకుపచ్చ',
      'cCDDC39': 'లైమ్',
      'cFFEB3B': 'పసుపు',
      'cFFC107': 'ఆంబర్',
      'cFF9800': 'నారింజ',
      'cFF5722': 'లోతైన నారింజ',
      'c795548': 'గోధుమ రంగు',
      'c9E9E9E': 'బూడిద',
      'c607D8B': 'నీలి బూడిద',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'పదాల మధ్య స్థలాన్ని తగ్గించు';

  @override
  String get decrement_letter_spacing => 'అక్షరాల మధ్య స్థలాన్ని తగ్గించు';

  @override
  String get decrement_line_height => 'లైన్ ఎత్తును తగ్గించు';

  @override
  String get decrement_text_scale_factor =>
      'టెక్స్ట్ స్కేల్ ఫ్యాక్టర్ని తగ్గించు';

  @override
  String get effects => 'ఎఫెక్ట్స్';

  @override
  String get expand_text => 'టెక్స్ట్ని విస్తరించు';

  @override
  String get font_size => 'ఫాంట్ సైజు';

  @override
  String get increase_or_decrease_word_spacing =>
      'పదాల మధ్య స్థలాన్ని పెంచు లేదా తగ్గించు';

  @override
  String get increase_or_decrease_letter_spacing =>
      'అక్షరాల మధ్య స్థలాన్ని పెంచు లేదా తగ్గించు';

  @override
  String get increase_or_decrease_line_height =>
      'లైన్ ఎత్తును పెంచు లేదా తగ్గించు';

  @override
  String get increase_or_decrease_text_size =>
      'టెక్స్ట్ సైజును పెంచు లేదా తగ్గించు';

  @override
  String get increment_word_spacing => 'పదాల మధ్య స్థలాన్ని పెంచు';

  @override
  String get increment_letter_spacing => 'అక్షరాల మధ్య స్థలాన్ని పెంచు';

  @override
  String get increment_line_height => 'లైన్ ఎత్తును పెంచు';

  @override
  String get increment_text_scale_factor => 'టెక్స్ట్ స్కేల్ ఫ్యాక్టర్ని పెంచు';

  @override
  String get less_info => 'సమాచారాన్ని దాచు';

  @override
  String get letter_spacing => 'అక్షరాల మధ్య స్థలం';

  @override
  String get line_height => 'లైన్ ఎత్తు';

  @override
  String get more_info => 'సమాచారాన్ని చూపించు';

  @override
  String get read_less => 'తక్కువ చదవండి';

  @override
  String get read_more => 'మరింత చదవండి';

  @override
  String get reduce_effects => 'స్క్రీన్ ఎఫెక్ట్స్‌ని తగ్గించు';

  @override
  String get reduce_text => 'టెక్స్ట్‌ని తగ్గించు';

  @override
  String get restore_settings => 'సెట్టింగ్స్‌ని పునరుద్ధరించు';

  @override
  String get restore_main_color => 'ప్రధాన రంగును పునరుద్ధరించు';

  @override
  String get return_to_main_colors => 'ప్రధాన రంగులకు తిరిగి వెళ్ళు';

  @override
  String get settings => 'సెట్టింగ్స్';

  @override
  String get size_and_text_display => 'సైజు మరియు టెక్స్ట్ ప్రదర్శన';

  @override
  String get slider_word_spacing => 'స్లైడర్ పదాల మధ్య స్థలం';

  @override
  String get slider_letter_spacing => 'స్లైడర్ అక్షరాల మధ్య స్థలం';

  @override
  String get slider_line_height => 'స్లైడర్ లైన్ ఎత్తు';

  @override
  String get theme_mode => 'థీమ్';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'థీమ్ ప్రొఫైల్ గుర్తించబడలేదు',
      'seizureSafe': 'సీజర్ సేఫ్',
      'visionImpaired': 'దృష్టి లోపం',
      'adhdFriendly': 'ADHD అనుకూలం',
      'none': 'డిఫాల్ట్',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'సీజర్ సేఫ్ ప్రొఫైల్';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'ప్రతిబింబాలను తొలగించి రంగును తగ్గించండి';

  @override
  String get theme_profile_seizure_safe_description =>
      'ఈ ప్రొఫైల్ మృగీ వ్యాధి ఉన్న మరియు సీజర్ల ప్రమాదంలో ఉన్న వినియోగదారులు ఫ్లాషింగ్ యానిమేషన్లు మరియు ప్రమాదకరమైన రంగుల కలయికల వల్ల వచ్చే సీజర్ల ప్రమాదాన్ని తొలగించడం ద్వారా సురక్షితంగా బ్రౌజ్ చేయడానికి అనుమతిస్తుంది.';

  @override
  String get theme_profile_vision_impaired_title => 'దృష్టి లోపం ప్రొఫైల్';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'అప్లికేషన్ దృశ్యమానతను మెరుగుపరచండి';

  @override
  String get theme_profile_vision_impaired_description =>
      'ఈ ప్రొఫైల్ దృష్టి లోపం, టన్నెల్ విజన్, కంటి పొర, గ్లాకోమా మరియు మరిన్ని వంటి చాలా దృష్టి లోపాలకు అందుబాటులో ఉండేలా అప్లికేషన్‌ను అనుకూలంగా మారుస్తుంది.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-అనుకూల ప్రొఫైల్';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'ఎక్కువ ఏకాగ్రత మరియు తక్కువ విచలనాలు';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ఈ ప్రొఫైల్ ADHD మరియు న్యూరోడెవలప్‌మెంటల్ డిజార్డర్స్ ఉన్న వ్యక్తులు నావిగేట్ చేయడానికి, చదవడానికి మరియు అప్లికేషన్ యొక్క ముఖ్యమైన అంశాలపై సులభంగా దృష్టి పెట్టడానికి సహాయపడటానికి విచలనాలను గణనీయంగా తగ్గిస్తుంది.';

  @override
  String get the_settings_have_been_reset => 'సెట్టింగ్స్ రీసెట్ చేయబడ్డాయి.';

  @override
  String get toggle_dark_mode => 'డార్క్ మోడ్‌ని టాగుల్ చేయండి';

  @override
  String get toggle_effects_mode => 'ఎఫెక్ట్స్ మోడ్‌ని టాగుల్ చేయండి';

  @override
  String get toggle_font_weight => 'ఫాంట్ బరువును టాగుల్ చేయండి';

  @override
  String get toggle_theme_profile => 'థీమ్ ప్రొఫైల్‌ని టాగుల్ చేయండి';

  @override
  String get word_spacing => 'పదాల మధ్య స్థలం';
}
