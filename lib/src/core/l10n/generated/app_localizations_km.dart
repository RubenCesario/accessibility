// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Khmer Central Khmer (`km`).
class AccessibilityLocalizationsKm extends AccessibilityLocalizations {
  AccessibilityLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get accessibility => 'ភាពងាយចូលប្រើប្រាស់';

  @override
  String get accessibility_settings => 'ការកំណត់ភាពងាយចូលប្រើប្រាស់';

  @override
  String get adjust_background_colors => 'កែសម្រួលពណ៌ផ្ទៃខាងក្រោយ';

  @override
  String get adjust_text_colors => 'កែសម្រួលពណ៌អក្សរ';

  @override
  String get align_center => 'តម្រឹមកណ្ដាល';

  @override
  String get align_left => 'តម្រឹមឆ្វេង';

  @override
  String get align_right => 'តម្រឹមស្ដាំ';

  @override
  String get bold_text => 'អក្សរដិត';

  @override
  String get change_bold_text => 'ប្ដូរអក្សរដិត';

  @override
  String get change_pages_background_color =>
      'ប្ដូរពណ៌ផ្ទៃខាងក្រោយទៃទំព័រទៅជា៖ ';

  @override
  String get change_text_color => 'ប្ដូរពណ៌អក្សរទៅជា៖ ';

  @override
  String get change_text_color_shade => 'ប្ដូរស្រមោលពណ៌ទៅជា៖ ';

  @override
  String get color_adjustment => 'ការកែសម្រួលពណ៌';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'ធម្មតា',
        'lowSaturation': 'ភាពផ្គាក់ខ្សោយ',
        'normal': 'ធម្មតា',
        'highSaturation': 'ភាពផ្គាក់ខ្ពស់',
        'monochrome': 'ម៉ូណូគ្រូម',
        'highContrast': 'កម្រិតផ្ទុយខ្ពស់',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'គំរូពណ៌បច្ចុប្បន្នគឺ៖ ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
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
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'បន្ថយគម្លាតរវាងពាក្យ';

  @override
  String get decrement_letter_spacing => 'បន្ថយគម្លាតរវាងអក្សរ';

  @override
  String get decrement_line_height => 'បន្ថយកម្ពស់ជួរបន្ទាត់';

  @override
  String get decrement_text_scale_factor => 'បន្ថយកត្ដាមាត្រដ្ឋានអក្សរ';

  @override
  String get effects => 'ប៉ះពាល់';

  @override
  String get expand_text => 'ពង្រីកអក្សរ';

  @override
  String get font_size => 'ទំហំអក្សរ';

  @override
  String get increase_or_decrease_word_spacing => 'បង្កើនឬបន្ថយគម្លាតរវាងពាក្យ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'បង្កើនឬបន្ថយគម្លាតរវាងអក្សរ';

  @override
  String get increase_or_decrease_line_height => 'បង្កើនឬបន្ថយកម្ពស់ជួរបន្ទាត់';

  @override
  String get increase_or_decrease_text_size => 'បង្កើនឬបន្ថយទំហំអក្សរ';

  @override
  String get increment_word_spacing => 'បង្កើនគម្លាតរវាងពាក្យ';

  @override
  String get increment_letter_spacing => 'បង្កើនគម្លាតរវាងអក្សរ';

  @override
  String get increment_line_height => 'បង្កើនកម្ពស់ជួរបន្ទាត់';

  @override
  String get increment_text_scale_factor => 'បង្កើនកត្ដាមាត្រដ្ឋានអក្សរ';

  @override
  String get less_info => 'លាក់ព័ត៌មាន';

  @override
  String get letter_spacing => 'គម្លាតរវាងអក្សរ';

  @override
  String get line_height => 'កម្ពស់ជួរបន្ទាត់';

  @override
  String get more_info => 'បង្ហាញព័ត៌មាន';

  @override
  String get read_less => 'អានតិចជាង';

  @override
  String get read_more => 'អានបន្ថែម';

  @override
  String get reduce_effects => 'កាត់បន្ថយប៉ះពាល់លើអេក្រង់';

  @override
  String get reduce_text => 'បន្ថយទំហំអក្សរ';

  @override
  String get restore_settings => 'ស្ដារការកំណត់ឡើងវិញ';

  @override
  String get restore_main_color => 'ស្ដារពណ៌មូលដ្ឋានឡើងវិញ';

  @override
  String get return_to_main_colors => 'ត្រឡប់ទៅពណ៌មូលដ្ឋាន';

