// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AccessibilityLocalizationsKo extends AccessibilityLocalizations {
  AccessibilityLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get accessibility => '접근성';

  @override
  String get accessibility_settings => '접근성 설정';

  @override
  String get adjust_background_colors => '배경색 조정';

  @override
  String get adjust_text_colors => '텍스트 색상 조정';

  @override
  String get align_center => '가운데 정렬';

  @override
  String get align_left => '왼쪽 정렬';

  @override
  String get align_right => '오른쪽 정렬';

  @override
  String get bold_text => '굵은 텍스트';

  @override
  String get change_bold_text => '굵은 텍스트 변경';

  @override
  String get change_pages_background_color => '페이지 배경색을 다음으로 변경: ';

  @override
  String get change_text_color => '텍스트 색상을 다음으로 변경: ';

  @override
  String get change_text_color_shade => '색상의 음영을 다음으로 변경: ';

  @override
  String get color_adjustment => '색상 조정';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': '일반',
      'lowSaturation': '낮은 채도',
      'normal': '일반',
      'highSaturation': '높은 채도',
      'monochrome': '단색',
      'highContrast': '고대비',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => '현재 색상 프로필: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': '색상을 인식할 수 없음',
      'cF44336': '빨간색',
      'cE91E63': '분홍색',
      'c9C27B0': '보라색',
      'c673AB7': '진한 보라색',
      'c3F51B5': '인디고',
      'c2196F3': '파란색',
      'c03A9F4': '연한 파란색',
      'c00BCD4': '청록색',
      'c009688': '티얼',
      'c4CAF50': '초록색',
      'c8BC34A': '연한 초록색',
      'cCDDC39': '라임',
      'cFFEB3B': '노란색',
      'cFFC107': '호박색',
      'cFF9800': '주황색',
      'cFF5722': '진한 주황색',
      'c795548': '갈색',
      'c9E9E9E': '회색',
      'c607D8B': '쫘색',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => '단어 간격 줄이기';

  @override
  String get decrement_letter_spacing => '글자 간격 줄이기';

  @override
  String get decrement_line_height => '줄 높이 줄이기';

  @override
  String get decrement_text_scale_factor => '텍스트 크기 요소 줄이기';

  @override
  String get effects => '효과';

  @override
  String get expand_text => '텍스트 확장';

  @override
  String get font_size => '글꼴 크기';

  @override
  String get increase_or_decrease_word_spacing => '단어 간격 증가 또는 감소';

  @override
  String get increase_or_decrease_letter_spacing => '글자 간격 증가 또는 감소';

  @override
  String get increase_or_decrease_line_height => '줄 높이 증가 또는 감소';

  @override
  String get increase_or_decrease_text_size => '텍스트 크기 증가 또는 감소';

  @override
  String get increment_word_spacing => '단어 간격 증가';

  @override
  String get increment_letter_spacing => '글자 간격 증가';

  @override
  String get increment_line_height => '줄 높이 증가';

  @override
  String get increment_text_scale_factor => '텍스트 크기 요소 증가';

  @override
  String get less_info => '정보 숨기기';

  @override
  String get letter_spacing => '글자 간격';

  @override
  String get line_height => '줄 높이';

  @override
  String get more_info => '정보 보기';

  @override
  String get read_less => '적게 읽기';

  @override
  String get read_more => '더 읽기';

  @override
  String get reduce_effects => '화면에 효과 줄이기';

  @override
  String get reduce_text => '텍스트 줄이기';

  @override
  String get restore_settings => '설정 복원';

  @override
  String get restore_main_color => '기본 색상 복원';

  @override
  String get return_to_main_colors => '기본 색상으로 돌아가기';

  @override
  String get settings => '설정';

  @override
  String get size_and_text_display => '크기 및 텍스트 표시';

  @override
  String get slider_word_spacing => '단어 간격 슬라이더';

  @override
  String get slider_letter_spacing => '글자 간격 슬라이더';

  @override
  String get slider_line_height => '줄 높이 슬라이더';

  @override
  String get theme_mode => '테마';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': '테마 프로필을 인식할 수 없음',
      'seizureSafe': '발작 방지',
      'visionImpaired': '시각 장애',
      'adhdFriendly': 'ADHD 친화적',
      'none': '기본값',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => '발작 방지 프로필';

  @override
  String get theme_profile_seizure_safe_subtitle => '반사를 제거하고 색상을 줄임';

  @override
  String get theme_profile_seizure_safe_description =>
      '이 프로필은 전푼질환을 앞고 발작의 위험이 있는 사용자가 번쥐금하는 애니메이션과 위험한 색상 조합으로 인한 발작 위험성을 제거하여 안전하게 사용할 수 있도록 해줍니다.';

  @override
  String get theme_profile_vision_impaired_title => '시각 장애 프로필';

  @override
  String get theme_profile_vision_impaired_subtitle => '앱 가시성 향상';

  @override
  String get theme_profile_vision_impaired_description =>
      '이 프로필은 시각 장애, 터널 비전, 백내장, 녹내장 등과 같은 대부분의 시각적 장애에 접근 가능하도록 어플리케이션을 적응시킵니다.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD 친화적 프로필';

  @override
  String get theme_profile_adhd_friendly_subtitle => '더 높은 집중력과 적은 주의산만';

  @override
  String get theme_profile_adhd_friendly_description =>
      '이 프로필은 주의산만을 크게 줄여 주의력 결핍 과다활동장애가 있는 사람들이 어플리케이션의 필수 요소에 더 쾌 집중할 수 있게 도와 탐색, 읽기 등이 용이하게 해줍니다.';

  @override
  String get the_settings_have_been_reset => '설정이 초기화되었습니다.';

  @override
  String get toggle_dark_mode => '다크 모드 토글';

  @override
  String get toggle_effects_mode => '효과 모드 토글';

  @override
  String get toggle_font_weight => '폰트 굵기 토글';

  @override
  String get toggle_theme_profile => '테마 프로필 토글';

  @override
  String get word_spacing => '단어 간격';
}
