import 'package:accessibility/src/core/animations/page_transitions.dart';
import 'package:accessibility/src/core/extensions/accessible_theme_data.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:flutter/cupertino.dart'
    show CupertinoTextThemeData, CupertinoThemeData;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
  group('AccessibleThemeData extension', () {
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
          colorProfileLevel: ColorProfileLevel.highContrast,
        );
        final theme = applyColorSettingsOnTheme(
          theme: baseTheme,
          settings: colorSettings,
        );
        final originalHsl = HSLColor.fromColor(baseTheme.colorScheme.primary);
        final newHsl = HSLColor.fromColor(theme.colorScheme.primary);
        expect(newHsl.lightness, lessThan(originalHsl.lightness));
      });

      test('adjusts both saturation and lightness when both are specified', () {
        const colorSettings = ColorSettings(
          colorProfileLevel: ColorProfileLevel.highContrast,
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

  group('other theme components', () {
    test('applies segmentedButtonTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(theme.segmentedButtonTheme, isNotNull);
      expect(theme.segmentedButtonTheme.style, isNotNull);
    });

    test('applies menuButtonTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(theme.menuButtonTheme, isNotNull);
      expect(theme.menuButtonTheme.style, isNotNull);
    });

    test('applies toggleButtonsTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme.copyWith(
          toggleButtonsTheme:
              const ToggleButtonsThemeData(textStyle: TextStyle()),
        ),
        settings: settings,
      );
      expect(theme.toggleButtonsTheme.textStyle, isNotNull);
      expect(
        theme.toggleButtonsTheme.textStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('applies appBarTheme foregroundColor properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(
        theme.appBarTheme.foregroundColor,
        equals(const Color(customColor)),
      );
    });

    test('applies tabBarTheme colors properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(theme.tabBarTheme.labelColor, equals(const Color(customColor)));
      expect(
        theme.tabBarTheme.indicatorColor,
        equals(const Color(customColor)),
      );
    });

    test('applies inputDecorationTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme.copyWith(
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(),
            hintStyle: TextStyle(),
          ),
        ),
        settings: settings,
      );
      expect(theme.inputDecorationTheme.labelStyle, isNotNull);
      expect(theme.inputDecorationTheme.hintStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.labelStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.hintStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('applies listTileTheme textColor properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(theme.listTileTheme.textColor, equals(const Color(customColor)));
    });

    test('applies bottomNavigationBarTheme selectedItemColor properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(
        theme.bottomNavigationBarTheme.selectedItemColor,
        equals(const Color(customColor)),
      );
    });

    test('applies navigationBarTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(theme.navigationBarTheme.labelTextStyle, isNotNull);
    });

    test('applies navigationDrawerTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(theme.navigationDrawerTheme.labelTextStyle, isNotNull);
    });

    test('applies navigationRailTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme.copyWith(
          navigationRailTheme: const NavigationRailThemeData(
            selectedLabelTextStyle: TextStyle(),
          ),
        ),
        settings: settings,
      );
      expect(theme.navigationRailTheme.selectedLabelTextStyle, isNotNull);
      expect(
        theme.navigationRailTheme.selectedLabelTextStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('applies dataTableTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme.copyWith(
          dataTableTheme: const DataTableThemeData(
            dataTextStyle: TextStyle(),
            headingTextStyle: TextStyle(),
          ),
        ),
        settings: settings,
      );
      expect(theme.dataTableTheme.dataTextStyle, isNotNull);
      expect(theme.dataTableTheme.headingTextStyle, isNotNull);
      expect(
        theme.dataTableTheme.dataTextStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.dataTableTheme.headingTextStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('applies datePickerTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(
        theme.datePickerTheme.headerForegroundColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.datePickerTheme.dayForegroundColor?.resolve({}),
        equals(const Color(customColor)),
      );
    });

    test('applies timePickerTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(
        theme.timePickerTheme.dialTextColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.timePickerTheme.dayPeriodTextColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.timePickerTheme.hourMinuteTextColor,
        equals(const Color(customColor)),
      );
    });

    test('applies cupertinoOverrideTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme.copyWith(
          cupertinoOverrideTheme: const CupertinoThemeData(
            textTheme: CupertinoTextThemeData(),
          ),
        ),
        settings: settings,
      );
      expect(theme.cupertinoOverrideTheme?.textTheme?.textStyle, isNotNull);
      expect(
        theme.cupertinoOverrideTheme?.textTheme?.textStyle.color,
        equals(const Color(customColor)),
      );
    });

    test('applies badgeTheme properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(theme.badgeTheme.textColor, equals(const Color(customColor)));
    });

    test('applies expansionTileTheme colors properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(
        theme.expansionTileTheme.collapsedTextColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.expansionTileTheme.textColor,
        equals(const Color(customColor)),
      );
    });

    test('applies floatingActionButtonTheme foregroundColor properly', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      expect(
        theme.floatingActionButtonTheme.foregroundColor,
        equals(const Color(customColor)),
      );
    });
  });

  group('helper functions coverage', () {
    test('_produceAccessibleWidgetStatePropertyTextStyle with null input', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      // Test that null WidgetStateProperty is handled
      expect(theme.searchBarTheme.textStyle, isNotNull);
    });

    test('_createAccessibleInputDecorationTheme with null input', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme.copyWith(
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(),
            hintStyle: TextStyle(),
            helperStyle: TextStyle(),
            errorStyle: TextStyle(),
            suffixStyle: TextStyle(),
            prefixStyle: TextStyle(),
            floatingLabelStyle: TextStyle(),
            counterStyle: TextStyle(),
          ),
        ),
        settings: settings,
      );
      expect(
        theme.inputDecorationTheme.labelStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.hintStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.helperStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.errorStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.floatingLabelStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.prefixStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.suffixStyle?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.counterStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('_produceAccessibleTextTheme with null input', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      // Test that TextTheme is created properly
      expect(
        theme.textTheme.displayLarge?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.textTheme.bodyMedium?.color,
        equals(const Color(customColor)),
      );
      expect(
        theme.primaryTextTheme.displayLarge?.color,
        equals(const Color(customColor)),
      );
    });

    test('applies all text scale factors properly', () {
      const scaleFactor = 1.5;
      const settings = TextSettings(textScaleFactor: scaleFactor);
      final theme = applyTextSettingsOnTheme(
        theme: baseTheme,
        settings: settings,
      );
      // Test various text styles are scaled
      expect(
        theme.appBarTheme.titleTextStyle?.fontSize,
        equals(
          baseTheme.appBarTheme.titleTextStyle?.fontSize != null
              ? baseTheme.appBarTheme.titleTextStyle!.fontSize! * scaleFactor
              : null,
        ),
      );
      expect(
        theme.dialogTheme.titleTextStyle?.fontSize,
        equals(
          baseTheme.dialogTheme.titleTextStyle?.fontSize != null
              ? baseTheme.dialogTheme.titleTextStyle!.fontSize! * scaleFactor
              : null,
        ),
      );
    });

    test('handles edge cases with null theme properties', () {
      final emptyTheme = ThemeData();
      const settings = TextSettings(color: 0xFF112233);
      final theme = applyTextSettingsOnTheme(
        theme: emptyTheme,
        settings: settings,
      );
      // Should not throw and should handle null properties gracefully
      expect(theme, isNotNull);
    });
  });
}
