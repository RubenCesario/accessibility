// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AccessibilityLocalizationsTh extends AccessibilityLocalizations {
  AccessibilityLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get accessibility => 'การเข้าถึง';

  @override
  String get accessibility_settings => 'การตั้งค่าการเข้าถึง';

  @override
  String get adjust_background_colors => 'ปรับสีพื้นหลัง';

  @override
  String get adjust_text_colors => 'ปรับสีข้อความ';

  @override
  String get align_center => 'จัดกึ่งกลาง';

  @override
  String get align_left => 'จัดชิดซ้าย';

  @override
  String get align_right => 'จัดชิดขวา';

  @override
  String get bold_text => 'ข้อความตัวหนา';

  @override
  String get change_bold_text => 'เปลี่ยนข้อความตัวหนา';

  @override
  String get change_pages_background_color => 'เปลี่ยนสีพื้นหลังของหน้าเป็น: ';

  @override
  String get change_text_color => 'เปลี่ยนสีของข้อความเป็น: ';

  @override
  String get change_text_color_shade => 'เปลี่ยนเฉดสีเป็น: ';

  @override
  String get color_adjustment => 'การปรับสี';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'ปกติ',
        'lowSaturation': 'ความอิ่มตัวต่ำ',
        'normal': 'ปกติ',
        'highSaturation': 'ความอิ่มตัวสูง',
        'monochrome': 'ขาวดำ',
        'highContrast': 'ความต่างสูง',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'โปรไฟล์สีปัจจุบันคือ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'ไม่รู้จักสี',
        'cF44336': 'สีแดง',
        'cE91E63': 'สีชมพู',
        'c9C27B0': 'สีม่วง',
        'c673AB7': 'สีม่วงเข้ม',
        'c3F51B5': 'สีคราม',
        'c2196F3': 'สีน้ำเงิน',
        'c03A9F4': 'สีฟ้าอ่อน',
        'c00BCD4': 'สีฟ้าอมเขียว',
        'c009688': 'สีน้ำเงินเขียว',
        'c4CAF50': 'สีเขียว',
        'c8BC34A': 'สีเขียวอ่อน',
        'cCDDC39': 'สีเขียวมะนาว',
        'cFFEB3B': 'สีเหลือง',
        'cFFC107': 'สีเหลืองอำพัน',
        'cFF9800': 'สีส้ม',
        'cFF5722': 'สีส้มเข้ม',
        'c795548': 'สีน้ำตาล',
        'c9E9E9E': 'สีเทา',
        'c607D8B': 'สีน้ำเงินเทา',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'ลดระยะห่างระหว่างคำ';

  @override
  String get decrement_letter_spacing => 'ลดระยะห่างระหว่างตัวอักษร';

  @override
  String get decrement_line_height => 'ลดความสูงของบรรทัด';

  @override
  String get decrement_text_scale_factor => 'ลดปัจจัยการขยายข้อความ';

  @override
  String get effects => 'เอฟเฟกต์';

  @override
  String get expand_text => 'ขยายข้อความ';

  @override
  String get font_size => 'ขนาดตัวอักษร';

  @override
  String get increase_or_decrease_word_spacing =>
      'เพิ่มหรือลดระยะห่างระหว่างคำ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'เพิ่มหรือลดระยะห่างระหว่างตัวอักษร';

  @override
  String get increase_or_decrease_line_height => 'เพิ่มหรือลดความสูงของบรรทัด';

  @override
  String get increase_or_decrease_text_size => 'เพิ่มหรือลดขนาดข้อความ';

  @override
  String get increment_word_spacing => 'เพิ่มระยะห่างระหว่างคำ';

  @override
  String get increment_letter_spacing => 'เพิ่มระยะห่างระหว่างตัวอักษร';

  @override
  String get increment_line_height => 'เพิ่มความสูงของบรรทัด';

  @override
  String get increment_text_scale_factor => 'เพิ่มปัจจัยการขยายข้อความ';

  @override
  String get less_info => 'ซ่อนข้อมูล';

  @override
  String get letter_spacing => 'ระยะห่างระหว่างตัวอักษร';

  @override
  String get line_height => 'ความสูงของบรรทัด';

  @override
  String get more_info => 'แสดงข้อมูล';

  @override
  String get read_less => 'อ่านน้อยลง';

  @override
  String get read_more => 'อ่านเพิ่มเติม';

  @override
  String get reduce_effects => 'ลดเอฟเฟกต์บนหน้าจอ';

  @override
  String get reduce_text => 'ลดขนาดข้อความ';

  @override
  String get restore_settings => 'คืนค่าการตั้งค่า';

  @override
  String get restore_main_color => 'คืนค่าสีหลัก';

  @override
  String get return_to_main_colors => 'กลับไปยังสีหลัก';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get size_and_text_display => 'ขนาดและการแสดงข้อความ';

  @override
  String get slider_word_spacing => 'ตัวเลื่อนระยะห่างระหว่างคำ';

  @override
  String get slider_letter_spacing => 'ตัวเลื่อนระยะห่างระหว่างตัวอักษร';

  @override
  String get slider_line_height => 'ตัวเลื่อนความสูงของบรรทัด';

  @override
  String get theme_mode => 'ธีม';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'ไม่รู้จักโปรไฟล์ธีม',
        'seizureSafe': 'ปลอดภัยจากอาการชัก',
        'visionImpaired': 'บกพร่องทางการมองเห็น',
        'adhdFriendly': 'เป็นมิตรกับ ADHD',
        'none': 'ค่าเริ่มต้น',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'โปรไฟล์ปลอดภัยจากอาการชัก';

  @override
  String get theme_profile_seizure_safe_subtitle => 'ลบการสะท้อนและลดสี';

  @override
  String get theme_profile_seizure_safe_description =>
      'โปรไฟล์นี้ช่วยให้ผู้ใช้ที่เป็นโรคลมชักและมีความเสี่ยงต่ออาการชักสามารถท่องเว็บได้อย่างปลอดภัยโดยกำจัดความเสี่ยงของอาการชักที่เกิดจากภาพเคลื่อนไหวแบบกะพริบและการผสมสีที่มีความเสี่ยง';

  @override
  String get theme_profile_vision_impaired_title =>
      'โปรไฟล์สำหรับผู้บกพร่องทางการมองเห็น';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ปรับปรุงการมองเห็นของแอปพลิเคชัน';

  @override
  String get theme_profile_vision_impaired_description =>
      'โปรไฟล์นี้ปรับแอปพลิเคชันให้สามารถเข้าถึงได้สำหรับผู้ที่มีความบกพร่องทางการมองเห็นส่วนใหญ่ เช่น สายตาบกพร่อง การมองเห็นแบบอุโมงค์ ต้อกระจก ต้อหิน และอื่นๆ';

  @override
  String get theme_profile_adhd_friendly_title => 'โปรไฟล์เป็นมิตรกับ ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'มีสมาธิมากขึ้นและมีสิ่งรบกวนน้อยลง';

  @override
  String get theme_profile_adhd_friendly_description =>
      'โปรไฟล์นี้ช่วยลดสิ่งรบกวนอย่างมีนัยสำคัญ เพื่อช่วยให้ผู้ที่มีภาวะ ADHD และความผิดปกติทางพัฒนาการระบบประสาทสามารถท่องเว็บ อ่าน และมุ่งเน้นไปที่องค์ประกอบที่สำคัญของแอปพลิเคชันได้ง่ายขึ้น';

  @override
  String get the_settings_have_been_reset => 'การตั้งค่าได้ถูกรีเซ็ตแล้ว';

  @override
  String get toggle_dark_mode => 'สลับโหมดมืด';

  @override
  String get toggle_effects_mode => 'สลับโหมดเอฟเฟกต์';

  @override
  String get toggle_font_weight => 'สลับความหนาของตัวอักษร';

  @override
  String get toggle_theme_profile => 'สลับโปรไฟล์ธีม';

  @override
  String get word_spacing => 'ระยะห่างระหว่างคำ';
}
