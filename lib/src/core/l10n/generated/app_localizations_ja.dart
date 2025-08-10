// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AccessibilityLocalizationsJa extends AccessibilityLocalizations {
  AccessibilityLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get accessibility => 'アクセシビリティ';

  @override
  String get accessibility_settings => 'アクセシビリティ設定';

  @override
  String get adjust_background_colors => '背景色を調整する';

  @override
  String get adjust_text_colors => 'テキスト色を調整する';

  @override
  String get align_center => '中央揃え';

  @override
  String get align_left => '左揃え';

  @override
  String get align_right => '右揃え';

  @override
  String get bold_text => '太字';

  @override
  String get change_bold_text => '太字を変更する';

  @override
  String get change_pages_background_color => 'ページの背景色を次のように変更します： ';

  @override
  String get change_text_color => 'テキストの色を次のように変更します： ';

  @override
  String get change_text_color_shade => '色の濃さを次のように変更します： ';

  @override
  String get color_adjustment => '色の調整';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': '標準',
        'lowSaturation': '低彩度',
        'normal': '標準',
        'highSaturation': '高彩度',
        'monochrome': 'モノクロ',
        'highContrast': '高コントラスト',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => '現在の色プロファイル： ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
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
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => '単語間隔を減らす';

  @override
  String get decrement_letter_spacing => '文字間隔を減らす';

  @override
  String get decrement_line_height => '行間隔を減らす';

  @override
  String get decrement_text_scale_factor => 'テキストスケール係数を減らす';

  @override
  String get effects => 'エフェクト';

  @override
  String get expand_text => 'テキストを拡大する';

  @override
  String get font_size => 'フォントサイズ';

  @override
  String get increase_or_decrease_word_spacing => '単語間隔を増減する';

  @override
  String get increase_or_decrease_letter_spacing => '文字間隔を増減する';

  @override
  String get increase_or_decrease_line_height => '行間隔を増減する';

  @override
  String get increase_or_decrease_text_size => 'テキストサイズを増減する';

  @override
  String get increment_word_spacing => '単語間隔を増やす';

  @override
  String get increment_letter_spacing => '文字間隔を増やす';

  @override
  String get increment_line_height => '行間隔を増やす';

  @override
  String get increment_text_scale_factor => 'テキストスケール係数を増やす';

  @override
  String get less_info => '情報を隠す';

  @override
  String get letter_spacing => '文字間隔';

  @override
  String get line_height => '行間隔';

  @override
  String get more_info => '情報を表示する';

  @override
  String get read_less => '読み取りを減らす';

  @override
  String get read_more => '読み取りを増やす';

  @override
  String get reduce_effects => 'エフェクトを減らす';

  @override
  String get reduce_text => 'テキストを減らす';

  @override
  String get restore_settings => '設定を元に戻す';

  @override
  String get restore_main_color => 'メインカラーを元に戻す';

  @override
  String get return_to_main_colors => 'メインカラーに戻る';

  @override
  String get settings => '設定';

  @override
  String get size_and_text_display => 'サイズとテキスト表示';

  @override
  String get slider_word_spacing => 'スライダー単語間隔';

  @override
  String get slider_letter_spacing => 'スライダー文字間隔';

  @override
  String get slider_line_height => 'スライダー行間隔';

  @override
  String get theme_mode => 'テーマ';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'テーマプロファイルが認識されません',
        'seizureSafe': 'てんかん安全',
        'visionImpaired': '視覚障害',
        'adhdFriendly': 'ADHDフレンドリー',
        'none': 'デフォルト',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'てんかん安全プロファイル';

  @override
  String get theme_profile_seizure_safe_subtitle => '反射を取り除き、色を減らす';

  @override
  String get theme_profile_seizure_safe_description =>
      'このプロファイルは、てんかんを持ち、発作のリスクがあるユーザーが、点滅するアニメーションや危険な色の組み合わせによる発作のリスクを排除することで、安全にブラウジングできるようにします。';

  @override
  String get theme_profile_vision_impaired_title => '視覚障害プロファイル';

  @override
  String get theme_profile_vision_impaired_subtitle => 'アプリケーションの視認性を向上';

  @override
  String get theme_profile_vision_impaired_description =>
      'このプロファイルは、視覚障害、トンネル視、白内障、緑内障などのほとんどの視覚障害にアクセスできるようにアプリケーションを適応させます。';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHDフレンドリープロファイル';

  @override
  String get theme_profile_adhd_friendly_subtitle => 'より集中し、気が散らないように';

  @override
  String get theme_profile_adhd_friendly_description =>
      'このプロファイルは注意散漫を大幅に減らし、ADHDや神経発達障害を持つ人々がアプリケーションの重要な要素をより簡単にナビゲート、読み取り、集中できるようにします。';

  @override
  String get the_settings_have_been_reset => '設定がリセットされました。';

  @override
  String get toggle_dark_mode => 'ダークモードを切り替え';

  @override
  String get toggle_effects_mode => 'エフェクトモードを切り替え';

  @override
  String get toggle_font_weight => 'フォントの太さを切り替え';

  @override
  String get toggle_theme_profile => 'テーマプロファイルを切り替え';

  @override
  String get word_spacing => '単語間隔';
}
