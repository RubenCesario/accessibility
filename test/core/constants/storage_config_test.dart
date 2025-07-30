import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocalStorageKeys', () {
    test('should define all storage keys correctly', () {
      expect(LocalStorageKeys.themeMode, equals('isDarkMode'));
      expect(LocalStorageKeys.effectsAllowed, equals('hasNoEffects'));
      expect(LocalStorageKeys.isFirstTimeOpened, equals('isFirstTimeOpened'));
      expect(
        LocalStorageKeys.textAccessibilitySettingWordSpacing,
        equals('textAccessibilitySettingWordSpacing'),
      );
      expect(
        LocalStorageKeys.textAccessibilitySettingLineHeight,
        equals('textAccessibilitySettingLineHeight'),
      );
      expect(
        LocalStorageKeys.textAccessibilitySettingLetterSpacing,
        equals('textAccessibilitySettingLetterSpacing'),
      );
      expect(
        LocalStorageKeys.textAccessibilitySettingScaleFactor,
        equals('textAccessibilitySettingScaleFactor'),
      );
      expect(
        LocalStorageKeys.textAccessibilitySettingFontWeight,
        equals('textAccessibilitySettingFontWeight'),
      );
      expect(
        LocalStorageKeys.textAccessibilitySettingAlignment,
        equals('textAccessibilitySettingAlignment'),
      );
      expect(
        LocalStorageKeys.themeProfileSetting,
        equals('themeProfileSetting'),
      );
      expect(
        LocalStorageKeys.colorProfileSetting,
        equals('colorProfileSetting'),
      );
      expect(
        LocalStorageKeys.textColorSetting,
        equals('textColorSetting'),
      );
      expect(
        LocalStorageKeys.pagesBackgroundColorSetting,
        equals('pagesBackgroundColorSetting'),
      );
    });

    test('all keys should be unique', () {
      final allKeys = [
        LocalStorageKeys.themeMode,
        LocalStorageKeys.effectsAllowed,
        LocalStorageKeys.isFirstTimeOpened,
        LocalStorageKeys.textAccessibilitySettingWordSpacing,
        LocalStorageKeys.textAccessibilitySettingLineHeight,
        LocalStorageKeys.textAccessibilitySettingLetterSpacing,
        LocalStorageKeys.textAccessibilitySettingScaleFactor,
        LocalStorageKeys.textAccessibilitySettingFontWeight,
        LocalStorageKeys.textAccessibilitySettingAlignment,
        LocalStorageKeys.themeProfileSetting,
        LocalStorageKeys.colorProfileSetting,
        LocalStorageKeys.textColorSetting,
        LocalStorageKeys.pagesBackgroundColorSetting,
      ];

      final uniqueKeys = allKeys.toSet();
      expect(
        allKeys.length,
        equals(uniqueKeys.length),
        reason: 'All storage keys should be unique',
      );
    });
  });

  group('LocalStorageDefaultValues', () {
    test('should define all default values correctly', () {
      expect(LocalStorageDefaultValues.themeModeDefault, equals('system'));
      expect(LocalStorageDefaultValues.effectsAllowedDefault, isTrue);
      expect(LocalStorageDefaultValues.textFontWeightModeDefault, isFalse);
      expect(LocalStorageDefaultValues.lineHeightDefault, equals(-1.0));
      expect(LocalStorageDefaultValues.wordSpacingDefault, equals(-1.0));
      expect(LocalStorageDefaultValues.letterSpacingDefault, equals(-1.0));
      expect(LocalStorageDefaultValues.textScaleFactorDefault, equals(1.0));
      expect(LocalStorageDefaultValues.textAlignmentDefault, equals('none'));
      expect(LocalStorageDefaultValues.themeProfileDefault, equals('none'));
      expect(LocalStorageDefaultValues.colorProfileDefault, equals('normal'));
      expect(LocalStorageDefaultValues.noColorSelected, equals(0));
    });

    test('default numeric values should be within valid ranges', () {
      expect(
        LocalStorageDefaultValues.lineHeightDefault,
        lessThanOrEqualTo(0.0),
        reason: 'Negative values indicate "not set" state',
      );
      expect(
        LocalStorageDefaultValues.wordSpacingDefault,
        lessThanOrEqualTo(0.0),
        reason: 'Negative values indicate "not set" state',
      );
      expect(
        LocalStorageDefaultValues.letterSpacingDefault,
        lessThanOrEqualTo(0.0),
        reason: 'Negative values indicate "not set" state',
      );

      expect(
        LocalStorageDefaultValues.textScaleFactorDefault,
        greaterThanOrEqualTo(1.0),
        reason: 'Text scale factor should be at least 1.0',
      );

      expect(
        LocalStorageDefaultValues.noColorSelected,
        equals(0),
        reason: '0 should represent no color selected',
      );
    });

    test('default string values should match expected formats', () {
      // Check that string default values match expected formats
      final validThemeModes = ['system', 'light', 'dark'];
      expect(
        validThemeModes.contains(LocalStorageDefaultValues.themeModeDefault),
        isTrue,
      );

      final validProfiles = [
        'none',
        'seizure_safe',
        'vision_impaired',
        'adhd_friendly',
      ];
      expect(
        validProfiles.contains(LocalStorageDefaultValues.themeProfileDefault),
        isTrue,
      );

      final validColorProfiles = [
        'normal',
        'protanopia',
        'monochrome',
        'tritanopia',
      ];
      expect(
        validColorProfiles
            .contains(LocalStorageDefaultValues.colorProfileDefault),
        isTrue,
      );

      expect(
        ['none', 'start', 'center', 'end']
            .contains(LocalStorageDefaultValues.textAlignmentDefault),
        isTrue,
      );
    });
  });
}
