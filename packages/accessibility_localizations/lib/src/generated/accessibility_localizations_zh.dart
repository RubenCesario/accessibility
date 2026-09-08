// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AccessibilityLocalizationsZh extends AccessibilityLocalizations {
  AccessibilityLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get accessibility => '无障碍功能';

  @override
  String get accessibilitySettings => '无障碍设置';

  @override
  String get adjustBackgroundColors => '调整背景颜色';

  @override
  String get adjustTextColors => '调整文本颜色';

  @override
  String get alignCenter => '居中对齐';

  @override
  String get alignLeft => '左对齐';

  @override
  String get alignRight => '右对齐';

  @override
  String get textAlignment => '文本对齐';

  @override
  String get boldText => '粗体文本';

  @override
  String get changeBoldText => '更改粗体文本';

  @override
  String get changePagesBackgroundColor => '将页面背景颜色更改为: ';

  @override
  String get changeTextColor => '将文本颜色更改为: ';

  @override
  String get changeTextColorShade => '将颜色的色调更改为: ';

  @override
  String get colorAdjustment => '颜色调整';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => '当前颜色配置文件是: ';

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
  String get decrementWordSpacing => '减少单词间距';

  @override
  String get decrementLetterSpacing => '减少字母间距';

  @override
  String get decrementLineHeight => '减少行高';

  @override
  String get decrementTextScaleFactor => '减少文本缩放因子';

  @override
  String get effects => '效果';

  @override
  String get expandText => '展开文本';

  @override
  String get fontSize => '字体大小';

  @override
  String get increaseOrDecreaseWordSpacing => '增加或减少单词间距';

  @override
  String get increaseOrDecreaseLetterSpacing => '增加或减少字母间距';

  @override
  String get increaseOrDecreaseLineHeight => '增加或减少行高';

  @override
  String get increaseOrDecreaseTextSize => '增加或减少文本大小';

  @override
  String get incrementWordSpacing => '增加单词间距';

  @override
  String get incrementLetterSpacing => '增加字母间距';

  @override
  String get incrementLineHeight => '增加行高';

  @override
  String get incrementTextScaleFactor => '增加文本缩放因子';

  @override
  String get lessInfo => '隐藏信息';

  @override
  String get letterSpacing => '字母间距';

  @override
  String get lineHeight => '行高';

  @override
  String get moreInfo => '显示信息';

  @override
  String get readLess => '收起阅读';

  @override
  String get readMore => '阅读更多';

  @override
  String get reduceEffects => '减少屏幕效果';

  @override
  String get reduceText => '缩小文本';

  @override
  String get restoreSettings => '恢复设置';

  @override
  String get restoreMainColor => '恢复主色';

  @override
  String get returnToMainColors => '返回主色';

  @override
  String get settings => '设置';

  @override
  String get sizeAndTextDisplay => '大小和文本显示';

  @override
  String get sliderWordSpacing => '单词间距滑块';

  @override
  String get sliderLetterSpacing => '字母间距滑块';

  @override
  String get sliderLineHeight => '行高滑块';

  @override
  String get themeMode => '主题';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': '无法识别的主题配置',
      'seizureSafe': '癢疾安全',
      'visionImpaired': '视力障碍',
      'adhdFriendly': 'ADHD友好',
      'none': '默认配置',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => '癢疾安全配置';

  @override
  String get themeProfileSeizureSafeSubtitle => '移除反光并减少颜色';

  @override
  String get themeProfileSeizureSafeDescription =>
      '此配置文件通过消除闪烁动画和危险的颜色组合导致的癢疾发作风险，使患有癢疾和有癢疾发作风险的用户能够安全浏览。';

  @override
  String get themeProfileVisionImpairedTitle => '视力障碍配置';

  @override
  String get themeProfileVisionImpairedSubtitle => '提高应用程序的可见度';

  @override
  String get themeProfileVisionImpairedDescription =>
      '此配置文件使应用程序适应于大多数视觉障碍，如视力障碍、管状视野、白内障、青光眼等。';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD友好配置';

  @override
  String get themeProfileAdhdFriendlySubtitle => '更多的注意力和更少的分心';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      '此配置文件显著减少分心，帮助患有ADHD和神经发育障碍的人更容易地浏览、阅读和专注于应用程序的基本要素。';

  @override
  String get theSettingsHaveBeenReset => '设置已重置。';

  @override
  String get toggleDarkMode => '切换暗黑模式';

  @override
  String get toggleEffectsMode => '切换效果模式';

  @override
  String get toggleFontWeight => '切换字体粗细';

  @override
  String get toggleThemeProfile => '切换主题配置';

  @override
  String get wordSpacing => '单词间距';

  @override
  String get accessibleFont => '无障碍字体';

  @override
  String get accessibleFontSubtitle => '使用无障碍字体以获得更好的可读性';

  @override
  String get accessibleFontEnabled => '无障碍字体已启用';

  @override
  String get accessibleFontDisabled => '无障碍字体已禁用';

  @override
  String get toggleAccessibleFont => '切换无障碍字体';

  @override
  String get settingsLoading => '正在加载无障碍设置…';

  @override
  String get settingsLoadFailed => '无障碍设置加载失败。';

  @override
  String get retry => '重试';
}