  @override
  String get settings => 'ការកំណត់';

  @override
  String get size_and_text_display => 'ទំហំនិងការបង្ហាញអក្សរ';

  @override
  String get slider_word_spacing => 'របាររំកិលគម្លាតរវាងពាក្យ';

  @override
  String get slider_letter_spacing => 'របាររំកិលគម្លាតរវាងអក្សរ';

  @override
  String get slider_line_height => 'របាររំកិលកម្ពស់ជួរបន្ទាត់';

  @override
  String get theme_mode => 'រចនាបទ';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'មិនស្គាល់គំរូរចនាបទ',
        'seizureSafe': 'សុវត្ថិភាពពីជំងឺក្រុះក្រហាញ',
        'visionImpaired': 'ជំនួយភ្នែកចក្ខុ',
        'adhdFriendly': 'សំរាប់ ADHD',
        'none': 'លំនាំដើម',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'គំរូសុវត្ថិភាពពីជំងឺក្រុះក្រហាញ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'លុបចេញចំណាំងពន្លឺនិងកាត់បន្ថយពណ៌';

  @override
  String get theme_profile_seizure_safe_description =>
      'គំរូនេះអនុញ្ញាតិអ្នកប្រើប្រាស់ដែលមានជំងឺឆ្កួតជ្រូកនិងប្រហែលចំពោះជំងឺក្រុះក្រហាញ អាចរកមើលប្រើដោយសុវត្ថិភាពដោយលុបបំបាត់ហានិភ័យនៃជំងឺក្រុះក្រហាញដែលបណ្ដាលមកពីចលនាជីវភ្លាតនិងបន្សំពណ៌ដែលមានហានិភ័យក្រោមៗ';

  @override
  String get theme_profile_vision_impaired_title => 'គំរូសម្រាប់គែហែទន់ខ្សោយ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'បង្កើនការមើលឃើញនៃកម្មវិធី';

  @override
  String get theme_profile_vision_impaired_description =>
      'គំរូនេះសម្រួលកម្មវិធីអោយអាចចូលប្រើប្រាស់ដូចហ្នឹងសម្រាប់ជំងឺផ្នែកចក្ខុភាគច្រើន ដូចជាការមើលឃើញខ្សោយ ហុីនម៉ែលដូចរូងដែក, ការមើលឃើញតូច, ជំងឺប៉េបាស់ផ្កែប, ជំងឺហ្គូមា និងជាច្រើនទៀត។';

  @override
  String get theme_profile_adhd_friendly_title => 'គំរូសម្រាប់ ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'ពង្រឹងការផ្ដោតអារម្មណ៍និងបន្ថយការរំខាន';

  @override
  String get theme_profile_adhd_friendly_description =>
      'គំរូនេះកាត់បន្ថយការរំខានយ៉ាងគំហុក និងជួយអ្នកជំងឺ ADHD និងបញ្ហាការវិវះឋប្រសាទសន្សរប្រសាទអោយនិបន្ធជំរុញ អាន និងផ្ដោតអារម្មណ៍លើធាតុសំខាន់ៗនៃកម្មវិធីខ្លាំងជាង។';

  @override
  String get the_settings_have_been_reset => 'បានកំណត់ឡើងវិញហើយ។';

  @override
  String get toggle_dark_mode => 'បិទ/បើករបៀបងងឹត';

  @override
  String get toggle_effects_mode => 'បិទ/បើករបៀបប៉ះពាល់';

  @override
  String get toggle_font_weight => 'បិទ/បើកកម្រាស់អក្សរ';

  @override
  String get toggle_theme_profile => 'បិទ/បើកគំរូរចនាបទ';

  @override
  String get word_spacing => 'គម្លាតរវាងពាក្យ';

  @override
  String get accessible_font => 'ពុម្ពអក្សរងាយស្រួលប្រើ';

  @override
  String get accessible_font_subtitle =>
      'ប្រើពុម្ពអក្សរ Verdana សម្រាប់ការអានបានងាយជាងមុន';

  @override
  String get accessible_font_enabled => 'បានបើកពុម្ពអក្សរងាយស្រួលប្រើ';

  @override
  String get accessible_font_disabled => 'បានបិទពុម្ពអក្សរងាយស្រួលប្រើ';

  @override
  String get toggle_accessible_font => 'បិទ/បើកពុម្ពអក្សរងាយស្រួលប្រើ';
}
