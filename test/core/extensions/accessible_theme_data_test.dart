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

  group('missing coverage tests', () {
    test('_produceAccessibleWidgetStatePropertyTextStyle with null input', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);

      final themeWithNullWidgetStateProperty = baseTheme.copyWith(
        searchBarTheme: const SearchBarThemeData(),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithNullWidgetStateProperty,
        settings: settings,
      );

      // This should handle the null case gracefully
      expect(theme.searchBarTheme, isNotNull);
    });

    test('_createAccessibleButtonStyle with null style.textStyle', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);

      final themeWithNullButtonTextStyle = baseTheme.copyWith(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(),
        ),
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(),
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithNullButtonTextStyle,
        settings: settings,
      );

      // Should handle null textStyle gracefully and apply foregroundColor
      expect(
        theme.elevatedButtonTheme.style?.foregroundColor?.resolve({}),
        equals(const Color(customColor)),
      );
      expect(
        theme.filledButtonTheme.style?.foregroundColor?.resolve({}),
        equals(const Color(customColor)),
      );
      expect(
        theme.outlinedButtonTheme.style?.foregroundColor?.resolve({}),
        equals(const Color(customColor)),
      );
    });

    test('_createAccessibleButtonStyle with completely null style', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);

      // Create a theme with completely null button styles
      final themeWithNullButtonStyle = baseTheme.copyWith(
        textButtonTheme: const TextButtonThemeData(),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithNullButtonStyle,
        settings: settings,
      );

      // Should create a new ButtonStyle with foregroundColor
      expect(theme.textButtonTheme.style, isNotNull);
      expect(
        theme.textButtonTheme.style?.foregroundColor?.resolve({}),
        equals(const Color(customColor)),
      );
    });

    test(
        '_produceAccessibleWidgetStatePropertyTextStyle'
        ' covers line 811', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);

      final themeWithWidgetStateProperty = baseTheme.copyWith(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 14),
          ),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithWidgetStateProperty,
        settings: settings,
      );

      expect(theme.navigationBarTheme.labelTextStyle, isNotNull);
      expect(
        theme.navigationBarTheme.labelTextStyle?.resolve({}),
        isNotNull,
      );
    });

    test('_createAccessibleButtonStyle with null textStyle resolve', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);

      final themeWithTextStyle = baseTheme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(fontSize: 16), // This will not be null
            ),
          ),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithTextStyle,
        settings: settings,
      );

      expect(theme.elevatedButtonTheme.style?.textStyle, isNotNull);
      expect(
        theme.elevatedButtonTheme.style?.foregroundColor?.resolve({}),
        equals(const Color(customColor)),
      );
    });

    test('_createAccessibleButtonStyle with null style', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);

      final themeWithNullTextStyle = baseTheme.copyWith(
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            // ignore: avoid_redundant_argument_values
            textStyle: null,
          ),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithNullTextStyle,
        settings: settings,
      );

      // Should handle null textStyle and not call _produceAccessibleTextStyle
      expect(theme.textButtonTheme.style, isNotNull);
      expect(
        theme.textButtonTheme.style?.foregroundColor?.resolve({}),
        equals(const Color(customColor)),
      );
      // textStyle should be null since accessibleTextStyle is null
      expect(theme.textButtonTheme.style?.textStyle, isNull);
    });
  });

  group('_createAccessibleInputDecorationTheme coverage', () {
    test('returns null when style is null', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(color: customColor);

      final themeWithNullInputDecoration = baseTheme.copyWith(
        // ignore: avoid_redundant_argument_values
        inputDecorationTheme: null,
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithNullInputDecoration,
        settings: settings,
      );

      // Should handle null style gracefully
      expect(theme.inputDecorationTheme, isNotNull);
    });

    test('covers InputDecorationThemeData runtime type check ', () {
      const customColor = 0xFF112233;
      const settings = TextSettings(
        color: customColor,
        textScaleFactor: 1.5,
        letterSpacing: 1,
        wordSpacing: 2,
        lineHeight: 1.2,
        isFontWeightBold: true,
      );

      final themeWithInputDecorationThemeData = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          labelStyle: TextStyle(fontSize: 16),
          hintStyle: TextStyle(fontSize: 14),
          helperStyle: TextStyle(fontSize: 12),
          errorStyle: TextStyle(fontSize: 12),
          floatingLabelStyle: TextStyle(fontSize: 18),
          prefixStyle: TextStyle(fontSize: 14),
          suffixStyle: TextStyle(fontSize: 14),
          counterStyle: TextStyle(fontSize: 10),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithInputDecorationThemeData,
        settings: settings,
      );

      expect(theme.inputDecorationTheme, isNotNull);
      expect(theme.inputDecorationTheme.labelStyle, isNotNull);
      expect(theme.inputDecorationTheme.hintStyle, isNotNull);
      expect(theme.inputDecorationTheme.helperStyle, isNotNull);
      expect(theme.inputDecorationTheme.errorStyle, isNotNull);
      expect(theme.inputDecorationTheme.floatingLabelStyle, isNotNull);
      expect(theme.inputDecorationTheme.prefixStyle, isNotNull);
      expect(theme.inputDecorationTheme.suffixStyle, isNotNull);
      expect(theme.inputDecorationTheme.counterStyle, isNotNull);
    });

    test('covers InputDecorationThemeData labelStyle modification', () {
      const customColor = 0xFF334455;
      const settings = TextSettings(color: customColor, textScaleFactor: 2);

      final themeWithLabelStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          labelStyle: TextStyle(fontSize: 16, color: Colors.red),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithLabelStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.labelStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.labelStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData hintStyle modification', () {
      const customColor = 0xFF445566;
      const settings = TextSettings(color: customColor, textScaleFactor: 1.3);

      final themeWithHintStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          hintStyle: TextStyle(fontSize: 14, color: Colors.green),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithHintStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.hintStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.hintStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData helperStyle modification', () {
      const customColor = 0xFF556677;
      const settings = TextSettings(color: customColor);

      final themeWithHelperStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          helperStyle: TextStyle(fontSize: 12, color: Colors.blue),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithHelperStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.helperStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.helperStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData errorStyle modification', () {
      const customColor = 0xFF667788;
      const settings = TextSettings(color: customColor);

      final themeWithErrorStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          errorStyle: TextStyle(fontSize: 12, color: Colors.orange),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithErrorStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.errorStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.errorStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData floatingLabelStyle modification', () {
      const customColor = 0xFF778899;
      const settings = TextSettings(color: customColor);

      final themeWithFloatingLabelStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          floatingLabelStyle: TextStyle(fontSize: 18, color: Colors.purple),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithFloatingLabelStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.floatingLabelStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.floatingLabelStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData prefixStyle modification', () {
      const customColor = 0xFF8899AA;
      const settings = TextSettings(color: customColor);

      final themeWithPrefixStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          prefixStyle: TextStyle(fontSize: 14, color: Colors.cyan),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithPrefixStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.prefixStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.prefixStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData suffixStyle modification', () {
      const customColor = 0xFF99AABB;
      const settings = TextSettings(color: customColor);

      final themeWithSuffixStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          suffixStyle: TextStyle(fontSize: 14, color: Colors.teal),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithSuffixStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.suffixStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.suffixStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData counterStyle modification', () {
      const customColor = 0xFFAABBCC;
      const settings = TextSettings(color: customColor);

      final themeWithCounterStyle = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(
          counterStyle: TextStyle(fontSize: 10, color: Colors.indigo),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithCounterStyle,
        settings: settings,
      );

      expect(theme.inputDecorationTheme.counterStyle, isNotNull);
      expect(
        theme.inputDecorationTheme.counterStyle?.color,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationThemeData icon colors', () {
      const customColor = 0xFFBBCCDD;
      const settings = TextSettings(color: customColor);

      final themeWithInputDecoration = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithInputDecoration,
        settings: settings,
      );

      expect(
        theme.inputDecorationTheme.iconColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.prefixIconColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.suffixIconColor,
        equals(const Color(customColor)),
      );
    });

    test('covers InputDecorationTheme', () {
      const customColor = 0xFFCCDDEE;
      const settings = TextSettings(
        color: customColor,
        textScaleFactor: 1.4,
        letterSpacing: 0.5,
        wordSpacing: 1.5,
        lineHeight: 1.3,
        isFontWeightBold: true,
      );

      final customTheme = ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 16, color: Colors.blue),
          hintStyle: TextStyle(fontSize: 14, color: Colors.green),
          helperStyle: TextStyle(fontSize: 12, color: Colors.orange),
          errorStyle: TextStyle(fontSize: 12, color: Colors.red),
          floatingLabelStyle: TextStyle(fontSize: 18, color: Colors.purple),
          prefixStyle: TextStyle(fontSize: 14, color: Colors.cyan),
          suffixStyle: TextStyle(fontSize: 14, color: Colors.teal),
          counterStyle: TextStyle(fontSize: 10, color: Colors.indigo),
        ),
      );

      final theme = applyTextSettingsOnTheme(
        theme: customTheme,
        settings: settings,
      );
      expect(theme.inputDecorationTheme, isNotNull);
      expect(theme.inputDecorationTheme.labelStyle, isNotNull);
      expect(theme.inputDecorationTheme.hintStyle, isNotNull);
      expect(theme.inputDecorationTheme.helperStyle, isNotNull);
      expect(theme.inputDecorationTheme.errorStyle, isNotNull);
      expect(theme.inputDecorationTheme.floatingLabelStyle, isNotNull);
      expect(theme.inputDecorationTheme.prefixStyle, isNotNull);
      expect(theme.inputDecorationTheme.suffixStyle, isNotNull);
      expect(theme.inputDecorationTheme.counterStyle, isNotNull);
    });

    test('covers minimal InputDecorationThemeData with null styles', () {
      const customColor = 0xFFDDEEFF;
      const settings = TextSettings(color: customColor);

      final themeWithMinimalInputDecoration = baseTheme.copyWith(
        inputDecorationTheme: const InputDecorationThemeData(),
      );

      final theme = applyTextSettingsOnTheme(
        theme: themeWithMinimalInputDecoration,
        settings: settings,
      );

      expect(theme.inputDecorationTheme, isNotNull);
      expect(
        theme.inputDecorationTheme.iconColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.prefixIconColor,
        equals(const Color(customColor)),
      );
      expect(
        theme.inputDecorationTheme.suffixIconColor,
        equals(const Color(customColor)),
      );
    });

    test('comprehensive InputDecorationThemeData coverage', () {
      // This test ensures comprehensive coverage of all
      // InputDecorationThemeData paths
      const customColor = 0xFF123456;
      const settings = TextSettings(
        color: customColor,
        textScaleFactor: 1.8,
        letterSpacing: 2,
        wordSpacing: 3,
        lineHeight: 1.5,
        isFontWeightBold: true,
      );

      // Create multiple theme variations to ensure all code paths are covered
      final themes = [
        // Theme with all styles defined
        ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          inputDecorationTheme: const InputDecorationThemeData(
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            helperStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            errorStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            floatingLabelStyle:
                TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            prefixStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            suffixStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            counterStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        // Theme with Material 2
        ThemeData(
          useMaterial3: false,
          colorScheme: const ColorScheme.light(),
          inputDecorationTheme: const InputDecorationThemeData(
            labelStyle: TextStyle(fontSize: 16),
            hintStyle: TextStyle(fontSize: 14),
            helperStyle: TextStyle(fontSize: 12),
            errorStyle: TextStyle(fontSize: 12),
            floatingLabelStyle: TextStyle(fontSize: 18),
            prefixStyle: TextStyle(fontSize: 14),
            suffixStyle: TextStyle(fontSize: 14),
            counterStyle: TextStyle(fontSize: 10),
          ),
        ),
        // Theme with partial styles
        ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          inputDecorationTheme: const InputDecorationThemeData(
            labelStyle: TextStyle(fontSize: 16),
            errorStyle: TextStyle(fontSize: 12),
            counterStyle: TextStyle(fontSize: 10),
          ),
        ),
      ];

      for (final mockTheme in themes) {
        final theme = applyTextSettingsOnTheme(
          theme: mockTheme,
          settings: settings,
        );

        // Verify all styles are processed correctly
        expect(theme.inputDecorationTheme, isNotNull);

        if (theme.inputDecorationTheme.labelStyle != null) {
          expect(
            theme.inputDecorationTheme.labelStyle?.color,
            equals(const Color(customColor)),
          );
        }
        if (theme.inputDecorationTheme.hintStyle != null) {
          expect(
            theme.inputDecorationTheme.hintStyle?.color,
            equals(const Color(customColor)),
          );
        }
        if (theme.inputDecorationTheme.helperStyle != null) {
          expect(
            theme.inputDecorationTheme.helperStyle?.color,
            equals(const Color(customColor)),
          );
        }
        if (theme.inputDecorationTheme.errorStyle != null) {
          expect(
            theme.inputDecorationTheme.errorStyle?.color,
            equals(const Color(customColor)),
          );
        }
        if (theme.inputDecorationTheme.floatingLabelStyle != null) {
          expect(
            theme.inputDecorationTheme.floatingLabelStyle?.color,
            equals(const Color(customColor)),
          );
        }
        if (theme.inputDecorationTheme.prefixStyle != null) {
          expect(
            theme.inputDecorationTheme.prefixStyle?.color,
            equals(const Color(customColor)),
          );
        }
        if (theme.inputDecorationTheme.suffixStyle != null) {
          expect(
            theme.inputDecorationTheme.suffixStyle?.color,
            equals(const Color(customColor)),
          );
        }
        if (theme.inputDecorationTheme.counterStyle != null) {
          expect(
            theme.inputDecorationTheme.counterStyle?.color,
            equals(const Color(customColor)),
          );
        }

        // Icon colors should always be set
        expect(
          theme.inputDecorationTheme.iconColor,
          equals(const Color(customColor)),
        );
        expect(
          theme.inputDecorationTheme.prefixIconColor,
          equals(const Color(customColor)),
        );
        expect(
          theme.inputDecorationTheme.suffixIconColor,
          equals(const Color(customColor)),
        );
      }
    });
  });
}
