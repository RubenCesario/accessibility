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
}
