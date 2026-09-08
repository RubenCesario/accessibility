// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AccessibilityLocalizationsJa extends AccessibilityLocalizations {
  AccessibilityLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get accessibility => 'アクセシビリティ';

  @override
  String get accessibilitySettings => 'アクセシビリティ設定';

  @override
  String get adjustBackgroundColors => '背景色を調整する';

  @override
  String get adjustTextColors => 'テキスト色を調整する';

  @override
  String get alignCenter => '中央揃え';

  @override
  String get alignLeft => '左揃え';

  @override
  String get alignRight => '右揃え';

  @override
  String get textAlignment => 'テキストの配置';

  @override
  String get boldText => '太字';

  @override
  String get changeBoldText => '太字を変更する';

  @override
  String get changePagesBackgroundColor => 'ページの背景色を次のように変更します： ';

  @override
  String get changeTextColor => 'テキストの色を次のように変更します： ';

  @override
  String get changeTextColorShade => '色の濃さを次のように変更します： ';

  @override
  String get colorAdjustment => '色の調整';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': '標準',
      'lowSaturation': '低彩度',
      'normal': '標準',
      'highSaturation': '高彩度',
      'monochrome': 'モノクロ',
      'highContrast': '高コントラスト',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => '現在の色プロファイル： ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': '色が認識されません',
      'cF44336': '赤',
      'cE91E63': 'ピンク',
      'c9C27B0': '紫',
      'c673AB7': '深紫',
      'c3F51B5': 'インディゴ',
      'c2196F3': '青',
      'c03A9F4': '水色',
      'c00BCD4': 'シアン',
      'c009688': 'ティール',
      'c4CAF50': '緑',
      'c8BC34A': '薄緑',
      'cCDDC39': 'ライム',
      'cFFEB3B': '黄色',
      'cFFC107': '琥珀',
      'cFF9800': 'オレンジ',
      'cFF5722': '深いオレンジ',
      'c795548': '茶色',
      'c9E9E9E': '灰色',
      'c607D8B': 'ブルーグレー',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => '単語間隔を減らす';

  @override
  String get decrementLetterSpacing => '文字間隔を減らす';

  @override
  String get decrementLineHeight => '行間隔を減らす';

  @override
  String get decrementTextScaleFactor => 'テキストスケール係数を減らす';

  @override
  String get effects => 'エフェクト';

  @override
  String get expandText => 'テキストを拡大する';

  @override
  String get fontSize => 'フォントサイズ';

  @override
  String get increaseOrDecreaseWordSpacing => '単語間隔を増減する';

  @override
  String get increaseOrDecreaseLetterSpacing => '文字間隔を増減する';

  @override
  String get increaseOrDecreaseLineHeight => '行間隔を増減する';

  @override
  String get increaseOrDecreaseTextSize => 'テキストサイズを増減する';

  @override
  String get incrementWordSpacing => '単語間隔を増やす';

  @override
  String get incrementLetterSpacing => '文字間隔を増やす';

  @override
  String get incrementLineHeight => '行間隔を増やす';

  @override
  String get incrementTextScaleFactor => 'テキストスケール係数を増やす';

  @override
  String get lessInfo => '情報を隠す';

  @override
  String get letterSpacing => '文字間隔';

  @override
  String get lineHeight => '行間隔';

  @override
  String get moreInfo => '情報を表示する';

  @override
  String get readLess => '読み取りを減らす';

  @override
  String get readMore => '読み取りを増やす';

  @override
  String get reduceEffects => 'エフェクトを減らす';

  @override
  String get reduceText => 'テキストを減らす';

  @override
  String get restoreSettings => '設定を元に戻す';

  @override
  String get restoreMainColor => 'メインカラーを元に戻す';

  @override
  String get returnToMainColors => 'メインカラーに戻る';

  @override
  String get settings => '設定';

  @override
  String get sizeAndTextDisplay => 'サイズとテキスト表示';

  @override
  String get sliderWordSpacing => 'スライダー単語間隔';

  @override
  String get sliderLetterSpacing => 'スライダー文字間隔';

  @override
  String get sliderLineHeight => 'スライダー行間隔';

  @override
  String get themeMode => 'テーマ';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'テーマプロファイルが認識されません',
      'seizureSafe': 'てんかん安全',
      'visionImpaired': '視覚障害',
      'adhdFriendly': 'ADHDフレンドリー',
      'none': 'デフォルトプロファイル',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'てんかん安全プロファイル';

  @override
  String get themeProfileSeizureSafeSubtitle => '反射を取り除き、色を減らす';

  @override
  String get themeProfileSeizureSafeDescription =>
      'このプロファイルは、てんかんを持ち、発作のリスクがあるユーザーが、点滅するアニメーションや危険な色の組み合わせによる発作のリスクを排除することで、安全にブラウジングできるようにします。';

  @override
  String get themeProfileVisionImpairedTitle => '視覚障害プロファイル';

  @override
  String get themeProfileVisionImpairedSubtitle => 'アプリケーションの視認性を向上';

  @override
  String get themeProfileVisionImpairedDescription =>
      'このプロファイルは、視覚障害、トンネル視、白内障、緑内障などのほとんどの視覚障害にアクセスできるようにアプリケーションを適応させます。';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHDフレンドリープロファイル';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'より集中し、気が散らないように';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'このプロファイルは注意散漫を大幅に減らし、ADHDや神経発達障害を持つ人々がアプリケーションの重要な要素をより簡単にナビゲート、読み取り、集中できるようにします。';

  @override
  String get theSettingsHaveBeenReset => '設定がリセットされました。';

  @override
  String get toggleDarkMode => 'ダークモードを切り替え';

  @override
  String get toggleEffectsMode => 'エフェクトモードを切り替え';

  @override
  String get toggleFontWeight => 'フォントの太さを切り替え';

  @override
  String get toggleThemeProfile => 'テーマプロファイルを切り替え';

  @override
  String get wordSpacing => '単語間隔';

  @override
  String get accessibleFont => 'アクセシブルフォント';

  @override
  String get accessibleFontSubtitle => '読みやすさを向上させるためにアクセシブルなフォントを使用';

  @override
  String get accessibleFontEnabled => 'アクセシブルフォント有効';

  @override
  String get accessibleFontDisabled => 'アクセシブルフォント無効';

  @override
  String get toggleAccessibleFont => 'アクセシブルフォントを切り替え';

  @override
  String get settingsLoading => 'アクセシビリティ設定を読み込んでいます…';

  @override
  String get settingsLoadFailed => 'アクセシビリティ設定を読み込めませんでした。';

  @override
  String get retry => '再試行';
}
