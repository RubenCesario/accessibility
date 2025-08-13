import 'package:accessibility/src/core/l10n/generated/app_localizations_vi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsVi', () {
    late AccessibilityLocalizationsVi loc;

    setUp(() {
      loc = AccessibilityLocalizationsVi();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('vi'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Khả năng tiếp cận'));
      expect(
        loc.accessibility_settings,
        equals('Cài đặt khả năng tiếp cận'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Điều chỉnh màu nền'),
      );
      expect(loc.adjust_text_colors, equals('Điều chỉnh màu văn bản'));
      expect(loc.align_center, equals('Căn giữa'));
      expect(loc.align_left, equals('Căn trái'));
      expect(loc.align_right, equals('Căn phải'));
      expect(loc.bold_text, equals('Chữ đậm'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Thay đổi chữ đậm'));
      expect(
        loc.change_pages_background_color,
        equals('Thay đổi màu nền của trang thành: '),
      );
      expect(
        loc.change_text_color,
        equals('Thay đổi màu của văn bản thành: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Thay đổi sắc độ của màu thành: '),
      );
      expect(loc.color_adjustment, equals('Điều chỉnh màu sắc'));
      expect(
        loc.color_profile_changed_to,
        equals('Hồ sơ màu hiện tại là: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Giảm khoảng cách từ'));
      expect(loc.decrement_letter_spacing, equals('Giảm khoảng cách chữ'));
      expect(loc.decrement_line_height, equals('Giảm chiều cao dòng'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Giảm hệ số tỷ lệ văn bản'),
      );
      expect(loc.increment_word_spacing, equals('Tăng khoảng cách từ'));
      expect(loc.increment_letter_spacing, equals('Tăng khoảng cách chữ'));
      expect(loc.increment_line_height, equals('Tăng chiều cao dòng'));
      expect(
        loc.increment_text_scale_factor,
        equals('Tăng hệ số tỷ lệ văn bản'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Tăng hoặc giảm khoảng cách từ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Tăng hoặc giảm khoảng cách chữ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Tăng hoặc giảm chiều cao dòng'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Tăng hoặc giảm cỡ chữ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Hiệu ứng'));
      expect(loc.expand_text, equals('Mở rộng văn bản'));
      expect(loc.font_size, equals('Cỡ chữ'));
      expect(loc.less_info, equals('Ẩn thông tin'));
      expect(loc.letter_spacing, equals('Khoảng cách chữ'));
      expect(loc.line_height, equals('Chiều cao dòng'));
      expect(loc.more_info, equals('Hiển thị thông tin'));
      expect(loc.word_spacing, equals('Khoảng cách từ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Đọc ít hơn'));
      expect(loc.read_more, equals('Đọc thêm'));
      expect(loc.reduce_effects, equals('Giảm hiệu ứng màn hình'));
      expect(loc.reduce_text, equals('Thu gọn văn bản'));
      expect(loc.restore_settings, equals('Khôi phục cài đặt'));
      expect(loc.restore_main_color, equals('Khôi phục màu chính'));
      expect(
        loc.return_to_main_colors,
        equals('Trở về màu chính'),
      );
      expect(loc.settings, equals('Cài đặt'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Kích thước và hiển thị văn bản'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Thanh trượt khoảng cách từ'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Thanh trượt khoảng cách chữ'),
      );
      expect(
        loc.slider_line_height,
        equals('Thanh trượt chiều cao dòng'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Chủ đề'));
      expect(
        loc.theme_profile('other'),
        equals('Không nhận diện được hồ sơ chủ đề'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('An toàn cho người động kinh'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Hỗ trợ thị lực kém'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Thân thiện với ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Mặc định'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Hồ sơ an toàn cho người động kinh'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Loại bỏ phản chiếu và giảm màu sắc'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals('Hồ sơ này giúp người dùng bị động kinh và có nguy cơ '
            'co giật duyệt web an toàn bằng cách loại bỏ nguy cơ '
            'co giật do hoạt ảnh nhấp nháy và sự kết hợp màu sắc '
            'nguy hiểm.'),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Hồ sơ hỗ trợ thị lực kém'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Cải thiện khả năng hiển thị của ứng dụng'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals('Hồ sơ này điều chỉnh ứng dụng để dễ tiếp cận với hầu '
            'hết các khiếm khuyết về thị giác, như thị lực kém, '
            'thị trường hẹp, đục thủy tinh thể, tăng nhãn áp và '
            'nhiều vấn đề khác.'),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Hồ sơ thân thiện với ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Tăng tập trung và giảm phân tâm'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals('Hồ sơ này giảm đáng kể sự phân tâm, giúp người mắc '
            'ADHD và rối loạn phát triển thần kinh dễ dàng điều '
            'hướng, đọc và tập trung vào các yếu tố thiết yếu '
            'của ứng dụng.'),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Cài đặt đã được đặt lại.'),
      );
      expect(loc.toggle_dark_mode, equals('Bật/tắt chế độ tối'));
      expect(loc.toggle_effects_mode, equals('Bật/tắt chế độ hiệu ứng'));
      expect(loc.toggle_font_weight, equals('Bật/tắt độ đậm chữ'));
      expect(loc.toggle_theme_profile, equals('Bật/tắt hồ sơ chủ đề'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Bình thường'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Độ bão hòa thấp'),
      );
      expect(loc.color_profile('normal'), equals('Bình thường'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Độ bão hòa cao'),
      );
      expect(loc.color_profile('monochrome'), equals('Đơn sắc'));
      expect(loc.color_profile('highContrast'), equals('Độ tương phản cao'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Màu không được nhận diện'));
      expect(loc.color('cF44336'), equals('Đỏ'));
      expect(loc.color('cE91E63'), equals('Hồng'));
      expect(loc.color('c9C27B0'), equals('Tím'));
      expect(loc.color('c673AB7'), equals('Tím đậm'));
      expect(loc.color('c3F51B5'), equals('Chàm'));
      expect(loc.color('c2196F3'), equals('Xanh dương'));
      expect(loc.color('c03A9F4'), equals('Xanh dương nhạt'));
      expect(loc.color('c00BCD4'), equals('Xanh lơ'));
      expect(loc.color('c009688'), equals('Xanh ngọc'));
      expect(loc.color('c4CAF50'), equals('Xanh lá'));
      expect(loc.color('c8BC34A'), equals('Xanh lá nhạt'));
      expect(loc.color('cCDDC39'), equals('Vàng chanh'));
      expect(loc.color('cFFEB3B'), equals('Vàng'));
      expect(loc.color('cFFC107'), equals('Hổ phách'));
      expect(loc.color('cFF9800'), equals('Cam'));
      expect(loc.color('cFF5722'), equals('Cam đậm'));
      expect(loc.color('c795548'), equals('Nâu'));
      expect(loc.color('c9E9E9E'), equals('Xám'));
      expect(loc.color('c607D8B'), equals('Xám xanh'));
    });
  });
}
