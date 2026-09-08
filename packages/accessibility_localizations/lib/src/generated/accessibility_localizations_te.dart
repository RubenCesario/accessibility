// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AccessibilityLocalizationsTe extends AccessibilityLocalizations {
  AccessibilityLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get accessibility => 'ప్రాప్యత';

  @override
  String get accessibilitySettings => 'ప్రాప్యత సెట్టింగ్స్';

  @override
  String get adjustBackgroundColors => 'నేపథ్య రంగులను సర్దుబాటు చేయండి';

  @override
  String get adjustTextColors => 'టెక్స్ట్ రంగులను సర్దుబాటు చేయండి';

  @override
  String get alignCenter => 'మధ్యలో సరిపరచు';

  @override
  String get alignLeft => 'ఎడమవైపు సరిపరచు';

  @override
  String get alignRight => 'కుడివైపు సరిపరచు';

  @override
  String get textAlignment => 'వచన అమరిక';

  @override
  String get boldText => 'బోల్డ్ టెక్స్ట్';

  @override
  String get changeBoldText => 'బోల్డ్ టెక్స్ట్ని మార్చండి';

  @override
  String get changePagesBackgroundColor =>
      'పేజీల నేపథ్య రంగును ఈ విధంగా మార్చండి: ';

  @override
  String get changeTextColor => 'టెక్స్ట్ రంగును ఈ విధంగా మార్చండి: ';

  @override
  String get changeTextColorShade => 'రంగు షేడ్ని ఈ విధంగా మార్చండి: ';

  @override
  String get colorAdjustment => 'రంగు సర్దుబాటు';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => 'ప్రస్తుత రంగు ప్రొఫైల్: ';

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
  String get decrementWordSpacing => 'పదాల మధ్య స్థలాన్ని తగ్గించు';

  @override
  String get decrementLetterSpacing => 'అక్షరాల మధ్య స్థలాన్ని తగ్గించు';

  @override
  String get decrementLineHeight => 'లైన్ ఎత్తును తగ్గించు';

  @override
  String get decrementTextScaleFactor => 'టెక్స్ట్ స్కేల్ ఫ్యాక్టర్ని తగ్గించు';

  @override
  String get effects => 'ఎఫెక్ట్స్';

  @override
  String get expandText => 'టెక్స్ట్ని విస్తరించు';

  @override
  String get fontSize => 'ఫాంట్ సైజు';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'పదాల మధ్య స్థలాన్ని పెంచు లేదా తగ్గించు';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'అక్షరాల మధ్య స్థలాన్ని పెంచు లేదా తగ్గించు';

  @override
  String get increaseOrDecreaseLineHeight => 'లైన్ ఎత్తును పెంచు లేదా తగ్గించు';

  @override
  String get increaseOrDecreaseTextSize =>
      'టెక్స్ట్ సైజును పెంచు లేదా తగ్గించు';

  @override
  String get incrementWordSpacing => 'పదాల మధ్య స్థలాన్ని పెంచు';

  @override
  String get incrementLetterSpacing => 'అక్షరాల మధ్య స్థలాన్ని పెంచు';

  @override
  String get incrementLineHeight => 'లైన్ ఎత్తును పెంచు';

  @override
  String get incrementTextScaleFactor => 'టెక్స్ట్ స్కేల్ ఫ్యాక్టర్ని పెంచు';

  @override
  String get lessInfo => 'సమాచారాన్ని దాచు';

  @override
  String get letterSpacing => 'అక్షరాల మధ్య స్థలం';

  @override
  String get lineHeight => 'లైన్ ఎత్తు';

  @override
  String get moreInfo => 'సమాచారాన్ని చూపించు';

  @override
  String get readLess => 'తక్కువ చదవండి';

  @override
  String get readMore => 'మరింత చదవండి';

  @override
  String get reduceEffects => 'స్క్రీన్ ఎఫెక్ట్స్‌ని తగ్గించు';

  @override
  String get reduceText => 'టెక్స్ట్‌ని తగ్గించు';

  @override
  String get restoreSettings => 'సెట్టింగ్స్‌ని పునరుద్ధరించు';

  @override
  String get restoreMainColor => 'ప్రధాన రంగును పునరుద్ధరించు';

  @override
  String get returnToMainColors => 'ప్రధాన రంగులకు తిరిగి వెళ్ళు';

  @override
  String get settings => 'సెట్టింగ్స్';

  @override
  String get sizeAndTextDisplay => 'సైజు మరియు టెక్స్ట్ ప్రదర్శన';

  @override
  String get sliderWordSpacing => 'స్లైడర్ పదాల మధ్య స్థలం';

  @override
  String get sliderLetterSpacing => 'స్లైడర్ అక్షరాల మధ్య స్థలం';

  @override
  String get sliderLineHeight => 'స్లైడర్ లైన్ ఎత్తు';

  @override
  String get themeMode => 'థీమ్';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'థీమ్ ప్రొఫైల్ గుర్తించబడలేదు',
      'seizureSafe': 'సీజర్ సేఫ్',
      'visionImpaired': 'దృష్టి లోపం',
      'adhdFriendly': 'ADHD అనుకూలం',
      'none': 'డిఫాల్ట్ ప్రొఫైల్',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'సీజర్ సేఫ్ ప్రొఫైల్';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'ప్రతిబింబాలను తొలగించి రంగును తగ్గించండి';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ఈ ప్రొఫైల్ మృగీ వ్యాధి ఉన్న మరియు సీజర్ల ప్రమాదంలో ఉన్న వినియోగదారులు ఫ్లాషింగ్ యానిమేషన్లు మరియు ప్రమాదకరమైన రంగుల కలయికల వల్ల వచ్చే సీజర్ల ప్రమాదాన్ని తొలగించడం ద్వారా సురక్షితంగా బ్రౌజ్ చేయడానికి అనుమతిస్తుంది.';

  @override
  String get themeProfileVisionImpairedTitle => 'దృష్టి లోపం ప్రొఫైల్';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'అప్లికేషన్ దృశ్యమానతను మెరుగుపరచండి';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ఈ ప్రొఫైల్ దృష్టి లోపం, టన్నెల్ విజన్, కంటి పొర, గ్లాకోమా మరియు మరిన్ని వంటి చాలా దృష్టి లోపాలకు అందుబాటులో ఉండేలా అప్లికేషన్‌ను అనుకూలంగా మారుస్తుంది.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-అనుకూల ప్రొఫైల్';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'ఎక్కువ ఏకాగ్రత మరియు తక్కువ విచలనాలు';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ఈ ప్రొఫైల్ ADHD మరియు న్యూరోడెవలప్‌మెంటల్ డిజార్డర్స్ ఉన్న వ్యక్తులు నావిగేట్ చేయడానికి, చదవడానికి మరియు అప్లికేషన్ యొక్క ముఖ్యమైన అంశాలపై సులభంగా దృష్టి పెట్టడానికి సహాయపడటానికి విచలనాలను గణనీయంగా తగ్గిస్తుంది.';

  @override
  String get theSettingsHaveBeenReset => 'సెట్టింగ్స్ రీసెట్ చేయబడ్డాయి.';

  @override
  String get toggleDarkMode => 'డార్క్ మోడ్‌ని టాగుల్ చేయండి';

  @override
  String get toggleEffectsMode => 'ఎఫెక్ట్స్ మోడ్‌ని టాగుల్ చేయండి';

  @override
  String get toggleFontWeight => 'ఫాంట్ బరువును టాగుల్ చేయండి';

  @override
  String get toggleThemeProfile => 'థీమ్ ప్రొఫైల్‌ని టాగుల్ చేయండి';

  @override
  String get wordSpacing => 'పదాల మధ్య స్థలం';

  @override
  String get accessibleFont => 'అందుబాటులో ఉన్న ఫాంట్';

  @override
  String get accessibleFontSubtitle =>
      'మెరుగైన చదవగలిగే సామర్థ్యం కోసం యాక్సెస్ చేయగల ఫాంట్‌ను ఉపయోగించండి';

  @override
  String get accessibleFontEnabled => 'అందుబాటులో ఉన్న ఫాంట్ ప్రారంభించబడింది';

  @override
  String get accessibleFontDisabled => 'అందుబాటులో ఉన్న ఫాంట్ నిలిపివేయబడింది';

  @override
  String get toggleAccessibleFont => 'అందుబాటులో ఉన్న ఫాంట్‌ని టాగుల్ చేయండి';

  @override
  String get settingsLoading => 'ప్రాప్యత సెట్టింగ్‌లు లోడ్ అవుతున్నాయి…';

  @override
  String get settingsLoadFailed =>
      'ప్రాప్యత సెట్టింగ్‌లను లోడ్ చేయడం సాధ్యపడలేదు.';

  @override
  String get retry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get themeModeSystem => 'సిస్టమ్';

  @override
  String get themeModeLight => 'లైట్';

  @override
  String get themeModeDark => 'డార్క్';

  @override
  String get effectsModeSystem => 'సిస్టమ్';

  @override
  String get effectsModeEnabled => 'ఆన్';

  @override
  String get effectsModeDisabled => 'ఆఫ్';
}
