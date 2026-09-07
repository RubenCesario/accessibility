// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Khmer Central Khmer (`km`).
class AccessibilityLocalizationsKm extends AccessibilityLocalizations {
  AccessibilityLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get accessibility => 'ភាពងាយចូលប្រើប្រាស់';

  @override
  String get accessibilitySettings => 'ការកំណត់ភាពងាយចូលប្រើប្រាស់';

  @override
  String get adjustBackgroundColors => 'កែសម្រួលពណ៌ផ្ទៃខាងក្រោយ';

  @override
  String get adjustTextColors => 'កែសម្រួលពណ៌អក្សរ';

  @override
  String get alignCenter => 'តម្រឹមកណ្ដាល';

  @override
  String get alignLeft => 'តម្រឹមឆ្វេង';

  @override
  String get alignRight => 'តម្រឹមស្ដាំ';

  @override
  String get textAlignment => 'ការតម្រឹមអត្ថបទ';

  @override
  String get boldText => 'អក្សរដិត';

  @override
  String get changeBoldText => 'ប្ដូរអក្សរដិត';

  @override
  String get changePagesBackgroundColor => 'ប្ដូរពណ៌ផ្ទៃខាងក្រោយទៃទំព័រទៅជា៖ ';

  @override
  String get changeTextColor => 'ប្ដូរពណ៌អក្សរទៅជា៖ ';

  @override
  String get changeTextColorShade => 'ប្ដូរស្រមោលពណ៌ទៅជា៖ ';

  @override
  String get colorAdjustment => 'ការកែសម្រួលពណ៌';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ធម្មតា',
      'lowSaturation': 'ភាពផ្គាក់ខ្សោយ',
      'normal': 'ធម្មតា',
      'highSaturation': 'ភាពផ្គាក់ខ្ពស់',
      'monochrome': 'ម៉ូណូគ្រូម',
      'highContrast': 'កម្រិតផ្ទុយខ្ពស់',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'គំរូពណ៌បច្ចុប្បន្នគឺ៖ ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'មិនស្គាល់ពណ៌',
      'cF44336': 'ក្រហម',
      'cE91E63': 'ផ្កាឈូក',
      'c9C27B0': 'ស្វាយ',
      'c673AB7': 'ស្វាយចាស់',
      'c3F51B5': 'អ៊ីនដីកូ',
      'c2196F3': 'ខៀវ',
      'c03A9F4': 'ខៀវច្រាល',
      'c00BCD4': 'សៀន',
      'c009688': 'ខៀវបៃតង',
      'c4CAF50': 'បៃតង',
      'c8BC34A': 'បៃតងពណ៌អូន',
      'cCDDC39': 'បៃតងខ្ចី',
      'cFFEB3B': 'លឿង',
      'cFFC107': 'អំបេរ',
      'cFF9800': 'ទឹកក្រូច',
      'cFF5722': 'ទឹកក្រូចចាស់',
      'c795548': 'ត្នោត',
      'c9E9E9E': 'ប្រផេះ',
      'c607D8B': 'ប្រផេះឡាំខៀវ',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'បន្ថយគម្លាតរវាងពាក្យ';

  @override
  String get decrementLetterSpacing => 'បន្ថយគម្លាតរវាងអក្សរ';

  @override
  String get decrementLineHeight => 'បន្ថយកម្ពស់ជួរបន្ទាត់';

  @override
  String get decrementTextScaleFactor => 'បន្ថយកត្ដាមាត្រដ្ឋានអក្សរ';

  @override
  String get effects => 'ប៉ះពាល់';

  @override
  String get expandText => 'ពង្រីកអក្សរ';

  @override
  String get fontSize => 'ទំហំអក្សរ';

  @override
  String get increaseOrDecreaseWordSpacing => 'បង្កើនឬបន្ថយគម្លាតរវាងពាក្យ';

  @override
  String get increaseOrDecreaseLetterSpacing => 'បង្កើនឬបន្ថយគម្លាតរវាងអក្សរ';

  @override
  String get increaseOrDecreaseLineHeight => 'បង្កើនឬបន្ថយកម្ពស់ជួរបន្ទាត់';

  @override
  String get increaseOrDecreaseTextSize => 'បង្កើនឬបន្ថយទំហំអក្សរ';

  @override
  String get incrementWordSpacing => 'បង្កើនគម្លាតរវាងពាក្យ';

  @override
  String get incrementLetterSpacing => 'បង្កើនគម្លាតរវាងអក្សរ';

  @override
  String get incrementLineHeight => 'បង្កើនកម្ពស់ជួរបន្ទាត់';

  @override
  String get incrementTextScaleFactor => 'បង្កើនកត្ដាមាត្រដ្ឋានអក្សរ';

  @override
  String get lessInfo => 'លាក់ព័ត៌មាន';

  @override
  String get letterSpacing => 'គម្លាតរវាងអក្សរ';

  @override
  String get lineHeight => 'កម្ពស់ជួរបន្ទាត់';

  @override
  String get moreInfo => 'បង្ហាញព័ត៌មាន';

  @override
  String get readLess => 'អានតិចជាង';

  @override
  String get readMore => 'អានបន្ថែម';

  @override
  String get reduceEffects => 'កាត់បន្ថយប៉ះពាល់លើអេក្រង់';

