import 'package:accessibility/src/core/l10n/generated/app_localizations_ja.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsJa', () {
    late AccessibilityLocalizationsJa loc;

    setUp(() {
      loc = AccessibilityLocalizationsJa();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ja'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('アクセシビリティ'));
      expect(
        loc.accessibility_settings,
        equals('アクセシビリティ設定'),
      );
      expect(
        loc.adjust_background_colors,
        equals('背景色を調整する'),
      );
      expect(loc.adjust_text_colors, equals('テキスト色を調整する'));
      expect(loc.align_center, equals('中央揃え'));
      expect(loc.align_left, equals('左揃え'));
      expect(loc.align_right, equals('右揃え'));
      expect(loc.bold_text, equals('太字'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('太字を変更する'));
      expect(
        loc.change_pages_background_color,
        equals('ページの背景色を次のように変更します： '),
      );
      expect(
        loc.change_text_color,
        equals('テキストの色を次のように変更します： '),
      );
      expect(
        loc.change_text_color_shade,
        equals('色の濃さを次のように変更します： '),
      );
      expect(loc.color_adjustment, equals('色の調整'));
      expect(
        loc.color_profile_changed_to,
        equals('現在の色プロファイル： '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('単語間隔を減らす'));
      expect(loc.decrement_letter_spacing, equals('文字間隔を減らす'));
      expect(loc.decrement_line_height, equals('行間隔を減らす'));
      expect(
        loc.decrement_text_scale_factor,
        equals('テキストスケール係数を減らす'),
      );
      expect(loc.increment_word_spacing, equals('単語間隔を増やす'));
      expect(loc.increment_letter_spacing, equals('文字間隔を増やす'));
      expect(loc.increment_line_height, equals('行間隔を増やす'));
      expect(
        loc.increment_text_scale_factor,
        equals('テキストスケール係数を増やす'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('単語間隔を増減する'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('文字間隔を増減する'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('行間隔を増減する'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('テキストサイズを増減する'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('エフェクト'));
      expect(loc.expand_text, equals('テキストを拡大する'));
      expect(loc.font_size, equals('フォントサイズ'));
      expect(loc.less_info, equals('情報を隠す'));
      expect(loc.letter_spacing, equals('文字間隔'));
      expect(loc.line_height, equals('行間隔'));
      expect(loc.more_info, equals('情報を表示する'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('読み取りを減らす'));
      expect(loc.read_more, equals('読み取りを増やす'));
      expect(loc.reduce_effects, equals('エフェクトを減らす'));
      expect(loc.reduce_text, equals('テキストを減らす'));
      expect(loc.restore_settings, equals('設定を元に戻す'));
      expect(loc.restore_main_color, equals('メインカラーを元に戻す'));
      expect(loc.return_to_main_colors, equals('メインカラーに戻る'));
      expect(loc.settings, equals('設定'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('サイズとテキスト表示'),
      );
      expect(loc.slider_word_spacing, equals('スライダー単語間隔'));
      expect(loc.slider_letter_spacing, equals('スライダー文字間隔'));
      expect(loc.slider_line_height, equals('スライダー行間隔'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('テーマプロファイルが認識されません'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('てんかん安全'));
      expect(loc.theme_profile('visionImpaired'), equals('視覚障害'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHDフレンドリー'));
      expect(loc.theme_profile('none'), equals('デフォルト'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('てんかん安全プロファイル'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('反射を取り除き、色を減らす'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'このプロファイルは、てんかんを持ち、発作のリスクがあるユー'
          'ザーが、点滅するアニメーションや危険な色の組み合わせによる'
          '発作のリスクを排除することで、安全にブラウジングできるよう'
          'にします。',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('視覚障害プロファイル'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('アプリケーションの視認性を向上'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'このプロファイルは、視覚障害、トンネル視、白内障、緑内障な'
          'どのほとんどの視覚障害にアクセスできるようにアプリケーショ'
          'ンを適応させます。',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHDフレンドリープロファイル'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('より集中し、気が散らないように'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'このプロファイルは注意散漫を大幅に減らし、ADHDや神経発達障'
          '害を持つ人々がアプリケーションの重要な要素をより簡単にナビ'
          'ゲート、読み取り、集中できるようにします。',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('設定がリセットされました。'),
      );
      expect(loc.toggle_dark_mode, equals('ダークモードを切り替え'));
      expect(loc.toggle_effects_mode, equals('エフェクトモードを切り替え'));
      expect(loc.toggle_font_weight, equals('フォントの太さを切り替え'));
      expect(loc.toggle_theme_profile, equals('テーマプロファイルを切り替え'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('標準'));
      expect(loc.color_profile('lowSaturation'), equals('低彩度'));
      expect(loc.color_profile('normal'), equals('標準'));
      expect(loc.color_profile('highSaturation'), equals('高彩度'));
      expect(loc.color_profile('monochrome'), equals('モノクロ'));
      expect(loc.color_profile('highContrast'), equals('高コントラスト'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('色が認識されません'));
      expect(loc.color('cF44336'), equals('赤'));
      expect(loc.color('cE91E63'), equals('ピンク'));
      expect(loc.color('c9C27B0'), equals('紫'));
      expect(loc.color('c673AB7'), equals('深紫'));
      expect(loc.color('c3F51B5'), equals('インディゴ'));
      expect(loc.color('c2196F3'), equals('青'));
      expect(loc.color('c03A9F4'), equals('水色'));
      expect(loc.color('c00BCD4'), equals('シアン'));
      expect(loc.color('c009688'), equals('ティール'));
      expect(loc.color('c4CAF50'), equals('緑'));
      expect(loc.color('c8BC34A'), equals('薄緑'));
      expect(loc.color('cCDDC39'), equals('ライム'));
      expect(loc.color('cFFEB3B'), equals('黄色'));
      expect(loc.color('cFFC107'), equals('琥珀'));
      expect(loc.color('cFF9800'), equals('オレンジ'));
      expect(loc.color('cFF5722'), equals('深いオレンジ'));
      expect(loc.color('c795548'), equals('茶色'));
      expect(loc.color('c9E9E9E'), equals('灰色'));
      expect(loc.color('c607D8B'), equals('ブルーグレー'));
    });
  });
}
