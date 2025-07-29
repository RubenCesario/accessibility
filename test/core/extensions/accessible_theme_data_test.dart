import 'package:accessibility/src/core/animations/page_transitions.dart';
import 'package:accessibility/src/core/extensions/accessible_theme_data.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibleThemeData extension', () {
    late ThemeData baseTheme;
    late TextSettings defaultTextSettings;
    late ColorSettings defaultColorSettings;

    setUp(() {
      baseTheme = ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: Typography.englishLike2021,
      );
      defaultTextSettings = TextSettings.defaultSettings;
      defaultColorSettings = ColorSettings.defaultSettings;
    });

    test('from factory creates an AccessibleThemeData instance', () {
      final accessibleThemeData = AccessibleThemeData.from(
        themeData: baseTheme,
        settings: defaultTextSettings,
        colorSettings: defaultColorSettings,
        effectsEnabled: true,
      );
      expect(accessibleThemeData, isA<ThemeData>());
      expect(
        accessibleThemeData.pageTransitionsTheme,
        isA<DependsOnEffectsSettingPageTransitionsTheme>(),
      );
    });

    group('applyTextSettingsOnTheme', () {
      test('returns original theme when default settings are provided', () {
        // When
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: TextSettings.defaultSettings,
        );

        // Then
        expect(theme, equals(baseTheme));
      });

      test('applies text scale factor properly', () {
        const scaleFactor = 1.5;
        const settings = TextSettings(
          textScaleFactor: scaleFactor,
        );
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        final originalFontSize = baseTheme.textTheme.displayLarge!.fontSize!;
        final newFontSize = theme.textTheme.displayLarge!.fontSize!;
        expect(newFontSize, equals(originalFontSize * scaleFactor));
      });

      test('applies word spacing properly', () {
        const customWordSpacing = 4.0;
        const settings = TextSettings(
          wordSpacing: customWordSpacing,
        );
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        expect(
          theme.textTheme.displayLarge!.wordSpacing,
          equals(customWordSpacing),
        );
        expect(
          theme.textTheme.bodyLarge!.wordSpacing,
          equals(customWordSpacing),
        );
      });

      test('applies letter spacing properly', () {
        const customLetterSpacing = 1.5;
        const settings = TextSettings(
          letterSpacing: customLetterSpacing,
        );
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        expect(
          theme.textTheme.displayLarge!.letterSpacing,
          equals(customLetterSpacing),
        );
        expect(
          theme.textTheme.bodyLarge!.letterSpacing,
          equals(customLetterSpacing),
        );
      });

      test('applies line height properly', () {
        const customLineHeight = 1.8;
        const settings = TextSettings(
          lineHeight: customLineHeight,
        );
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        expect(theme.textTheme.displayLarge!.height, equals(customLineHeight));
        expect(theme.textTheme.bodyLarge!.height, equals(customLineHeight));
      });

      test('applies font weight properly when bold', () {
        const settings = TextSettings(
          isFontWeightBold: true,
        );
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        expect(
          theme.textTheme.displayLarge!.fontWeight,
          equals(FontWeight.bold),
        );
        expect(theme.textTheme.bodyLarge!.fontWeight, equals(FontWeight.bold));
      });

      test('applies text color properly', () {
        const customColor = 0xFF112233;
        const settings = TextSettings(
          color: customColor,
        );
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        expect(
          theme.textTheme.displayLarge!.color,
          equals(const Color(customColor)),
        );
        expect(
          theme.textTheme.bodyLarge!.color,
          equals(const Color(customColor)),
        );
      });
    });

    group('applyColorSettingsOnTheme', () {
      test(
          'returns original theme when profile'
          ' has null saturation and lightness', () {
        const colorSettings = ColorSettings.defaultSettings;
        final theme = applyColorSettingsOnTheme(
          theme: baseTheme,
          settings: colorSettings,
        );
        expect(
          theme.colorScheme.primary,
          equals(baseTheme.colorScheme.primary),
        );
        expect(
          theme.colorScheme.surface,
          equals(baseTheme.colorScheme.surface),
        );
      });

      test('adjusts color saturation based on profile', () {
        const colorSettings = ColorSettings(
          colorProfileLevel: ColorProfileLevel.highSaturation,
        );
        final theme = applyColorSettingsOnTheme(
          theme: baseTheme,
          settings: colorSettings,
        );
        final originalHsl = HSLColor.fromColor(baseTheme.colorScheme.primary);
        final newHsl = HSLColor.fromColor(theme.colorScheme.primary);
        expect(newHsl.saturation, greaterThan(originalHsl.saturation));
      });

      test('adjusts color lightness based on profile', () {
        const colorSettings = ColorSettings(
          colorProfileLevel: ColorProfileLevel.monochrome,
        );
        final theme = applyColorSettingsOnTheme(
          theme: baseTheme,
          settings: colorSettings,
        );
        final originalHsl = HSLColor.fromColor(baseTheme.colorScheme.primary);
        final newHsl = HSLColor.fromColor(theme.colorScheme.primary);
        expect(newHsl.lightness, greaterThan(originalHsl.lightness));
      });

      test('adjusts both saturation and lightness when both are specified', () {
        const colorSettings = ColorSettings(
          colorProfileLevel: ColorProfileLevel.monochrome,
        );
        final theme = applyColorSettingsOnTheme(
          theme: baseTheme,
          settings: colorSettings,
        );
        final newHsl = HSLColor.fromColor(theme.colorScheme.primary);
        expect(
          newHsl.saturation,
          isNot(
            equals(
              HSLColor.fromColor(baseTheme.colorScheme.primary).saturation,
            ),
          ),
        );
        expect(
          newHsl.lightness,
          isNot(
            equals(
              HSLColor.fromColor(baseTheme.colorScheme.primary).lightness,
            ),
          ),
        );
      });
    });

    group('applyEffectsSettingOnTheme', () {
      test('applies DependsOnEffectsSettingPageTransitionsTheme when enabled',
          () {
        final theme = applyEffectsSettingOnTheme(
          theme: baseTheme,
          effectsEnabled: true,
        );
        expect(
          theme.pageTransitionsTheme,
          isA<DependsOnEffectsSettingPageTransitionsTheme>(),
        );
      });

      test(
          'does not modify theme if it already '
          'has DependsOnEffectsSettingPageTransitionsTheme', () {
        final themeWithEffects = baseTheme.copyWith(
          pageTransitionsTheme:
              const DependsOnEffectsSettingPageTransitionsTheme(),
        );
        final theme = applyEffectsSettingOnTheme(
          theme: themeWithEffects,
          effectsEnabled: true,
        );
        expect(identical(theme, themeWithEffects), isTrue);
      });
    });

    group('_textScaler function through applyTextSettingsOnTheme', () {
      test('returns TextScaler.noScaling when textScaleFactor is null', () {
        const settings = TextSettings.defaultSettings;
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        expect(
          theme.textTheme.displayLarge!.fontSize,
          equals(baseTheme.textTheme.displayLarge!.fontSize),
        );
      });

      test('returns TextScaler.noScaling when textScaleFactor <= 1', () {
        const settings = TextSettings.defaultSettings;
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        expect(
          theme.textTheme.displayLarge!.fontSize,
          equals(baseTheme.textTheme.displayLarge!.fontSize),
        );
      });

      test('returns TextScaler.linear when textScaleFactor > 1', () {
        const scaleFactor = 1.5;
        const settings = TextSettings(textScaleFactor: scaleFactor);
        final theme = applyTextSettingsOnTheme(
          theme: baseTheme,
          settings: settings,
        );
        final originalSize = baseTheme.textTheme.displayLarge!.fontSize!;
        expect(
          theme.textTheme.displayLarge!.fontSize,
          equals(originalSize * scaleFactor),
        );
      });
    });
  });
}
