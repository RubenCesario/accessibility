import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/settings/accessibility_settings_configuration.dart';
import 'package:flutter_accessibility/src/ui/settings/accessibility_settings_style.dart';
import 'package:flutter_test/flutter_test.dart';

const _red = ColorSwatch<int>(0xFFFF0000, {500: Color(0xFFFF0000)});
const _blue = ColorSwatch<int>(0xFF0000FF, {500: Color(0xFF0000FF)});

void main() {
  group('AccessibilitySettingsConfiguration', () {
    test('defaults show everything and use the panel palette', () {
      const configuration = AccessibilitySettingsConfiguration();
      expect(configuration.showThemeSettingsGroup, isTrue);
      expect(configuration.showThemeProfileSeizureSafe, isTrue);
      expect(configuration.showThemeProfileVisionImpaired, isTrue);
      expect(configuration.showThemeProfileAdhdFriendly, isTrue);
      expect(configuration.showThemeModeSetting, isTrue);
      expect(configuration.showEffectsSetting, isTrue);
      expect(configuration.showColorSettingsGroup, isTrue);
      expect(configuration.showColorProfileSetting, isTrue);
      expect(configuration.showBackgroundColorSetting, isTrue);
      expect(configuration.showTextColorSetting, isTrue);
      expect(configuration.showTextSettingsGroup, isTrue);
      expect(configuration.showTextAlignSetting, isTrue);
      expect(configuration.showBoldSetting, isTrue);
      expect(configuration.showFontSetting, isTrue);
      expect(configuration.showLetterSpacingSetting, isTrue);
      expect(configuration.showLineHeightSetting, isTrue);
      expect(configuration.showTextScaleFactorSetting, isTrue);
      expect(configuration.showWordSpacingSetting, isTrue);
      expect(configuration.textColorCandidates, isNull);
      expect(configuration.textColorAllowPickingShades, isTrue);
      expect(configuration.backgroundColorCandidates, isNull);
      expect(configuration.backgroundColorAllowPickingShades, isTrue);
      expect(configuration.onRestoreSettings, isNull);
    });

    test('is a value type comparing candidate lists element-wise', () {
      const a = AccessibilitySettingsConfiguration(
        showFontSetting: false,
        textColorCandidates: [_red, _blue],
        backgroundColorCandidates: [_blue],
      );
      // Built at runtime so it is a distinct instance, not the canonical
      // const one; the comparison must go through listEquals.
      final b = AccessibilitySettingsConfiguration(
        showFontSetting: false,
        textColorCandidates: List.of([_red, _blue]),
        backgroundColorCandidates: List.of([_blue]),
      );
      const c = AccessibilitySettingsConfiguration(
        showFontSetting: false,
        textColorCandidates: [_blue, _red],
        backgroundColorCandidates: [_blue],
      );
      const d = AccessibilitySettingsConfiguration(
        showFontSetting: false,
        textColorCandidates: [_red, _blue],
        backgroundColorCandidates: [_red],
      );
      expect(identical(a, b), isFalse);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(c));
      expect(a, isNot(d));
      expect(a, isNot(const AccessibilitySettingsConfiguration()));
      expect(a.toString(), contains('showFontSetting: false'));
    });

    test('keeps the restore callback', () async {
      var called = false;
      final configuration = AccessibilitySettingsConfiguration(
        onRestoreSettings: () => called = true,
      );
      await configuration.onRestoreSettings!();
      expect(called, isTrue);
    });
  });

  test('AccessibilitySettingsStyle has the two panel styles', () {
    expect(AccessibilitySettingsStyle.values, [
      AccessibilitySettingsStyle.standard,
      AccessibilitySettingsStyle.cards,
    ]);
  });
}
