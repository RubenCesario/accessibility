// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AccessibilityLocalizationsVi extends AccessibilityLocalizations {
  AccessibilityLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get accessibility => 'Khả năng tiếp cận';

  @override
  String get accessibilitySettings => 'Cài đặt khả năng tiếp cận';

  @override
  String get adjustBackgroundColors => 'Điều chỉnh màu nền';

  @override
  String get adjustTextColors => 'Điều chỉnh màu văn bản';

  @override
  String get alignCenter => 'Căn giữa';

  @override
  String get alignLeft => 'Căn trái';

  @override
  String get alignRight => 'Căn phải';

  @override
  String get textAlignment => 'Căn chỉnh văn bản';

  @override
  String get boldText => 'Chữ đậm';

  @override
  String get changeBoldText => 'Thay đổi chữ đậm';

  @override
  String get changePagesBackgroundColor => 'Thay đổi màu nền của trang thành: ';

  @override
  String get changeTextColor => 'Thay đổi màu của văn bản thành: ';

  @override
  String get changeTextColorShade => 'Thay đổi sắc độ của màu thành: ';

  @override
  String get colorAdjustment => 'Điều chỉnh màu sắc';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Bình thường',
      'lowSaturation': 'Độ bão hòa thấp',
      'normal': 'Bình thường',
      'highSaturation': 'Độ bão hòa cao',
      'monochrome': 'Đơn sắc',
      'highContrast': 'Độ tương phản cao',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Hồ sơ màu hiện tại là: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Màu không được nhận diện',
      'cF44336': 'Đỏ',
      'cE91E63': 'Hồng',
      'c9C27B0': 'Tím',
      'c673AB7': 'Tím đậm',
      'c3F51B5': 'Chàm',
      'c2196F3': 'Xanh dương',
      'c03A9F4': 'Xanh dương nhạt',
      'c00BCD4': 'Xanh lơ',
      'c009688': 'Xanh ngọc',
      'c4CAF50': 'Xanh lá',
      'c8BC34A': 'Xanh lá nhạt',
      'cCDDC39': 'Vàng chanh',
      'cFFEB3B': 'Vàng',
      'cFFC107': 'Hổ phách',
      'cFF9800': 'Cam',
      'cFF5722': 'Cam đậm',
      'c795548': 'Nâu',
      'c9E9E9E': 'Xám',
      'c607D8B': 'Xám xanh',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Giảm khoảng cách từ';

  @override
  String get decrementLetterSpacing => 'Giảm khoảng cách chữ';

  @override
  String get decrementLineHeight => 'Giảm chiều cao dòng';

  @override
  String get decrementTextScaleFactor => 'Giảm hệ số tỷ lệ văn bản';

  @override
  String get effects => 'Hiệu ứng';

  @override
  String get expandText => 'Mở rộng văn bản';

  @override
  String get fontSize => 'Cỡ chữ';

  @override
  String get increaseOrDecreaseWordSpacing => 'Tăng hoặc giảm khoảng cách từ';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Tăng hoặc giảm khoảng cách chữ';

  @override
  String get increaseOrDecreaseLineHeight => 'Tăng hoặc giảm chiều cao dòng';

  @override
  String get increaseOrDecreaseTextSize => 'Tăng hoặc giảm cỡ chữ';

  @override
  String get incrementWordSpacing => 'Tăng khoảng cách từ';

  @override
  String get incrementLetterSpacing => 'Tăng khoảng cách chữ';

  @override
  String get incrementLineHeight => 'Tăng chiều cao dòng';

  @override
  String get incrementTextScaleFactor => 'Tăng hệ số tỷ lệ văn bản';

  @override
  String get lessInfo => 'Ẩn thông tin';

  @override
  String get letterSpacing => 'Khoảng cách chữ';

  @override
  String get lineHeight => 'Chiều cao dòng';

  @override
  String get moreInfo => 'Hiển thị thông tin';

  @override
  String get readLess => 'Đọc ít hơn';

  @override
  String get readMore => 'Đọc thêm';

  @override
  String get reduceEffects => 'Giảm hiệu ứng màn hình';

  @override
  String get reduceText => 'Thu gọn văn bản';

  @override
  String get restoreSettings => 'Khôi phục cài đặt';

  @override
  String get restoreMainColor => 'Khôi phục màu chính';

  @override
  String get returnToMainColors => 'Trở về màu chính';

  @override
  String get settings => 'Cài đặt';

  @override
  String get sizeAndTextDisplay => 'Kích thước và hiển thị văn bản';

  @override
  String get sliderWordSpacing => 'Thanh trượt khoảng cách từ';

  @override
  String get sliderLetterSpacing => 'Thanh trượt khoảng cách chữ';

  @override
  String get sliderLineHeight => 'Thanh trượt chiều cao dòng';

  @override
  String get themeMode => 'Chủ đề';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Không nhận diện được hồ sơ chủ đề',
      'seizureSafe': 'An toàn cho người động kinh',
      'visionImpaired': 'Hỗ trợ thị lực kém',
      'adhdFriendly': 'Thân thiện với ADHD',
      'none': 'Hồ sơ mặc định',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'Hồ sơ an toàn cho người động kinh';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Loại bỏ phản chiếu và giảm màu sắc';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Hồ sơ này giúp người dùng bị động kinh và có nguy cơ co giật duyệt web an toàn bằng cách loại bỏ nguy cơ co giật do hoạt ảnh nhấp nháy và sự kết hợp màu sắc nguy hiểm.';

  @override
  String get themeProfileVisionImpairedTitle => 'Hồ sơ hỗ trợ thị lực kém';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Cải thiện khả năng hiển thị của ứng dụng';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Hồ sơ này điều chỉnh ứng dụng để dễ tiếp cận với hầu hết các khiếm khuyết về thị giác, như thị lực kém, thị trường hẹp, đục thủy tinh thể, tăng nhãn áp và nhiều vấn đề khác.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Hồ sơ thân thiện với ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Tăng tập trung và giảm phân tâm';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Hồ sơ này giảm đáng kể sự phân tâm, giúp người mắc ADHD và rối loạn phát triển thần kinh dễ dàng điều hướng, đọc và tập trung vào các yếu tố thiết yếu của ứng dụng.';

  @override
  String get theSettingsHaveBeenReset => 'Cài đặt đã được đặt lại.';

  @override
  String get toggleDarkMode => 'Bật/tắt chế độ tối';

  @override
  String get toggleEffectsMode => 'Bật/tắt chế độ hiệu ứng';

  @override
  String get toggleFontWeight => 'Bật/tắt độ đậm chữ';

  @override
  String get toggleThemeProfile => 'Bật/tắt hồ sơ chủ đề';

  @override
  String get wordSpacing => 'Khoảng cách từ';

  @override
  String get accessibleFont => 'Phông chữ dễ đọc';

  @override
  String get accessibleFontSubtitle =>
      'Sử dụng phông chữ dễ tiếp cận để dễ đọc hơn';

  @override
  String get accessibleFontEnabled => 'Đã bật phông chữ dễ đọc';

  @override
  String get accessibleFontDisabled => 'Đã tắt phông chữ dễ đọc';

  @override
  String get toggleAccessibleFont => 'Bật/tắt phông chữ dễ đọc';

  @override
  String get settingsLoading => 'Đang tải cài đặt khả năng tiếp cận…';

  @override
  String get settingsLoadFailed => 'Không thể tải cài đặt khả năng tiếp cận.';

  @override
  String get retry => 'Thử lại';

  @override
  String get themeModeSystem => 'Hệ thống';

  @override
  String get themeModeLight => 'Sáng';

  @override
  String get themeModeDark => 'Tối';

  @override
  String get effectsModeSystem => 'Hệ thống';

  @override
  String get effectsModeEnabled => 'Bật';

  @override
  String get effectsModeDisabled => 'Tắt';
}
