// ignore_for_file: lines_longer_than_80_chars

import 'package:accessibility/src/core/l10n/generated/app_localizations_th.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsTh', () {
    late AccessibilityLocalizationsTh loc;

    setUp(() {
      loc = AccessibilityLocalizationsTh();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('th'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('การเข้าถึง'));
      expect(
        loc.accessibility_settings,
        equals('การตั้งค่าการเข้าถึง'),
      );
      expect(
        loc.adjust_background_colors,
        equals('ปรับสีพื้นหลัง'),
      );
      expect(loc.adjust_text_colors, equals('ปรับสีข้อความ'));
      expect(loc.align_center, equals('จัดกึ่งกลาง'));
      expect(loc.align_left, equals('จัดชิดซ้าย'));
      expect(loc.align_right, equals('จัดชิดขวา'));
      expect(loc.bold_text, equals('ข้อความตัวหนา'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('เปลี่ยนข้อความตัวหนา'));
      expect(
        loc.change_pages_background_color,
        equals('เปลี่ยนสีพื้นหลังของหน้าเป็น: '),
      );
      expect(
        loc.change_text_color,
        equals('เปลี่ยนสีของข้อความเป็น: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('เปลี่ยนเฉดสีเป็น: '),
      );
      expect(loc.color_adjustment, equals('การปรับสี'));
      expect(
        loc.color_profile_changed_to,
        equals('โปรไฟล์สีปัจจุบันคือ: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('ลดระยะห่างระหว่างคำ'));
      expect(
        loc.decrement_letter_spacing,
        equals('ลดระยะห่างระหว่างตัวอักษร'),
      );
      expect(loc.decrement_line_height, equals('ลดความสูงของบรรทัด'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ลดปัจจัยการขยายข้อความ'),
      );
      expect(loc.increment_word_spacing, equals('เพิ่มระยะห่างระหว่างคำ'));
      expect(
        loc.increment_letter_spacing,
        equals('เพิ่มระยะห่างระหว่างตัวอักษร'),
      );
      expect(loc.increment_line_height, equals('เพิ่มความสูงของบรรทัด'));
      expect(
        loc.increment_text_scale_factor,
        equals('เพิ่มปัจจัยการขยายข้อความ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('เพิ่มหรือลดระยะห่างระหว่างคำ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('เพิ่มหรือลดระยะห่างระหว่างตัวอักษร'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('เพิ่มหรือลดความสูงของบรรทัด'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('เพิ่มหรือลดขนาดข้อความ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('เอฟเฟกต์'));
      expect(loc.expand_text, equals('ขยายข้อความ'));
      expect(loc.font_size, equals('ขนาดตัวอักษร'));
      expect(loc.less_info, equals('ซ่อนข้อมูล'));
      expect(loc.letter_spacing, equals('ระยะห่างระหว่างตัวอักษร'));
      expect(loc.line_height, equals('ความสูงของบรรทัด'));
      expect(loc.more_info, equals('แสดงข้อมูล'));
      expect(loc.word_spacing, equals('ระยะห่างระหว่างคำ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('อ่านน้อยลง'));
      expect(loc.read_more, equals('อ่านเพิ่มเติม'));
      expect(
        loc.reduce_effects,
        equals('ลดเอฟเฟกต์บนหน้าจอ'),
      );
      expect(loc.reduce_text, equals('ลดขนาดข้อความ'));
      expect(loc.restore_settings, equals('คืนค่าการตั้งค่า'));
      expect(loc.restore_main_color, equals('คืนค่าสีหลัก'));
      expect(
        loc.return_to_main_colors,
        equals('กลับไปยังสีหลัก'),
      );
      expect(loc.settings, equals('การตั้งค่า'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ขนาดและการแสดงข้อความ'),
      );
      expect(
        loc.slider_word_spacing,
        equals('ตัวเลื่อนระยะห่างระหว่างคำ'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('ตัวเลื่อนระยะห่างระหว่างตัวอักษร'),
      );
      expect(loc.slider_line_height, equals('ตัวเลื่อนความสูงของบรรทัด'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('ธีม'));
      expect(
        loc.theme_profile('other'),
        equals('ไม่รู้จักโปรไฟล์ธีม'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('ปลอดภัยจากอาการชัก'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('บกพร่องทางการมองเห็น'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('เป็นมิตรกับ ADHD'),
      );
      expect(loc.theme_profile('none'), equals('ค่าเริ่มต้น'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('โปรไฟล์ปลอดภัยจากอาการชัก'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ลบการสะท้อนและลดสี'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'โปรไฟล์นี้ช่วยให้ผู้ใช้ที่เป็นโรคลมชักและมีความเสี่ยงต่อ'
          'อาการชักสามารถท่องเว็บได้อย่างปลอดภัยโดยกำจัดความเสี่ยง'
          'ของอาการชักที่เกิดจากภาพเคลื่อนไหวแบบกะพริบและการผสมสีที่มีความเสี่ยง',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('โปรไฟล์สำหรับผู้บกพร่องทางการมองเห็น'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ปรับปรุงการมองเห็นของแอปพลิเคชัน'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'โปรไฟล์นี้ปรับแอปพลิเคชันให้สามารถเข้าถึงได้สำหรับผู้ที่มี'
          'ความบกพร่องทางการมองเห็นส่วนใหญ่ เช่น สายตาบกพร่อง '
          'การมองเห็นแบบอุโมงค์ ต้อกระจก ต้อหิน และอื่นๆ',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('โปรไฟล์เป็นมิตรกับ ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('มีสมาธิมากขึ้นและมีสิ่งรบกวนน้อยลง'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'โปรไฟล์นี้ช่วยลดสิ่งรบกวนอย่างมีนัยสำคัญ เพื่อช่วยให้ผู้ที่มี'
          'ภาวะ ADHD และความผิดปกติทางพัฒนาการระบบประสาทสามารถท่องเว็บ '
          'อ่าน และมุ่งเน้นไปที่องค์ประกอบที่สำคัญของแอปพลิเคชันได้ง่ายขึ้น',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('การตั้งค่าได้ถูกรีเซ็ตแล้ว'),
      );
      expect(loc.toggle_dark_mode, equals('สลับโหมดมืด'));
      expect(loc.toggle_effects_mode, equals('สลับโหมดเอฟเฟกต์'));
      expect(loc.toggle_font_weight, equals('สลับความหนาของตัวอักษร'));
      expect(loc.toggle_theme_profile, equals('สลับโปรไฟล์ธีม'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('ปกติ'));
      expect(loc.color_profile('lowSaturation'), equals('ความอิ่มตัวต่ำ'));
      expect(loc.color_profile('normal'), equals('ปกติ'));
      expect(
        loc.color_profile('highSaturation'),
        equals('ความอิ่มตัวสูง'),
      );
      expect(loc.color_profile('monochrome'), equals('ขาวดำ'));
      expect(loc.color_profile('highContrast'), equals('ความต่างสูง'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('ไม่รู้จักสี'));
      expect(loc.color('cF44336'), equals('สีแดง'));
      expect(loc.color('cE91E63'), equals('สีชมพู'));
      expect(loc.color('c9C27B0'), equals('สีม่วง'));
      expect(loc.color('c673AB7'), equals('สีม่วงเข้ม'));
      expect(loc.color('c3F51B5'), equals('สีคราม'));
      expect(loc.color('c2196F3'), equals('สีน้ำเงิน'));
      expect(loc.color('c03A9F4'), equals('สีฟ้าอ่อน'));
      expect(loc.color('c00BCD4'), equals('สีฟ้าอมเขียว'));
      expect(loc.color('c009688'), equals('สีน้ำเงินเขียว'));
      expect(loc.color('c4CAF50'), equals('สีเขียว'));
      expect(loc.color('c8BC34A'), equals('สีเขียวอ่อน'));
      expect(loc.color('cCDDC39'), equals('สีเขียวมะนาว'));
      expect(loc.color('cFFEB3B'), equals('สีเหลือง'));
      expect(loc.color('cFFC107'), equals('สีเหลืองอำพัน'));
      expect(loc.color('cFF9800'), equals('สีส้ม'));
      expect(loc.color('cFF5722'), equals('สีส้มเข้ม'));
      expect(loc.color('c795548'), equals('สีน้ำตาล'));
      expect(loc.color('c9E9E9E'), equals('สีเทา'));
      expect(loc.color('c607D8B'), equals('สีน้ำเงินเทา'));
    });
  });
}
