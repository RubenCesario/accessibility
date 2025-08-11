// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AccessibilityLocalizationsZh extends AccessibilityLocalizations {
  AccessibilityLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get accessibility => '无障碍功能';

  @override
  String get accessibility_settings => '无障碍设置';

  @override
  String get adjust_background_colors => '调整背景颜色';

  @override
  String get adjust_text_colors => '调整文本颜色';

  @override
  String get align_center => '居中对齐';

  @override
  String get align_left => '左对齐';

  @override
  String get align_right => '右对齐';

  @override
  String get bold_text => '粗体文本';

  @override
  String get change_bold_text => '更改粗体文本';

  @override
  String get change_pages_background_color => '将页面背景颜色更改为: ';

  @override
  String get change_text_color => '将文本颜色更改为: ';

  @override
  String get change_text_color_shade => '将颜色的色调更改为: ';

  @override
  String get color_adjustment => '颜色调整';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': '正常',
      'lowSaturation': '低饱和度',
      'normal': '正常',
      'highSaturation': '高饱和度',
      'monochrome': '单色',
      'highContrast': '高对比度',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => '当前颜色配置文件是: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': '无法识别的颜色',
      'cF44336': '红色',
      'cE91E63': '粉色',
      'c9C27B0': '紫色',
      'c673AB7': '深紫色',
      'c3F51B5': '青紫色',
      'c2196F3': '蓝色',
      'c03A9F4': '浅蓝色',
      'c00BCD4': '青色',
      'c009688': '青绿色',
      'c4CAF50': '绿色',
      'c8BC34A': '浅绿色',
      'cCDDC39': '青柿色',
      'cFFEB3B': '黄色',
      'cFFC107': '琥珀色',
      'cFF9800': '橙色',
      'cFF5722': '深橙色',
      'c795548': '棕色',
      'c9E9E9E': '灰色',
      'c607D8B': '蓝灰色',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => '减少单词间距';

  @override
  String get decrement_letter_spacing => '减少字母间距';

  @override
  String get decrement_line_height => '减少行高';

  @override
  String get decrement_text_scale_factor => '减少文本缩放因子';

  @override
  String get effects => '效果';

  @override
  String get expand_text => '展开文本';

  @override
  String get font_size => '字体大小';

  @override
  String get increase_or_decrease_word_spacing => '增加或减少单词间距';

  @override
  String get increase_or_decrease_letter_spacing => '增加或减少字母间距';

  @override
  String get increase_or_decrease_line_height => '增加或减少行高';

  @override
  String get increase_or_decrease_text_size => '增加或减少文本大小';

  @override
  String get increment_word_spacing => '增加单词间距';

  @override
  String get increment_letter_spacing => '增加字母间距';

  @override
  String get increment_line_height => '增加行高';

  @override
  String get increment_text_scale_factor => '增加文本缩放因子';

  @override
  String get less_info => '隐藏信息';

  @override
  String get letter_spacing => '字母间距';

  @override
  String get line_height => '行高';

  @override
  String get more_info => '显示信息';

  @override
  String get read_less => '收起阅读';

  @override
  String get read_more => '阅读更多';

  @override
  String get reduce_effects => '减少屏幕效果';

  @override
  String get reduce_text => '缩小文本';

  @override
  String get restore_settings => '恢复设置';

  @override
  String get restore_main_color => '恢复主色';

  @override
  String get return_to_main_colors => '返回主色';

  @override
  String get settings => '设置';

  @override
  String get size_and_text_display => '大小和文本显示';

  @override
  String get slider_word_spacing => '单词间距滑块';

  @override
  String get slider_letter_spacing => '字母间距滑块';

  @override
  String get slider_line_height => '行高滑块';

  @override
  String get theme_mode => '主题';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': '无法识别的主题配置',
      'seizureSafe': '癢疾安全',
      'visionImpaired': '视力障碍',
      'adhdFriendly': 'ADHD友好',
      'none': '默认',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => '癢疾安全配置';

  @override
  String get theme_profile_seizure_safe_subtitle => '移除反光并减少颜色';

  @override
  String get theme_profile_seizure_safe_description =>
      '此配置文件通过消除闪烁动画和危险的颜色组合导致的癢疾发作风险，使患有癢疾和有癢疾发作风险的用户能够安全浏览。';

  @override
  String get theme_profile_vision_impaired_title => '视力障碍配置';

  @override
  String get theme_profile_vision_impaired_subtitle => '提高应用程序的可见度';

  @override
  String get theme_profile_vision_impaired_description =>
      '此配置文件使应用程序适应于大多数视觉障碍，如视力障碍、管状视野、白内障、青光眼等。';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD友好配置';

  @override
  String get theme_profile_adhd_friendly_subtitle => '更多的注意力和更少的分心';

  @override
  String get theme_profile_adhd_friendly_description =>
      '此配置文件显著减少分心，帮助患有ADHD和神经发育障碍的人更容易地浏览、阅读和专注于应用程序的基本要素。';

  @override
  String get the_settings_have_been_reset => '设置已重置。';

  @override
  String get toggle_dark_mode => '切换暗黑模式';

  @override
  String get toggle_effects_mode => '切换效果模式';

  @override
  String get toggle_font_weight => '切换字体粗细';

  @override
  String get toggle_theme_profile => '切换主题配置';

  @override
  String get word_spacing => '单词间距';
}
