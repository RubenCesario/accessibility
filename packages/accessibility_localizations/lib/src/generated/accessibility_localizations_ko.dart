// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AccessibilityLocalizationsKo extends AccessibilityLocalizations {
  AccessibilityLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get accessibility => '접근성';

  @override
  String get accessibilitySettings => '접근성 설정';

  @override
  String get adjustBackgroundColors => '배경색 조정';

  @override
  String get adjustTextColors => '텍스트 색상 조정';

  @override
  String get alignCenter => '가운데 정렬';

  @override
  String get alignLeft => '왼쪽 정렬';

  @override
  String get alignRight => '오른쪽 정렬';

  @override
  String get textAlignment => '텍스트 정렬';

  @override
  String get boldText => '굵은 텍스트';

  @override
  String get changeBoldText => '굵은 텍스트 변경';

  @override
  String get changePagesBackgroundColor => '페이지 배경색을 다음으로 변경: ';

  @override
  String get changeTextColor => '텍스트 색상을 다음으로 변경: ';

  @override
  String get changeTextColorShade => '색상의 음영을 다음으로 변경: ';

  @override
  String get colorAdjustment => '색상 조정';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => '현재 색상 프로필: ';

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
  String get decrementWordSpacing => '단어 간격 줄이기';

  @override
  String get decrementLetterSpacing => '글자 간격 줄이기';

  @override
  String get decrementLineHeight => '줄 높이 줄이기';

  @override
  String get decrementTextScaleFactor => '텍스트 크기 요소 줄이기';

  @override
  String get effects => '효과';

  @override
  String get expandText => '텍스트 확장';

  @override
  String get fontSize => '글꼴 크기';

  @override
  String get increaseOrDecreaseWordSpacing => '단어 간격 증가 또는 감소';

  @override
  String get increaseOrDecreaseLetterSpacing => '글자 간격 증가 또는 감소';

  @override
  String get increaseOrDecreaseLineHeight => '줄 높이 증가 또는 감소';

  @override
  String get increaseOrDecreaseTextSize => '텍스트 크기 증가 또는 감소';

  @override
  String get incrementWordSpacing => '단어 간격 증가';

  @override
  String get incrementLetterSpacing => '글자 간격 증가';

  @override
  String get incrementLineHeight => '줄 높이 증가';

  @override
  String get incrementTextScaleFactor => '텍스트 크기 요소 증가';

  @override
  String get lessInfo => '정보 숨기기';

  @override
  String get letterSpacing => '글자 간격';

  @override
  String get lineHeight => '줄 높이';

  @override
  String get moreInfo => '정보 보기';

  @override
  String get readLess => '적게 읽기';

  @override
  String get readMore => '더 읽기';

  @override
  String get reduceEffects => '화면에 효과 줄이기';

  @override
  String get reduceText => '텍스트 줄이기';

  @override
  String get restoreSettings => '설정 복원';

  @override
  String get restoreMainColor => '기본 색상 복원';

  @override
  String get returnToMainColors => '기본 색상으로 돌아가기';

  @override
  String get settings => '설정';

  @override
  String get sizeAndTextDisplay => '크기 및 텍스트 표시';

  @override
  String get sliderWordSpacing => '단어 간격 슬라이더';

  @override
  String get sliderLetterSpacing => '글자 간격 슬라이더';

  @override
  String get sliderLineHeight => '줄 높이 슬라이더';

  @override
  String get themeMode => '테마';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': '테마 프로필을 인식할 수 없음',
      'seizureSafe': '발작 방지',
      'visionImpaired': '시각 장애',
      'adhdFriendly': 'ADHD 친화적',
      'none': '기본 프로필',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => '발작 방지 프로필';

  @override
  String get themeProfileSeizureSafeSubtitle => '반사를 제거하고 색상을 줄임';

  @override
  String get themeProfileSeizureSafeDescription =>
      '이 프로필은 전푼질환을 앞고 발작의 위험이 있는 사용자가 번쥐금하는 애니메이션과 위험한 색상 조합으로 인한 발작 위험성을 제거하여 안전하게 사용할 수 있도록 해줍니다.';

  @override
  String get themeProfileVisionImpairedTitle => '시각 장애 프로필';

  @override
  String get themeProfileVisionImpairedSubtitle => '앱 가시성 향상';

  @override
  String get themeProfileVisionImpairedDescription =>
      '이 프로필은 시각 장애, 터널 비전, 백내장, 녹내장 등과 같은 대부분의 시각적 장애에 접근 가능하도록 어플리케이션을 적응시킵니다.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD 친화적 프로필';

  @override
  String get themeProfileAdhdFriendlySubtitle => '더 높은 집중력과 적은 주의산만';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      '이 프로필은 주의산만을 크게 줄여 주의력 결핍 과다활동장애가 있는 사람들이 어플리케이션의 필수 요소에 더 쾌 집중할 수 있게 도와 탐색, 읽기 등이 용이하게 해줍니다.';

  @override
  String get theSettingsHaveBeenReset => '설정이 초기화되었습니다.';

  @override
  String get toggleDarkMode => '다크 모드 토글';

  @override
  String get toggleEffectsMode => '효과 모드 토글';

  @override
  String get toggleFontWeight => '폰트 굵기 토글';

  @override
  String get toggleThemeProfile => '테마 프로필 토글';

  @override
  String get wordSpacing => '단어 간격';

  @override
  String get accessibleFont => '접근성 폰트';

  @override
  String get accessibleFontSubtitle => '더 나은 가독성을 위해 접근성 글꼴 사용';

  @override
  String get accessibleFontEnabled => '접근성 폰트 활성화됨';

  @override
  String get accessibleFontDisabled => '접근성 폰트 비활성화됨';

  @override
  String get toggleAccessibleFont => '접근성 폰트 토글';

  @override
  String get settingsLoading => '접근성 설정을 불러오는 중…';

  @override
  String get settingsLoadFailed => '접근성 설정을 불러올 수 없습니다.';

  @override
  String get retry => '다시 시도';
}
