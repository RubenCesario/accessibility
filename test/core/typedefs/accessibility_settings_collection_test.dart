import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilitySettingsCollection', () {
    test('should be able to create a valid instance', () {
      const themeMode = ThemeMode.light;
      const effectsAllowed = true;
      const textSettings = TextSettings.defaultSettings;
      const colorSettings = ColorSettings.defaultSettings;

      const settings = (
        themeMode: themeMode,
        effectsAllowed: effectsAllowed,
        textSettings: textSettings,
        colorSettings: colorSettings,
      );

      expect(settings.themeMode, equals(themeMode));
      expect(settings.effectsAllowed, equals(effectsAllowed));
      expect(settings.textSettings, equals(textSettings));
      expect(settings.colorSettings, equals(colorSettings));
    });

    test('should match equality based on values', () {
      const settings1 = (
        themeMode: ThemeMode.light,
        effectsAllowed: true,
        textSettings: TextSettings.defaultSettings,
        colorSettings: ColorSettings.defaultSettings,
      );

      const settings2 = (
        themeMode: ThemeMode.light,
        effectsAllowed: true,
        textSettings: TextSettings.defaultSettings,
        colorSettings: ColorSettings.defaultSettings,
      );

      expect(settings1, equals(settings2));
    });

    test('should not match equality when values differ', () {
      const settings1 = (
        themeMode: ThemeMode.light,
        effectsAllowed: true,
        textSettings: TextSettings.defaultSettings,
        colorSettings: ColorSettings.defaultSettings,
      );

      const settings2 = (
        themeMode: ThemeMode.dark,
        effectsAllowed: true,
        textSettings: TextSettings.defaultSettings,
        colorSettings: ColorSettings.defaultSettings,
      );

      expect(settings1, isNot(equals(settings2)));
    });
  });

  group('a11yDefaultSettings', () {
    test('should have ThemeMode.system as default themeMode', () {
      expect(a11yDefaultSettings.themeMode, equals(ThemeMode.system));
    });

    test('should have effectsAllowed set to false', () {
      expect(a11yDefaultSettings.effectsAllowed, isFalse);
    });

    test('should have TextSettings.defaultSettings as textSettings', () {
      expect(
        a11yDefaultSettings.textSettings,
        equals(TextSettings.defaultSettings),
      );
    });

    test('should have ColorSettings.defaultSettings as colorSettings', () {
      expect(
        a11yDefaultSettings.colorSettings,
        equals(ColorSettings.defaultSettings),
      );
    });

    test('should be a const value', () {
      const settings1 = a11yDefaultSettings;
      const settings2 = a11yDefaultSettings;
      expect(identical(settings1, settings2), isTrue);
    });

    test('should match manually constructed default settings', () {
      const manualDefault = (
        themeMode: ThemeMode.system,
        effectsAllowed: false,
        textSettings: TextSettings.defaultSettings,
        colorSettings: ColorSettings.defaultSettings,
      );

      expect(a11yDefaultSettings, equals(manualDefault));
    });
  });
}
