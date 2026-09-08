import 'package:accessibility_material/src/ui/theme/accessible_page_transitions_theme.dart';
import 'package:accessibility_material/src/ui/theme/accessible_theme_data.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

ThemeData base() => ThemeData(fontFamily: 'AppFont');

AccessibleThemeData themed(
  AccessibilitySettings settings, {
  ThemeData? theme,
  AccessibleFont? font,
  bool forceHighContrast = false,
}) => AccessibleThemeData.from(
  themeData: theme ?? base(),
  settings: settings,
  font: font,
  forceHighContrast: forceHighContrast,
);

void main() {
  group('AccessibleThemeData.from', () {
    test('normalises the text theme and installs the transitions only', () {
      final theme = themed(AccessibilitySettings.defaults);
      expect(theme.textTheme.bodyMedium?.fontSize, 14);
      expect(theme.textTheme.bodyMedium?.inherit, isTrue);
      expect(theme.primaryTextTheme.bodyMedium?.inherit, isTrue);
      expect(theme.pageTransitionsTheme, isA<AccessiblePageTransitionsTheme>());
      expect(theme.colorScheme.primary, base().colorScheme.primary);
      expect(theme.scaffoldBackgroundColor, base().scaffoldBackgroundColor);
    });

    test('keeps the app page transition builders', () {
      final custom = base().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()},
        ),
      );
      final theme = themed(AccessibilitySettings.defaults, theme: custom);
      expect(
        theme.pageTransitionsTheme.builders[TargetPlatform.android],
        isA<ZoomPageTransitionsBuilder>(),
      );
      final again = themed(AccessibilitySettings.defaults, theme: theme);
      expect(again.pageTransitionsTheme, same(theme.pageTransitionsTheme));
    });

    test('scales every text theme style', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
      );
      expect(theme.textTheme.bodyMedium?.fontSize, 28);
      expect(theme.textTheme.displayLarge?.fontSize, 114);
      expect(theme.primaryTextTheme.labelSmall?.fontSize, 22);
    });

    test('applies spacing, height, weight and colour', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(
            lineHeight: 1.8,
            letterSpacing: 1,
            wordSpacing: 2,
            isBold: true,
            color: 0xFF112233,
          ),
        ),
      );
      final style = theme.textTheme.bodyMedium!;
      expect(style.height, 1.8);
      expect(style.letterSpacing, 1);
      expect(style.wordSpacing, 2);
      expect(style.fontWeight, FontWeight.bold);
      expect(style.color, const Color(0xFF112233));
      expect(theme.appBarTheme.foregroundColor, const Color(0xFF112233));
      expect(theme.listTileTheme.textColor, const Color(0xFF112233));
      expect(
        theme.elevatedButtonTheme.style?.foregroundColor?.resolve({}),
        const Color(0xFF112233),
      );
    });

    test(
      'qualifies the accessible font and keeps the app font as fallback',
      () {
        final theme = themed(
          const AccessibilitySettings(
            textSettings: TextSettings(fontFamily: 'Andika'),
          ),
          font: andika,
        );
        final style = theme.textTheme.bodyMedium!;
        expect(style.fontFamily, 'packages/accessibility_font_andika/Andika');
        expect(style.fontFamilyFallback, contains('AppFont'));
      },
    );

    test('scales component text styles that the app defines', () {
      final app = base();
      final custom = app.copyWith(
        appBarTheme: app.appBarTheme.copyWith(
          titleTextStyle: const TextStyle(fontSize: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 10),
          ),
        ),
        inputDecorationTheme: app.inputDecorationTheme.copyWith(
          labelStyle: const TextStyle(fontSize: 12),
          errorStyle: const TextStyle(fontSize: 12, color: Color(0xFFFF0000)),
        ),
      );
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2, color: 0xFF0000FF),
        ),
        theme: custom,
      );
      expect(theme.appBarTheme.titleTextStyle?.fontSize, 40);
      expect(
        theme.elevatedButtonTheme.style?.textStyle?.resolve({})?.fontSize,
        20,
      );
      expect(theme.inputDecorationTheme.labelStyle?.fontSize, 24);
      expect(
        theme.inputDecorationTheme.labelStyle?.color,
        const Color(0xFF0000FF),
      );
      expect(theme.inputDecorationTheme.errorStyle?.fontSize, 24);
      expect(
        theme.inputDecorationTheme.errorStyle?.color,
        const Color(0xFFFF0000),
      );
    });

    test('leaves undefined state styles undefined and scales defined ones', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
      );
      expect(theme.navigationBarTheme.labelTextStyle, isNull);

      final custom = base().copyWith(
        navigationBarTheme: base().navigationBarTheme.copyWith(
          labelTextStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 10)),
        ),
      );
      final customThemed = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
        theme: custom,
      );
      expect(
        customThemed.navigationBarTheme.labelTextStyle?.resolve({})?.fontSize,
        20,
      );
    });

    test('leaves the colour scheme alone for the normal profile', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(backgroundColor: 0xFFFFFFF0),
        ),
      );
      expect(theme.colorScheme.primary, base().colorScheme.primary);
      expect(theme.scaffoldBackgroundColor, const Color(0xFFFFFFF0));
      expect(theme.dialogTheme.backgroundColor, const Color(0xFFFFFFF0));
    });

    test('applies the colour profile to the whole scheme', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      for (final color in [
        theme.colorScheme.primary,
        theme.colorScheme.secondary,
        theme.colorScheme.tertiary,
        theme.colorScheme.error,
        theme.colorScheme.surfaceTint,
      ]) {
        expect(HSLColor.fromColor(color).saturation, 0, reason: '$color');
      }
    });

    test('forces the high-contrast profile on request', () {
      final normal = themed(AccessibilitySettings.defaults);
      final forced = themed(
        AccessibilitySettings.defaults,
        forceHighContrast: true,
      );
      final expected = normal.colorScheme.primary.withColorProfile(
        ColorProfile.fromLevel(ColorProfileLevel.highContrast),
      );
      expect(forced.colorScheme.primary, expected);
      expect(forced.colorScheme.primary, isNot(normal.colorScheme.primary));
    });

    test('composes the forced high contrast with the user profile', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
        forceHighContrast: true,
      );
      expect(HSLColor.fromColor(theme.colorScheme.primary).saturation, 0);
      expect(
        theme.colorScheme.primary,
        base().colorScheme.primary
            .withColorProfile(
              ColorProfile.fromLevel(ColorProfileLevel.monochrome),
            )
            .withColorProfile(
              ColorProfile.fromLevel(ColorProfileLevel.highContrast),
            ),
      );
    });

    test('is a ThemeData', () {
      final ThemeData theme = themed(
        AccessibilitySettingsSamples.everythingSet,
      );
      expect(theme.useMaterial3, isTrue);
    });
  });
}
