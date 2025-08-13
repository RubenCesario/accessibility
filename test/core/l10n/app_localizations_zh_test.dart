import 'package:accessibility/src/core/l10n/generated/app_localizations_zh.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsZh', () {
    late AccessibilityLocalizationsZh loc;

    setUp(() {
      loc = AccessibilityLocalizationsZh();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('zh'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('无障碍功能'));
      expect(
        loc.accessibility_settings,
        equals('无障碍设置'),
      );
      expect(
        loc.adjust_background_colors,
        equals('调整背景颜色'),
      );
      expect(loc.adjust_text_colors, equals('调整文本颜色'));
      expect(loc.align_center, equals('居中对齐'));
      expect(loc.align_left, equals('左对齐'));
      expect(loc.align_right, equals('右对齐'));
      expect(loc.bold_text, equals('粗体文本'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('更改粗体文本'));
      expect(
        loc.change_pages_background_color,
        equals('将页面背景颜色更改为: '),
      );
      expect(
        loc.change_text_color,
        equals('将文本颜色更改为: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('将颜色的色调更改为: '),
      );
      expect(loc.color_adjustment, equals('颜色调整'));
      expect(
        loc.color_profile_changed_to,
        equals('当前颜色配置文件是: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('减少单词间距'));
      expect(loc.decrement_letter_spacing, equals('减少字母间距'));
      expect(loc.decrement_line_height, equals('减少行高'));
      expect(
        loc.decrement_text_scale_factor,
        equals('减少文本缩放因子'),
      );
      expect(loc.increment_word_spacing, equals('增加单词间距'));
      expect(loc.increment_letter_spacing, equals('增加字母间距'));
      expect(loc.increment_line_height, equals('增加行高'));
      expect(
        loc.increment_text_scale_factor,
        equals('增加文本缩放因子'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('增加或减少单词间距'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('增加或减少字母间距'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('增加或减少行高'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('增加或减少文本大小'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('效果'));
      expect(loc.expand_text, equals('展开文本'));
      expect(loc.font_size, equals('字体大小'));
      expect(loc.less_info, equals('隐藏信息'));
      expect(loc.letter_spacing, equals('字母间距'));
      expect(loc.line_height, equals('行高'));
      expect(loc.more_info, equals('显示信息'));
      expect(loc.word_spacing, equals('单词间距'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('收起阅读'));
      expect(loc.read_more, equals('阅读更多'));
      expect(loc.reduce_effects, equals('减少屏幕效果'));
      expect(loc.reduce_text, equals('缩小文本'));
      expect(loc.restore_settings, equals('恢复设置'));
      expect(loc.restore_main_color, equals('恢复主色'));
      expect(
        loc.return_to_main_colors,
        equals('返回主色'),
      );
      expect(loc.settings, equals('设置'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('大小和文本显示'),
      );
      expect(
        loc.slider_word_spacing,
        equals('单词间距滑块'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('字母间距滑块'),
      );
      expect(loc.slider_line_height, equals('行高滑块'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('主题'));
      expect(
        loc.theme_profile('other'),
        equals('无法识别的主题配置'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('癢疾安全'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('视力障碍'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD友好'),
      );
      expect(loc.theme_profile('none'), equals('默认'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('癢疾安全配置'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('移除反光并减少颜色'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals('此配置文件通过消除闪烁动画和危险的颜色组合导致的癢疾发作风险，'
            '使患有癢疾和有癢疾发作风险的用户能够安全浏览。'),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('视力障碍配置'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('提高应用程序的可见度'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals('此配置文件使应用程序适应于大多数视觉障碍，如视力障碍、管状视野、'
            '白内障、青光眼等。'),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD友好配置'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('更多的注意力和更少的分心'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals('此配置文件显著减少分心，帮助患有ADHD和神经发育障碍的人更容易地'
            '浏览、阅读和专注于应用程序的基本要素。'),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('设置已重置。'),
      );
      expect(loc.toggle_dark_mode, equals('切换暗黑模式'));
      expect(loc.toggle_effects_mode, equals('切换效果模式'));
      expect(loc.toggle_font_weight, equals('切换字体粗细'));
      expect(loc.toggle_theme_profile, equals('切换主题配置'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('正常'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('低饱和度'),
      );
      expect(loc.color_profile('normal'), equals('正常'));
      expect(
        loc.color_profile('highSaturation'),
        equals('高饱和度'),
      );
      expect(loc.color_profile('monochrome'), equals('单色'));
      expect(loc.color_profile('highContrast'), equals('高对比度'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('无法识别的颜色'));
      expect(loc.color('cF44336'), equals('红色'));
      expect(loc.color('cE91E63'), equals('粉色'));
      expect(loc.color('c9C27B0'), equals('紫色'));
      expect(loc.color('c673AB7'), equals('深紫色'));
      expect(loc.color('c3F51B5'), equals('青紫色'));
      expect(loc.color('c2196F3'), equals('蓝色'));
      expect(loc.color('c03A9F4'), equals('浅蓝色'));
      expect(loc.color('c00BCD4'), equals('青色'));
      expect(loc.color('c009688'), equals('青绿色'));
      expect(loc.color('c4CAF50'), equals('绿色'));
      expect(loc.color('c8BC34A'), equals('浅绿色'));
      expect(loc.color('cCDDC39'), equals('青柿色'));
      expect(loc.color('cFFEB3B'), equals('黄色'));
      expect(loc.color('cFFC107'), equals('琥珀色'));
      expect(loc.color('cFF9800'), equals('橙色'));
      expect(loc.color('cFF5722'), equals('深橙色'));
      expect(loc.color('c795548'), equals('棕色'));
      expect(loc.color('c9E9E9E'), equals('灰色'));
      expect(loc.color('c607D8B'), equals('蓝灰色'));
    });
  });
}
