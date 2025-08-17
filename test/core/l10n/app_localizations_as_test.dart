import 'package:accessibility/src/core/l10n/generated/app_localizations_as.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsAs', () {
    late AccessibilityLocalizationsAs loc;

    setUp(() {
      loc = AccessibilityLocalizationsAs();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('as'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('প্ৰৱেশযোগ্যতা'));
      expect(loc.accessibility_settings, equals('প্ৰৱেশযোগ্যতা ছেটিংছ'));
      expect(
        loc.adjust_background_colors,
        equals('পৃষ্ঠাৰ পটভূমিৰ ৰং সলনি কৰক'),
      );
      expect(loc.adjust_text_colors, equals('লিখনৰ ৰং সলনি কৰক'));
      expect(loc.align_center, equals('মাজত সজাওক'));
      expect(loc.align_left, equals('বাওঁফালে সজাওক'));
      expect(loc.align_right, equals('সোঁফালে সজাওক'));
      expect(loc.bold_text, equals('ডাঠ লিখনী'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('ডাঠ লিখনী সলনি কৰক'));
      expect(
        loc.change_pages_background_color,
        equals('পৃষ্ঠাৰ পটভূমিৰ ৰং এইটোলৈ সলনি কৰক: '),
      );
      expect(loc.change_text_color, equals('লিখনৰ ৰং এইটোলৈ সলনি কৰক: '));
      expect(
        loc.change_text_color_shade,
        equals('লিখনৰ ৰংৰ ছাঁ এইটোলৈ সলনি কৰক: '),
      );
      expect(loc.color_adjustment, equals('ৰং সমন্বয়'));
      expect(
        loc.color_profile_changed_to,
        equals("বৰ্তমান ৰং প্ৰ'ফাইল হৈছে: "),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('শব্দৰ মাজৰ দূৰত্ব কমাওক'));
      expect(loc.decrement_letter_spacing, equals('আখৰৰ মাজৰ দূৰত্ব কমাওক'));
      expect(loc.decrement_line_height, equals('শাৰী উচ্চতা কমাওক'));
      expect(
        loc.decrement_text_scale_factor,
        equals('লিখন স্কেল ফেক্টৰ কমাওক'),
      );
      expect(
        loc.increment_word_spacing,
        equals('শব্দৰ মাজৰ দূৰত্ব বৃদ্ধি কৰক'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('আখৰৰ মাজৰ দূৰত্ব বৃদ্ধি কৰক'),
      );
      expect(loc.increment_line_height, equals('শাৰী উচ্চতা বৃদ্ধি কৰক'));
      expect(
        loc.increment_text_scale_factor,
        equals('লিখন স্কেল ফেক্টৰ বৃদ্ধি কৰক'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('শব্দৰ মাজৰ দূৰত্ব বৃদ্ধি বা হ্ৰাস কৰক'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('আখৰৰ মাজৰ দূৰত্ব বৃদ্ধি বা হ্ৰাস কৰক'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('শাৰী উচ্চতা বৃদ্ধি বা হ্ৰাস কৰক'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('লিখনৰ আকাৰ বৃদ্ধি বা হ্ৰাস কৰক'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('প্ৰভাৱসমূহ'));
      expect(loc.expand_text, equals('লিখনী বিস্তাৰিত কৰক'));
      expect(loc.font_size, equals('আখৰৰ আকাৰ'));
      expect(loc.less_info, equals('তথ্য লুকুৱাওক'));
      expect(loc.letter_spacing, equals('আখৰৰ মাজৰ দূৰত্ব'));
      expect(loc.line_height, equals('শাৰী উচ্চতা'));
      expect(loc.more_info, equals('তথ্য দেখুৱাওক'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('কম পঢ়ক'));
      expect(loc.read_more, equals('অধিক পঢ়ক'));
      expect(loc.reduce_effects, equals('স্ক্ৰীনৰ প্ৰভাৱসমূহ হ্ৰাস কৰক'));
      expect(loc.reduce_text, equals('লিখনী হ্ৰাস কৰক'));
      expect(loc.restore_settings, equals('ছেটিংছ পুনৰুদ্ধাৰ কৰক'));
      expect(loc.restore_main_color, equals('মূল ৰং পুনৰুদ্ধাৰ কৰক'));
      expect(loc.return_to_main_colors, equals('মূল ৰংলৈ উভতি যাওক'));
      expect(loc.settings, equals('ছেটিংছ'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('আকাৰ আৰু লিখন প্ৰদর্শন'));
      expect(
        loc.slider_word_spacing,
        equals('শব্দৰ মাজৰ দূৰত্ব সলাই থকা স্লাইডাৰ'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('আখৰৰ মাজৰ দূৰত্ব সলাই থকা স্লাইডাৰ'),
      );
      expect(loc.slider_line_height, equals('শাৰী উচ্চতা সলাই থকা স্লাইডাৰ'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals("থীম প্ৰ'ফাইল চিনাক্ত হোৱা নাই"),
      );
      expect(loc.theme_profile('seizureSafe'), equals('উপশম-নিরাপদ'));
      expect(loc.theme_profile('visionImpaired'), equals('দৃষ্টিহীন-সহায়ক'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-সহায়ক'));
      expect(loc.theme_profile('none'), equals('ডিফল্ট'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals("উপশম-নিরাপদ প্ৰ'ফাইল"),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('প্ৰতিৰূপ আঁতৰাওক আৰু ৰং হ্ৰাস কৰক'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          "এই প্ৰ'ফাইলটো মৃগী ৰোগী বা উপশমৰ আশংকা থকা ব্যৱহাৰকাৰীসকলৰ "
          'বাবে ঝলমলীয়া এনিমেশ্বন আৰু বিপজ্জনক ৰংসমূহ আঁতৰাই নিৰাপদভাৱে '
          'ব্যৱহাৰ কৰিবলৈ সহায় কৰে।',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals("দৃষ্টিহীন-সহায়ক প্ৰ'ফাইল"),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('এপ্লিকেশ্যনৰ দৃশ্যতা উন্নত কৰক'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          "এই প্ৰ'ফাইলটোৱে দৃষ্টিহীনতা, টানেল ভিশন, ছানি, গ্লুকোমা আদি "
          'দৃষ্টিসম্বন্ধীয় অসুবিধাসমূহ থকা ব্যৱহাৰকাৰীসকলৰ বাবে এপ্লিকেশ্যনটো '
          'অধিক উপযোগী কৰে।',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals("ADHD-সহায়ক প্ৰ'ফাইল"),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('অধিক মনোযোগ আৰু কম বিঘ্নতা'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          "এই প্ৰ'ফাইলটোৱে ADHD আৰু নিউৰোডেভেলপমেন্টেল অসুবিধাসমূহ "
          'থকা ব্যৱহাৰকাৰীসকলৰ বাবে বিঘ্নতা হ্ৰাস কৰি, সহজে নেভিগেট, '
          'পঢ়া আৰু প্ৰয়োজনীয় উপাদানত মনোযোগ দিবলৈ সহায় কৰে।',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ছেটিংছ পুনৰায় সংৰক্ষিত হৈছে।'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals("ডাৰ্ক ম'ড টগল কৰক"));
      expect(loc.toggle_effects_mode, equals("ইফেক্ট ম'ড টগল কৰক"));
      expect(loc.toggle_font_weight, equals('আখৰৰ ওজন টগল কৰক'));
      expect(loc.word_spacing, equals('শব্দৰ মাজৰ দূৰত্ব'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('কম সম্পৃক্ততা'));
      expect(loc.color_profile('normal'), equals('সাধাৰণ'));
      expect(loc.color_profile('highSaturation'), equals('বেছি সম্পৃক্ততা'));
      expect(loc.color_profile('monochrome'), equals('এক ৰঙা'));
      expect(loc.color_profile('highContrast'), equals('বেছি বৈপৰীত্য'));
      expect(loc.color_profile('unknown'), equals('সাধাৰণ'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('ৰঙা'));
      expect(loc.color('cE91E63'), equals('গুলাপী'));
      expect(loc.color('c9C27B0'), equals('বেঙুনী'));
      expect(loc.color('c673AB7'), equals('গাঢ় বেঙুনী'));
      expect(loc.color('c3F51B5'), equals('নীলা'));
      expect(loc.color('c2196F3'), equals('বগা'));
      expect(loc.color('c03A9F4'), equals('হালধীয়া নীলা'));
      expect(loc.color('c00BCD4'), equals('চিয়ান'));
      expect(loc.color('c009688'), equals('টিল'));
      expect(loc.color('c4CAF50'), equals('সেউজীয়া'));
      expect(loc.color('c8BC34A'), equals('হালধীয়া সেউজীয়া'));
      expect(loc.color('cCDDC39'), equals('নিম'));
      expect(loc.color('cFFEB3B'), equals('হালধীয়া'));
      expect(loc.color('cFFC107'), equals('এম্বাৰ'));
      expect(loc.color('cFF9800'), equals('কমলা'));
      expect(loc.color('cFF5722'), equals('গাঢ় কমলা'));
      expect(loc.color('c795548'), equals('বাউণী'));
      expect(loc.color('c9E9E9E'), equals('ধূসৰ'));
      expect(loc.color('c607D8B'), equals('নীলা-ধূসৰ'));
      expect(loc.color('unknown'), equals('ৰং চিনাক্ত হোৱা নাই'));
    });
  });
}
