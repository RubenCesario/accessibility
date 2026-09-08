// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AccessibilityLocalizationsTh extends AccessibilityLocalizations {
  AccessibilityLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get accessibility => 'การเข้าถึง';

  @override
  String get accessibilitySettings => 'การตั้งค่าการเข้าถึง';

  @override
  String get adjustBackgroundColors => 'ปรับสีพื้นหลัง';

  @override
  String get adjustTextColors => 'ปรับสีข้อความ';

  @override
  String get alignCenter => 'จัดกึ่งกลาง';

  @override
  String get alignLeft => 'จัดชิดซ้าย';

  @override
  String get alignRight => 'จัดชิดขวา';

  @override
  String get textAlignment => 'การจัดแนวข้อความ';

  @override
  String get boldText => 'ข้อความตัวหนา';

  @override
  String get changeBoldText => 'เปลี่ยนข้อความตัวหนา';

  @override
  String get changePagesBackgroundColor => 'เปลี่ยนสีพื้นหลังของหน้าเป็น: ';

  @override
  String get changeTextColor => 'เปลี่ยนสีของข้อความเป็น: ';

  @override
  String get changeTextColorShade => 'เปลี่ยนเฉดสีเป็น: ';

  @override
  String get colorAdjustment => 'การปรับสี';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ปกติ',
      'lowSaturation': 'ความอิ่มตัวต่ำ',
      'normal': 'ปกติ',
      'highSaturation': 'ความอิ่มตัวสูง',
      'monochrome': 'ขาวดำ',
      'highContrast': 'ความต่างสูง',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'โปรไฟล์สีปัจจุบันคือ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'ลดระยะห่างระหว่างคำ';

  @override
  String get decrementLetterSpacing => 'ลดระยะห่างระหว่างตัวอักษร';

  @override
  String get decrementLineHeight => 'ลดความสูงของบรรทัด';

  @override
  String get decrementTextScaleFactor => 'ลดปัจจัยการขยายข้อความ';

  @override
  String get effects => 'เอฟเฟกต์';

  @override
  String get expandText => 'ขยายข้อความ';

  @override
  String get fontSize => 'ขนาดตัวอักษร';

  @override
  String get increaseOrDecreaseWordSpacing => 'เพิ่มหรือลดระยะห่างระหว่างคำ';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'เพิ่มหรือลดระยะห่างระหว่างตัวอักษร';

  @override
  String get increaseOrDecreaseLineHeight => 'เพิ่มหรือลดความสูงของบรรทัด';

  @override
  String get increaseOrDecreaseTextSize => 'เพิ่มหรือลดขนาดข้อความ';

  @override
  String get incrementWordSpacing => 'เพิ่มระยะห่างระหว่างคำ';

  @override
  String get incrementLetterSpacing => 'เพิ่มระยะห่างระหว่างตัวอักษร';

  @override
  String get incrementLineHeight => 'เพิ่มความสูงของบรรทัด';

  @override
  String get incrementTextScaleFactor => 'เพิ่มปัจจัยการขยายข้อความ';

  @override
  String get lessInfo => 'ซ่อนข้อมูล';

  @override
  String get letterSpacing => 'ระยะห่างระหว่างตัวอักษร';

  @override
  String get lineHeight => 'ความสูงของบรรทัด';

  @override
  String get moreInfo => 'แสดงข้อมูล';

  @override
  String get readLess => 'อ่านน้อยลง';

  @override
  String get readMore => 'อ่านเพิ่มเติม';

  @override
  String get reduceEffects => 'ลดเอฟเฟกต์บนหน้าจอ';

  @override
  String get reduceText => 'ลดขนาดข้อความ';

  @override
  String get restoreSettings => 'คืนค่าการตั้งค่า';

  @override
  String get restoreMainColor => 'คืนค่าสีหลัก';

  @override
  String get returnToMainColors => 'กลับไปยังสีหลัก';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get sizeAndTextDisplay => 'ขนาดและการแสดงข้อความ';

  @override
  String get sliderWordSpacing => 'ตัวเลื่อนระยะห่างระหว่างคำ';

  @override
  String get sliderLetterSpacing => 'ตัวเลื่อนระยะห่างระหว่างตัวอักษร';

  @override
  String get sliderLineHeight => 'ตัวเลื่อนความสูงของบรรทัด';

  @override
  String get themeMode => 'ธีม';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ไม่รู้จักโปรไฟล์ธีม',
      'seizureSafe': 'ปลอดภัยจากอาการชัก',
      'visionImpaired': 'บกพร่องทางการมองเห็น',
      'adhdFriendly': 'เป็นมิตรกับ ADHD',
      'none': 'โปรไฟล์เริ่มต้น',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'โปรไฟล์ปลอดภัยจากอาการชัก';

  @override
  String get themeProfileSeizureSafeSubtitle => 'ลบการสะท้อนและลดสี';

  @override
  String get themeProfileSeizureSafeDescription =>
      'โปรไฟล์นี้ช่วยให้ผู้ใช้ที่เป็นโรคลมชักและมีความเสี่ยงต่ออาการชักสามารถท่องเว็บได้อย่างปลอดภัยโดยกำจัดความเสี่ยงของอาการชักที่เกิดจากภาพเคลื่อนไหวแบบกะพริบและการผสมสีที่มีความเสี่ยง';

  @override
  String get themeProfileVisionImpairedTitle =>
      'โปรไฟล์สำหรับผู้บกพร่องทางการมองเห็น';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ปรับปรุงการมองเห็นของแอปพลิเคชัน';

  @override
  String get themeProfileVisionImpairedDescription =>
      'โปรไฟล์นี้ปรับแอปพลิเคชันให้สามารถเข้าถึงได้สำหรับผู้ที่มีความบกพร่องทางการมองเห็นส่วนใหญ่ เช่น สายตาบกพร่อง การมองเห็นแบบอุโมงค์ ต้อกระจก ต้อหิน และอื่นๆ';

  @override
  String get themeProfileAdhdFriendlyTitle => 'โปรไฟล์เป็นมิตรกับ ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'มีสมาธิมากขึ้นและมีสิ่งรบกวนน้อยลง';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'โปรไฟล์นี้ช่วยลดสิ่งรบกวนอย่างมีนัยสำคัญ เพื่อช่วยให้ผู้ที่มีภาวะ ADHD และความผิดปกติทางพัฒนาการระบบประสาทสามารถท่องเว็บ อ่าน และมุ่งเน้นไปที่องค์ประกอบที่สำคัญของแอปพลิเคชันได้ง่ายขึ้น';

  @override
  String get theSettingsHaveBeenReset => 'การตั้งค่าได้ถูกรีเซ็ตแล้ว';

  @override
  String get toggleDarkMode => 'สลับโหมดมืด';

  @override
  String get toggleEffectsMode => 'สลับโหมดเอฟเฟกต์';

  @override
  String get toggleFontWeight => 'สลับความหนาของตัวอักษร';

  @override
  String get toggleThemeProfile => 'สลับโปรไฟล์ธีม';

  @override
  String get wordSpacing => 'ระยะห่างระหว่างคำ';

  @override
  String get accessibleFont => 'แบบอักษรที่เข้าถึงได้';

  @override
  String get accessibleFontSubtitle =>
      'ใช้แบบอักษรที่อ่านง่ายเพื่อความสามารถในการอ่านที่ดีขึ้น';

  @override
  String get accessibleFontEnabled => 'เปิดใช้งานแบบอักษรที่เข้าถึงได้';

  @override
  String get accessibleFontDisabled => 'ปิดใช้งานแบบอักษรที่เข้าถึงได้';

  @override
  String get toggleAccessibleFont => 'สลับแบบอักษรที่เข้าถึงได้';

  @override
  String get settingsLoading => 'กำลังโหลดการตั้งค่าการเข้าถึง…';

  @override
  String get settingsLoadFailed => 'ไม่สามารถโหลดการตั้งค่าการเข้าถึงได้';

  @override
  String get retry => 'ลองอีกครั้ง';
}
