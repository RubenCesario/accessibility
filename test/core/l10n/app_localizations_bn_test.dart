import 'package:accessibility/src/core/l10n/generated/app_localizations_bn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsBn', () {
    late AccessibilityLocalizationsBn loc;

    setUp(() {
      loc = AccessibilityLocalizationsBn();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('bn'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('প্রবেশযোগ্যতা'));
      expect(loc.accessibility_settings, equals('প্রবেশযোগ্যতার সেটিংস'));
      expect(loc.adjust_background_colors, equals('পটভূমির রঙ সামঞ্জস্য করুন'));
      expect(loc.adjust_text_colors, equals('লেখার রঙ সামঞ্জস্য করুন'));
      expect(loc.align_center, equals('কেন্দ্রে সারিবদ্ধ করুন'));
      expect(loc.align_left, equals('বামে সারিবদ্ধ করুন'));
      expect(loc.align_right, equals('ডানে সারিবদ্ধ করুন'));
      expect(loc.bold_text, equals('গাঢ় লেখা'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('গাঢ় লেখার ধরন পরিবর্তন করুন'));
      expect(
        loc.change_pages_background_color,
        equals('পৃষ্ঠার পটভূমির রঙ পরিবর্তন করুন: '),
      );
      expect(loc.change_text_color, equals('লেখার রঙ পরিবর্তন করুন: '));
      expect(loc.change_text_color_shade, equals('রঙের ছায়া পরিবর্তন করুন: '));
      expect(loc.color_adjustment, equals('রঙ সামঞ্জস্য'));
      expect(loc.color_profile_changed_to, equals('বর্তমান রঙ প্রোফাইল: '));
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('শব্দের ব্যবধান কমান'));
      expect(loc.decrement_letter_spacing, equals('অক্ষরের ব্যবধান কমান'));
      expect(loc.decrement_line_height, equals('লাইনের উচ্চতা কমান'));
      expect(
        loc.decrement_text_scale_factor,
        equals('টেক্সট স্কেল ফ্যাক্টর কমান'),
      );
      expect(loc.increment_word_spacing, equals('শব্দের ব্যবধান বাড়ান'));
      expect(loc.increment_letter_spacing, equals('অক্ষরের ব্যবধান বাড়ান'));
      expect(loc.increment_line_height, equals('লাইনের উচ্চতা বাড়ান'));
      expect(
        loc.increment_text_scale_factor,
        equals('টেক্সট স্কেল ফ্যাক্টর বাড়ান'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('শব্দের ব্যবধান বাড়ান বা কমান'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('অক্ষরের ব্যবধান বাড়ান বা কমান'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('লাইনের উচ্চতা বাড়ান বা কমান'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('লেখার আকার বাড়ান বা কমান'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('প্রভাবসমূহ'));
      expect(loc.expand_text, equals('টেক্সট প্রসারিত করুন'));
      expect(loc.font_size, equals('ফন্টের আকার'));
      expect(loc.less_info, equals('তথ্য লুকান'));
      expect(loc.letter_spacing, equals('অক্ষরের ব্যবধান'));
      expect(loc.line_height, equals('লাইনের উচ্চতা'));
      expect(loc.more_info, equals('তথ্য দেখান'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('কম পড়ুন'));
      expect(loc.read_more, equals('আরও পড়ুন'));
      expect(loc.reduce_effects, equals('স্ক্রিনে প্রভাব কমান'));
      expect(loc.reduce_text, equals('লেখা সংক্ষিপ্ত করুন'));
      expect(loc.restore_settings, equals('সেটিংস পুনরুদ্ধার করুন'));
      expect(loc.restore_main_color, equals('মূল রঙ পুনরুদ্ধার করুন'));
      expect(loc.return_to_main_colors, equals('মূল রঙে ফিরে যান'));
      expect(loc.settings, equals('সেটিংস'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('আকার ও টেক্সট প্রদর্শন'));
      expect(loc.slider_word_spacing, equals('শব্দ ব্যবধান স্লাইডার'));
      expect(loc.slider_letter_spacing, equals('অক্ষর ব্যবধান স্লাইডার'));
      expect(loc.slider_line_height, equals('লাইন উচ্চতা স্লাইডার'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('থিম প্রোফাইল সনাক্ত করা যায়নি'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('সিজার-নিরাপদ'));
      expect(loc.theme_profile('visionImpaired'), equals('দৃষ্টিপ্রতিবন্ধী'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-বান্ধব'));
      expect(loc.theme_profile('none'), equals('ডিফল্ট'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('সিজার-নিরাপদ প্রোফাইল'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('প্রতিফলন সরান এবং রঙ কমান'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'এই প্রোফাইলটি মৃগী বা খিঁচুনি ঝুঁকিপূর্ণ ব্যবহারকারীদের জন্য নিরাপদ '
          'ব্রাউজিং নিশ্চিত করে, ঝলমলে অ্যানিমেশন ও বিপজ্জনক রঙের '
          'সংমিশ্রণ সরিয়ে।',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('দৃষ্টিপ্রতিবন্ধী প্রোফাইল'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('অ্যাপ্লিকেশনের দৃশ্যমানতা উন্নত করুন'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'এই প্রোফাইলটি অ্যাপ্লিকেশনকে বিভিন্ন দৃষ্টিপ্রতিবন্ধকতা, যেমন টানেল '
          'ভিশন, ক্যাটারাক্ট, গ্লুকোমা ইত্যাদির জন্য আরও প্রবেশযোগ্য করে তোলে।',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-বান্ধব প্রোফাইল'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('বেশি মনোযোগ, কম বিভ্রান্তি'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'এই প্রোফাইলটি ADHD ও নিউরোডেভেলপমেন্টাল ডিসঅর্ডারযুক্ত ব্যক্তিদের '
          'জন্য বিভ্রান্তি কমিয়ে, অ্যাপের গুরুত্বপূর্ণ অংশে মনোযোগ '
          'দিতে সহায়তা করে।',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('সেটিংস রিসেট করা হয়েছে।'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('ডার্ক মোড চালু/বন্ধ করুন'));
      expect(loc.toggle_effects_mode, equals('ইফেক্ট মোড চালু/বন্ধ করুন'));
      expect(loc.toggle_font_weight, equals('ফন্টের ওজন চালু/বন্ধ করুন'));
      expect(loc.word_spacing, equals('শব্দের ব্যবধান'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('কম স্যাচুরেশন'));
      expect(loc.color_profile('normal'), equals('স্বাভাবিক'));
      expect(loc.color_profile('highSaturation'), equals('উচ্চ স্যাচুরেশন'));
      expect(loc.color_profile('monochrome'), equals('মনোক্রোম'));
      expect(loc.color_profile('highContrast'), equals('উচ্চ কনট্রাস্ট'));
      expect(loc.color_profile('unknown'), equals('স্বাভাবিক'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('লাল'));
      expect(loc.color('cE91E63'), equals('গোলাপি'));
      expect(loc.color('c9C27B0'), equals('বেগুনি'));
      expect(loc.color('c673AB7'), equals('গাঢ় বেগুনি'));
      expect(loc.color('c3F51B5'), equals('ইন্ডিগো'));
      expect(loc.color('c2196F3'), equals('নীল'));
      expect(loc.color('c03A9F4'), equals('হালকা নীল'));
      expect(loc.color('c00BCD4'), equals('সায়ান'));
      expect(loc.color('c009688'), equals('টিল'));
      expect(loc.color('c4CAF50'), equals('সবুজ'));
      expect(loc.color('c8BC34A'), equals('হালকা সবুজ'));
      expect(loc.color('cCDDC39'), equals('লেম'));
      expect(loc.color('cFFEB3B'), equals('হলুদ'));
      expect(loc.color('cFFC107'), equals('অ্যাম্বার'));
      expect(loc.color('cFF9800'), equals('কমলা'));
      expect(loc.color('cFF5722'), equals('গাঢ় কমলা'));
      expect(loc.color('c795548'), equals('বাদামী'));
      expect(loc.color('c9E9E9E'), equals('ধূসর'));
      expect(loc.color('c607D8B'), equals('নীল-ধূসর'));
      expect(loc.color('unknown'), equals('রঙ শনাক্ত করা যায়নি'));
    });
  });
}
