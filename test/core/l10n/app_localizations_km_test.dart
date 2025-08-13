// ignore_for_file: missing_whitespace_between_adjacent_strings

import 'package:accessibility/src/core/l10n/generated/app_localizations_km.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsKm', () {
    late AccessibilityLocalizationsKm loc;

    setUp(() {
      loc = AccessibilityLocalizationsKm();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('km'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ភាពងាយចូលប្រើប្រាស់'));
      expect(
        loc.accessibility_settings,
        equals('ការកំណត់ភាពងាយចូលប្រើប្រាស់'),
      );
      expect(
        loc.adjust_background_colors,
        equals('កែសម្រួលពណ៌ផ្ទៃខាងក្រោយ'),
      );
      expect(loc.adjust_text_colors, equals('កែសម្រួលពណ៌អក្សរ'));
      expect(loc.align_center, equals('តម្រឹមកណ្ដាល'));
      expect(loc.align_left, equals('តម្រឹមឆ្វេង'));
      expect(loc.align_right, equals('តម្រឹមស្ដាំ'));
      expect(loc.bold_text, equals('អក្សរដិត'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('ប្ដូរអក្សរដិត'));
      expect(
        loc.change_pages_background_color,
        equals('ប្ដូរពណ៌ផ្ទៃខាងក្រោយទៃទំព័រទៅជា៖ '),
      );
      expect(
        loc.change_text_color,
        equals('ប្ដូរពណ៌អក្សរទៅជា៖ '),
      );
      expect(
        loc.change_text_color_shade,
        equals('ប្ដូរស្រមោលពណ៌ទៅជា៖ '),
      );
      expect(loc.color_adjustment, equals('ការកែសម្រួលពណ៌'));
      expect(
        loc.color_profile_changed_to,
        equals('គំរូពណ៌បច្ចុប្បន្នគឺ៖ '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('បន្ថយគម្លាតរវាងពាក្យ'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('បន្ថយគម្លាតរវាងអក្សរ'),
      );
      expect(loc.decrement_line_height, equals('បន្ថយកម្ពស់ជួរបន្ទាត់'));
      expect(
        loc.decrement_text_scale_factor,
        equals('បន្ថយកត្ដាមាត្រដ្ឋានអក្សរ'),
      );
      expect(loc.increment_word_spacing, equals('បង្កើនគម្លាតរវាងពាក្យ'));
      expect(loc.increment_letter_spacing, equals('បង្កើនគម្លាតរវាងអក្សរ'));
      expect(loc.increment_line_height, equals('បង្កើនកម្ពស់ជួរបន្ទាត់'));
      expect(
        loc.increment_text_scale_factor,
        equals('បង្កើនកត្ដាមាត្រដ្ឋានអក្សរ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('បង្កើនឬបន្ថយគម្លាតរវាងពាក្យ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('បង្កើនឬបន្ថយគម្លាតរវាងអក្សរ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('បង្កើនឬបន្ថយកម្ពស់ជួរបន្ទាត់'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('បង្កើនឬបន្ថយទំហំអក្សរ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ប៉ះពាល់'));
      expect(loc.expand_text, equals('ពង្រីកអក្សរ'));
      expect(loc.font_size, equals('ទំហំអក្សរ'));
      expect(loc.less_info, equals('លាក់ព័ត៌មាន'));
      expect(loc.letter_spacing, equals('គម្លាតរវាងអក្សរ'));
      expect(loc.line_height, equals('កម្ពស់ជួរបន្ទាត់'));
      expect(loc.more_info, equals('បង្ហាញព័ត៌មាន'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('អានតិចជាង'));
      expect(loc.read_more, equals('អានបន្ថែម'));
      expect(loc.reduce_effects, equals('កាត់បន្ថយប៉ះពាល់លើអេក្រង់'));
      expect(loc.reduce_text, equals('បន្ថយទំហំអក្សរ'));
      expect(loc.restore_settings, equals('ស្ដារការកំណត់ឡើងវិញ'));
      expect(
        loc.restore_main_color,
        equals('ស្ដារពណ៌មូលដ្ឋានឡើងវិញ'),
      );
      expect(
        loc.return_to_main_colors,
        equals('ត្រឡប់ទៅពណ៌មូលដ្ឋាន'),
      );
      expect(loc.settings, equals('ការកំណត់'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ទំហំនិងការបង្ហាញអក្សរ'),
      );
      expect(loc.slider_word_spacing, equals('របាររំកិលគម្លាតរវាងពាក្យ'));
      expect(loc.slider_letter_spacing, equals('របាររំកិលគម្លាតរវាងអក្សរ'));
      expect(loc.slider_line_height, equals('របាររំកិលកម្ពស់ជួរបន្ទាត់'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('រចនាបទ'));
      expect(
        loc.theme_profile('other'),
        equals('មិនស្គាល់គំរូរចនាបទ'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('សុវត្ថិភាពពីជំងឺក្រុះក្រហាញ'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('ជំនួយភ្នែកចក្ខុ'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('សំរាប់ ADHD'),
      );
      expect(loc.theme_profile('none'), equals('លំនាំដើម'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('គំរូសុវត្ថិភាពពីជំងឺក្រុះក្រហាញ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('លុបចេញចំណាំងពន្លឺនិងកាត់បន្ថយពណ៌'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'គំរូនេះអនុញ្ញាតិអ្នកប្រើប្រាស់ដែលមានជំងឺឆ្កួតជ្រូកនិង'
          'ប្រហែលចំពោះជំងឺក្រុះក្រហាញ អាចរកមើលប្រើដោយសុវត្ថិភាព'
          'ដោយលុបបំបាត់ហានិភ័យនៃជំងឺក្រុះក្រហាញដែលបណ្ដាលមកពី'
          'ចលនាជីវភ្លាតនិងបន្សំពណ៌ដែលមានហានិភ័យក្រោមៗ',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('គំរូសម្រាប់គែហែទន់ខ្សោយ'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('បង្កើនការមើលឃើញនៃកម្មវិធី'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'គំរូនេះសម្រួលកម្មវិធីអោយអាចចូលប្រើប្រាស់ដូចហ្នឹងសម្រាប់'
          'ជំងឺផ្នែកចក្ខុភាគច្រើន ដូចជាការមើលឃើញខ្សោយ '
          'ហុីនម៉ែលដូចរូងដែក, ការមើលឃើញតូច, '
          'ជំងឺប៉េបាស់ផ្កែប, ជំងឺហ្គូមា និងជាច្រើនទៀត។',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('គំរូសម្រាប់ ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ពង្រឹងការផ្ដោតអារម្មណ៍និងបន្ថយការរំខាន'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'គំរូនេះកាត់បន្ថយការរំខានយ៉ាងគំហុក និងជួយអ្នកជំងឺ '
          'ADHD និងបញ្ហាការវិវះឋប្រសាទសន្ស'
          'រប្រសាទអោយនិបន្ធជំរុញ អាន និងផ្ដោតអារម្មណ៍លើ'
          'ធាតុសំខាន់ៗនៃកម្មវិធីខ្លាំងជាង។',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('បានកំណត់ឡើងវិញហើយ។'),
      );
      expect(loc.toggle_dark_mode, equals('បិទ/បើករបៀបងងឹត'));
      expect(loc.toggle_effects_mode, equals('បិទ/បើករបៀបប៉ះពាល់'));
      expect(loc.toggle_font_weight, equals('បិទ/បើកកម្រាស់អក្សរ'));
      expect(loc.toggle_theme_profile, equals('បិទ/បើកគំរូរចនាបទ'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('ធម្មតា'));
      expect(loc.color_profile('lowSaturation'), equals('ភាពផ្គាក់ខ្សោយ'));
      expect(loc.color_profile('normal'), equals('ធម្មតា'));
      expect(
        loc.color_profile('highSaturation'),
        equals('ភាពផ្គាក់ខ្ពស់'),
      );
      expect(loc.color_profile('monochrome'), equals('ម៉ូណូគ្រូម'));
      expect(loc.color_profile('highContrast'), equals('កម្រិតផ្ទុយខ្ពស់'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('មិនស្គាល់ពណ៌'));
      expect(loc.color('cF44336'), equals('ក្រហម'));
      expect(loc.color('cE91E63'), equals('ផ្កាឈូក'));
      expect(loc.color('c9C27B0'), equals('ស្វាយ'));
      expect(loc.color('c673AB7'), equals('ស្វាយចាស់'));
      expect(loc.color('c3F51B5'), equals('អ៊ីនដីកូ'));
      expect(loc.color('c2196F3'), equals('ខៀវ'));
      expect(loc.color('c03A9F4'), equals('ខៀវច្រាល'));
      expect(loc.color('c00BCD4'), equals('សៀន'));
      expect(loc.color('c009688'), equals('ខៀវបៃតង'));
      expect(loc.color('c4CAF50'), equals('បៃតង'));
      expect(loc.color('c8BC34A'), equals('បៃតងពណ៌អូន'));
      expect(loc.color('cCDDC39'), equals('បៃតងខ្ចី'));
      expect(loc.color('cFFEB3B'), equals('លឿង'));
      expect(loc.color('cFFC107'), equals('អំបេរ'));
      expect(loc.color('cFF9800'), equals('ទឹកក្រូច'));
      expect(loc.color('cFF5722'), equals('ទឹកក្រូចចាស់'));
      expect(loc.color('c795548'), equals('ត្នោត'));
      expect(loc.color('c9E9E9E'), equals('ប្រផេះ'));
      expect(loc.color('c607D8B'), equals('ប្រផេះឡាំខៀវ'));
    });
  });
}