  @override
  String get reduceText => 'បន្ថយទំហំអក្សរ';

  @override
  String get restoreSettings => 'ស្ដារការកំណត់ឡើងវិញ';

  @override
  String get restoreMainColor => 'ស្ដារពណ៌មូលដ្ឋានឡើងវិញ';

  @override
  String get returnToMainColors => 'ត្រឡប់ទៅពណ៌មូលដ្ឋាន';

  @override
  String get settings => 'ការកំណត់';

  @override
  String get sizeAndTextDisplay => 'ទំហំនិងការបង្ហាញអក្សរ';

  @override
  String get sliderWordSpacing => 'របាររំកិលគម្លាតរវាងពាក្យ';

  @override
  String get sliderLetterSpacing => 'របាររំកិលគម្លាតរវាងអក្សរ';

  @override
  String get sliderLineHeight => 'របាររំកិលកម្ពស់ជួរបន្ទាត់';

  @override
  String get themeMode => 'រចនាបទ';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'មិនស្គាល់គំរូរចនាបទ',
      'seizureSafe': 'សុវត្ថិភាពពីជំងឺក្រុះក្រហាញ',
      'visionImpaired': 'ជំនួយភ្នែកចក្ខុ',
      'adhdFriendly': 'សំរាប់ ADHD',
      'none': 'ប្រវត្តិរូបលំនាំដើម',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'គំរូសុវត្ថិភាពពីជំងឺក្រុះក្រហាញ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'លុបចេញចំណាំងពន្លឺនិងកាត់បន្ថយពណ៌';

  @override
  String get themeProfileSeizureSafeDescription =>
      'គំរូនេះអនុញ្ញាតិអ្នកប្រើប្រាស់ដែលមានជំងឺឆ្កួតជ្រូកនិងប្រហែលចំពោះជំងឺក្រុះក្រហាញ អាចរកមើលប្រើដោយសុវត្ថិភាពដោយលុបបំបាត់ហានិភ័យនៃជំងឺក្រុះក្រហាញដែលបណ្ដាលមកពីចលនាជីវភ្លាតនិងបន្សំពណ៌ដែលមានហានិភ័យក្រោមៗ';

  @override
  String get themeProfileVisionImpairedTitle => 'គំរូសម្រាប់គែហែទន់ខ្សោយ';

  @override
  String get themeProfileVisionImpairedSubtitle => 'បង្កើនការមើលឃើញនៃកម្មវិធី';

  @override
  String get themeProfileVisionImpairedDescription =>
      'គំរូនេះសម្រួលកម្មវិធីអោយអាចចូលប្រើប្រាស់ដូចហ្នឹងសម្រាប់ជំងឺផ្នែកចក្ខុភាគច្រើន ដូចជាការមើលឃើញខ្សោយ ហុីនម៉ែលដូចរូងដែក, ការមើលឃើញតូច, ជំងឺប៉េបាស់ផ្កែប, ជំងឺហ្គូមា និងជាច្រើនទៀត។';

  @override
  String get themeProfileAdhdFriendlyTitle => 'គំរូសម្រាប់ ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'ពង្រឹងការផ្ដោតអារម្មណ៍និងបន្ថយការរំខាន';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'គំរូនេះកាត់បន្ថយការរំខានយ៉ាងគំហុក និងជួយអ្នកជំងឺ ADHD និងបញ្ហាការវិវះឋប្រសាទសន្សរប្រសាទអោយនិបន្ធជំរុញ អាន និងផ្ដោតអារម្មណ៍លើធាតុសំខាន់ៗនៃកម្មវិធីខ្លាំងជាង។';

  @override
  String get theSettingsHaveBeenReset => 'បានកំណត់ឡើងវិញហើយ។';

  @override
  String get toggleDarkMode => 'បិទ/បើករបៀបងងឹត';

  @override
  String get toggleEffectsMode => 'បិទ/បើករបៀបប៉ះពាល់';

  @override
  String get toggleFontWeight => 'បិទ/បើកកម្រាស់អក្សរ';

  @override
  String get toggleThemeProfile => 'បិទ/បើកគំរូរចនាបទ';

  @override
  String get wordSpacing => 'គម្លាតរវាងពាក្យ';

  @override
  String get accessibleFont => 'ពុម្ពអក្សរងាយស្រួលប្រើ';

  @override
  String get accessibleFontSubtitle =>
      'ប្រើពុម្ពអក្សរដែលងាយស្រួលអាន សម្រាប់ការអានកាន់តែប្រសើរ';

  @override
  String get accessibleFontEnabled => 'បានបើកពុម្ពអក្សរងាយស្រួលប្រើ';

  @override
  String get accessibleFontDisabled => 'បានបិទពុម្ពអក្សរងាយស្រួលប្រើ';

  @override
  String get toggleAccessibleFont => 'បិទ/បើកពុម្ពអក្សរងាយស្រួលប្រើ';

  @override
  String get settingsLoading => 'កំពុងផ្ទុកការកំណត់ភាពងាយចូលប្រើប្រាស់…';

  @override
  String get settingsLoadFailed =>
      'មិនអាចផ្ទុកការកំណត់ភាពងាយចូលប្រើប្រាស់បានទេ។';

  @override
  String get retry => 'ព្យាយាមម្ដងទៀត';
}
