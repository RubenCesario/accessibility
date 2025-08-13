import 'package:accessibility/src/core/l10n/generated/app_localizations_ko.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsKo', () {
    late AccessibilityLocalizationsKo loc;

    setUp(() {
      loc = AccessibilityLocalizationsKo();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ko'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('접근성'));
      expect(loc.accessibility_settings, equals('접근성 설정'));
      expect(loc.adjust_background_colors, equals('배경색 조정'));
      expect(loc.adjust_text_colors, equals('텍스트 색상 조정'));
      expect(loc.align_center, equals('가운데 정렬'));
      expect(loc.align_left, equals('왼쪽 정렬'));
      expect(loc.align_right, equals('오른쪽 정렬'));
      expect(loc.bold_text, equals('굵은 텍스트'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('굵은 텍스트 변경'));
      expect(
        loc.change_pages_background_color,
        equals('페이지 배경색을 다음으로 변경: '),
      );
      expect(
        loc.change_text_color,
        equals('텍스트 색상을 다음으로 변경: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('색상의 음영을 다음으로 변경: '),
      );
      expect(loc.color_adjustment, equals('색상 조정'));
      expect(
        loc.color_profile_changed_to,
        equals('현재 색상 프로필: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('단어 간격 줄이기'));
      expect(loc.decrement_letter_spacing, equals('글자 간격 줄이기'));
      expect(loc.decrement_line_height, equals('줄 높이 줄이기'));
      expect(
        loc.decrement_text_scale_factor,
        equals('텍스트 크기 요소 줄이기'),
      );
      expect(loc.increment_word_spacing, equals('단어 간격 증가'));
      expect(loc.increment_letter_spacing, equals('글자 간격 증가'));
      expect(loc.increment_line_height, equals('줄 높이 증가'));
      expect(loc.increment_text_scale_factor, equals('텍스트 크기 요소 증가'));
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('단어 간격 증가 또는 감소'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('글자 간격 증가 또는 감소'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('줄 높이 증가 또는 감소'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('텍스트 크기 증가 또는 감소'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('효과'));
      expect(loc.expand_text, equals('텍스트 확장'));
      expect(loc.font_size, equals('글꼴 크기'));
      expect(loc.less_info, equals('정보 숨기기'));
      expect(loc.letter_spacing, equals('글자 간격'));
      expect(loc.line_height, equals('줄 높이'));
      expect(loc.more_info, equals('정보 보기'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('적게 읽기'));
      expect(loc.read_more, equals('더 읽기'));
      expect(loc.reduce_effects, equals('화면에 효과 줄이기'));
      expect(loc.reduce_text, equals('텍스트 줄이기'));
      expect(loc.restore_settings, equals('설정 복원'));
      expect(loc.restore_main_color, equals('기본 색상 복원'));
      expect(
        loc.return_to_main_colors,
        equals('기본 색상으로 돌아가기'),
      );
      expect(loc.settings, equals('설정'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('크기 및 텍스트 표시'),
      );
      expect(loc.slider_word_spacing, equals('단어 간격 슬라이더'));
      expect(loc.slider_letter_spacing, equals('글자 간격 슬라이더'));
      expect(loc.slider_line_height, equals('줄 높이 슬라이더'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('테마'));
      expect(
        loc.theme_profile('other'),
        equals('테마 프로필을 인식할 수 없음'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('발작 방지'));
      expect(loc.theme_profile('visionImpaired'), equals('시각 장애'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD 친화적'));
      expect(loc.theme_profile('none'), equals('기본값'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('발작 방지 프로필'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('반사를 제거하고 색상을 줄임'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          '이 프로필은 전푼질환을 앞고 발작의 위험이 있는 사용자가 '
          '번쥐금하는 애니메이션과 위험한 색상 조합으로 인한 발작 '
          '위험성을 제거하여 안전하게 사용할 수 있도록 해줍니다.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('시각 장애 프로필'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('앱 가시성 향상'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          '이 프로필은 시각 장애, 터널 비전, 백내장, 녹내장 등과 같은 '
          '대부분의 시각적 장애에 접근 가능하도록 어플리케이션을 '
          '적응시킵니다.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD 친화적 프로필'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('더 높은 집중력과 적은 주의산만'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          '이 프로필은 주의산만을 크게 줄여 주의력 결핍 '
          '과다활동장애가 있는 사람들이 어플리케이션의 필수 요소에 '
          '더 쾌 집중할 수 있게 도와 탐색, 읽기 등이 용이하게 '
          '해줍니다.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('설정이 초기화되었습니다.'),
      );
      expect(loc.toggle_dark_mode, equals('다크 모드 토글'));
      expect(loc.toggle_effects_mode, equals('효과 모드 토글'));
      expect(loc.toggle_font_weight, equals('폰트 굵기 토글'));
      expect(loc.toggle_theme_profile, equals('테마 프로필 토글'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('일반'));
      expect(loc.color_profile('lowSaturation'), equals('낮은 채도'));
      expect(loc.color_profile('normal'), equals('일반'));
      expect(loc.color_profile('highSaturation'), equals('높은 채도'));
      expect(loc.color_profile('monochrome'), equals('단색'));
      expect(loc.color_profile('highContrast'), equals('고대비'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('색상을 인식할 수 없음'));
      expect(loc.color('cF44336'), equals('빨간색'));
      expect(loc.color('cE91E63'), equals('분홍색'));
      expect(loc.color('c9C27B0'), equals('보라색'));
      expect(loc.color('c673AB7'), equals('진한 보라색'));
      expect(loc.color('c3F51B5'), equals('인디고'));
      expect(loc.color('c2196F3'), equals('파란색'));
      expect(loc.color('c03A9F4'), equals('연한 파란색'));
      expect(loc.color('c00BCD4'), equals('청록색'));
      expect(loc.color('c009688'), equals('티얼'));
      expect(loc.color('c4CAF50'), equals('초록색'));
      expect(loc.color('c8BC34A'), equals('연한 초록색'));
      expect(loc.color('cCDDC39'), equals('라임'));
      expect(loc.color('cFFEB3B'), equals('노란색'));
      expect(loc.color('cFFC107'), equals('호박색'));
      expect(loc.color('cFF9800'), equals('주황색'));
      expect(loc.color('cFF5722'), equals('진한 주황색'));
      expect(loc.color('c795548'), equals('갈색'));
      expect(loc.color('c9E9E9E'), equals('회색'));
      expect(loc.color('c607D8B'), equals('쫘색'));
    });
  });
}
