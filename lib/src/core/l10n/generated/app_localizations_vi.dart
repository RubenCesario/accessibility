// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AccessibilityLocalizationsVi extends AccessibilityLocalizations {
  AccessibilityLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get accessibility => 'Khả năng tiếp cận';

  @override
  String get accessibility_settings => 'Cài đặt khả năng tiếp cận';

  @override
  String get adjust_background_colors => 'Điều chỉnh màu nền';

  @override
  String get adjust_text_colors => 'Điều chỉnh màu văn bản';

  @override
  String get align_center => 'Căn giữa';

  @override
  String get align_left => 'Căn trái';

  @override
  String get align_right => 'Căn phải';

  @override
  String get bold_text => 'Chữ đậm';

  @override
  String get change_bold_text => 'Thay đổi chữ đậm';

  @override
  String get change_pages_background_color =>
      'Thay đổi màu nền của trang thành: ';

  @override
  String get change_text_color => 'Thay đổi màu của văn bản thành: ';

  @override
  String get change_text_color_shade => 'Thay đổi sắc độ của màu thành: ';

  @override
  String get color_adjustment => 'Điều chỉnh màu sắc';

  @override
  String color_profile(String profile) {
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
  String get color_profile_changed_to => 'Hồ sơ màu hiện tại là: ';

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
  String get decrement_word_spacing => 'Giảm khoảng cách từ';

  @override
  String get decrement_letter_spacing => 'Giảm khoảng cách chữ';

  @override
  String get decrement_line_height => 'Giảm chiều cao dòng';

  @override
  String get decrement_text_scale_factor => 'Giảm hệ số tỷ lệ văn bản';

  @override
  String get effects => 'Hiệu ứng';

  @override
  String get expand_text => 'Mở rộng văn bản';

  @override
  String get font_size => 'Cỡ chữ';

  @override
  String get increase_or_decrease_word_spacing =>
      'Tăng hoặc giảm khoảng cách từ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Tăng hoặc giảm khoảng cách chữ';

  @override
  String get increase_or_decrease_line_height =>
      'Tăng hoặc giảm chiều cao dòng';

  @override
  String get increase_or_decrease_text_size => 'Tăng hoặc giảm cỡ chữ';

  @override
  String get increment_word_spacing => 'Tăng khoảng cách từ';

  @override
  String get increment_letter_spacing => 'Tăng khoảng cách chữ';

  @override
  String get increment_line_height => 'Tăng chiều cao dòng';

  @override
  String get increment_text_scale_factor => 'Tăng hệ số tỷ lệ văn bản';

  @override
  String get less_info => 'Ẩn thông tin';

  @override
  String get letter_spacing => 'Khoảng cách chữ';

  @override
  String get line_height => 'Chiều cao dòng';

  @override
  String get more_info => 'Hiển thị thông tin';

  @override
  String get read_less => 'Đọc ít hơn';

  @override
  String get read_more => 'Đọc thêm';

  @override
  String get reduce_effects => 'Giảm hiệu ứng màn hình';

  @override
  String get reduce_text => 'Thu gọn văn bản';

  @override
  String get restore_settings => 'Khôi phục cài đặt';

  @override
  String get restore_main_color => 'Khôi phục màu chính';

  @override
  String get return_to_main_colors => 'Trở về màu chính';

  @override
  String get settings => 'Cài đặt';

  @override
  String get size_and_text_display => 'Kích thước và hiển thị văn bản';

  @override
  String get slider_word_spacing => 'Thanh trượt khoảng cách từ';

  @override
  String get slider_letter_spacing => 'Thanh trượt khoảng cách chữ';

  @override
  String get slider_line_height => 'Thanh trượt chiều cao dòng';

  @override
  String get theme_mode => 'Chủ đề';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Không nhận diện được hồ sơ chủ đề',
      'seizureSafe': 'An toàn cho người động kinh',
      'visionImpaired': 'Hỗ trợ thị lực kém',
      'adhdFriendly': 'Thân thiện với ADHD',
      'none': 'Mặc định',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Hồ sơ an toàn cho người động kinh';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Loại bỏ phản chiếu và giảm màu sắc';

  @override
  String get theme_profile_seizure_safe_description =>
      'Hồ sơ này giúp người dùng bị động kinh và có nguy cơ co giật duyệt web an toàn bằng cách loại bỏ nguy cơ co giật do hoạt ảnh nhấp nháy và sự kết hợp màu sắc nguy hiểm.';

  @override
  String get theme_profile_vision_impaired_title => 'Hồ sơ hỗ trợ thị lực kém';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Cải thiện khả năng hiển thị của ứng dụng';

  @override
  String get theme_profile_vision_impaired_description =>
      'Hồ sơ này điều chỉnh ứng dụng để dễ tiếp cận với hầu hết các khiếm khuyết về thị giác, như thị lực kém, thị trường hẹp, đục thủy tinh thể, tăng nhãn áp và nhiều vấn đề khác.';

  @override
  String get theme_profile_adhd_friendly_title => 'Hồ sơ thân thiện với ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Tăng tập trung và giảm phân tâm';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Hồ sơ này giảm đáng kể sự phân tâm, giúp người mắc ADHD và rối loạn phát triển thần kinh dễ dàng điều hướng, đọc và tập trung vào các yếu tố thiết yếu của ứng dụng.';

  @override
  String get the_settings_have_been_reset => 'Cài đặt đã được đặt lại.';

  @override
  String get toggle_dark_mode => 'Bật/tắt chế độ tối';

  @override
  String get toggle_effects_mode => 'Bật/tắt chế độ hiệu ứng';

  @override
  String get toggle_font_weight => 'Bật/tắt độ đậm chữ';

  @override
  String get toggle_theme_profile => 'Bật/tắt hồ sơ chủ đề';

  @override
  String get word_spacing => 'Khoảng cách từ';
}
