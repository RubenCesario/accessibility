import 'package:accessibility_cupertino/src/ui/theme/accessible_cupertino_theme_data.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

const base = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(fontFamily: 'AppFont', fontSize: 17),
  ),
);

AccessibleCupertinoThemeData themed(
  AccessibilitySettings settings, {
  CupertinoThemeData theme = base,
  AccessibleFont? font,
  bool highContrast = false,
}) => AccessibleCupertinoThemeData.from(
  themeData: theme,
  settings: settings,
  font: font,
  highContrast: highContrast,
);

final highContrastProfile = ColorProfile.fromLevel(
  ColorProfileLevel.highContrast,
);
final monochrome = ColorProfile.fromLevel(ColorProfileLevel.monochrome);

void main() {
  group('AccessibleCupertinoThemeData.from', () {
    test('leaves a default theme alone for default settings', () {
      final theme = themed(AccessibilitySettings.defaults);
      expect(theme.brightness, isNull);
      expect(theme.primaryColor, CupertinoColors.systemBlue);
      expect(theme.scaffoldBackgroundColor, CupertinoColors.systemBackground);
      expect(theme.textTheme.textStyle.fontSize, 17);
      expect(theme.textTheme.textStyle.fontFamily, 'AppFont');
    });

    test('maps the theme mode to the brightness', () {
      expect(
        themed(
          const AccessibilitySettings(themeMode: AccessibilityThemeMode.dark),
        ).brightness,
        Brightness.dark,
      );
      expect(
        themed(
          const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
        ).brightness,
        Brightness.light,
      );
      const dark = CupertinoThemeData(brightness: Brightness.dark);
      expect(
        themed(AccessibilitySettings.defaults, theme: dark).brightness,
        Brightness.dark,
      );
      expect(
        themed(
          const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
          theme: dark,
        ).brightness,
        Brightness.light,
      );
    });

    test('scales every text style', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
      );
      final text = theme.textTheme;
      expect(text.textStyle.fontSize, 34);
      expect(text.actionTextStyle.fontSize, 34);
      expect(text.actionSmallTextStyle.fontSize, 30);
      expect(text.tabLabelTextStyle.fontSize, 20);
      expect(text.navTitleTextStyle.fontSize, 34);
      expect(text.navLargeTitleTextStyle.fontSize, 68);
      expect(text.navActionTextStyle.fontSize, 34);
      expect(text.pickerTextStyle.fontSize, 42);
      expect(text.dateTimePickerTextStyle.fontSize, 42);
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
      final style = theme.textTheme.textStyle;
      expect(style.height, 1.8);
      expect(style.letterSpacing, 1);
      expect(style.wordSpacing, 2);
      expect(style.fontWeight, FontWeight.bold);
      expect(style.color, const Color(0xFF112233));
      expect(theme.textTheme.navTitleTextStyle.color, const Color(0xFF112233));
      expect(theme.textTheme.actionTextStyle.color, const Color(0xFF112233));
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
        final style = theme.textTheme.textStyle;
        expect(style.fontFamily, 'packages/accessibility_font_andika/Andika');
        expect(style.fontFamilyFallback, contains('AppFont'));
        expect(
          theme.textTheme.navLargeTitleTextStyle.fontFamily,
          'packages/accessibility_font_andika/Andika',
        );
      },
    );

    test('keeps the dynamic label colour when no text colour is set', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 1.5),
        ),
        theme: const CupertinoThemeData(),
      );
      expect(theme.textTheme.textStyle.color, CupertinoColors.label);
      expect(theme.textTheme.textStyle.fontSize, 25.5);
    });

    test('sets the page background and leaves the rest for normal', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(backgroundColor: 0xFFFFFFF0),
        ),
      );
      expect(theme.scaffoldBackgroundColor, const Color(0xFFFFFFF0));
      expect(theme.primaryColor, CupertinoColors.systemBlue);
      expect(theme.barBackgroundColor, base.barBackgroundColor);
    });

    test('keeps the chosen background exact under a profile', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            backgroundColor: 0xFF2196F3,
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      expect(theme.scaffoldBackgroundColor, const Color(0xFF2196F3));
      expect(HSLColor.fromColor(theme.primaryColor).saturation, 0);
    });

    test('applies the profile to every variant of a dynamic colour', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      final primary = theme.primaryColor;
      expect(primary, isA<CupertinoDynamicColor>());
      final dynamic = primary as CupertinoDynamicColor;
      const source = CupertinoColors.systemBlue;
      expect(dynamic.color, source.color.withColorProfile(monochrome));
      expect(dynamic.darkColor, source.darkColor.withColorProfile(monochrome));
      expect(
        dynamic.highContrastColor,
        source.highContrastColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.darkHighContrastColor,
        source.darkHighContrastColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.elevatedColor,
        source.elevatedColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.darkElevatedColor,
        source.darkElevatedColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.highContrastElevatedColor,
        source.highContrastElevatedColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.darkHighContrastElevatedColor,
        source.darkHighContrastElevatedColor.withColorProfile(monochrome),
      );
      for (final color in [
        theme.primaryContrastingColor,
        theme.barBackgroundColor,
        theme.scaffoldBackgroundColor,
        theme.selectionHandleColor,
      ]) {
        expect(HSLColor.fromColor(color).saturation, 0, reason: '$color');
      }
    });

    test('applies the profile to plain colours', () {
      const custom = CupertinoThemeData(primaryColor: Color(0xFF2196F3));
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
        theme: custom,
      );
      expect(theme.primaryColor, isNot(isA<CupertinoDynamicColor>()));
      expect(
        theme.primaryColor,
        const Color(0xFF2196F3).withColorProfile(monochrome),
      );
    });

    test('forces the high-contrast profile on request', () {
      final normal = themed(AccessibilitySettings.defaults);
      final forced = themed(AccessibilitySettings.defaults, highContrast: true);
      final expected = (normal.primaryColor as CupertinoDynamicColor).color
          .withColorProfile(highContrastProfile);
      expect((forced.primaryColor as CupertinoDynamicColor).color, expected);
      expect(forced.primaryColor, isNot(normal.primaryColor));
    });

    test('composes the forced high contrast with the user profile', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
        highContrast: true,
      );
      expect(
        (theme.primaryColor as CupertinoDynamicColor).color,
        CupertinoColors.systemBlue.color
            .withColorProfile(monochrome)
            .withColorProfile(highContrastProfile),
      );
    });

    test(
      'applies high contrast once when the user profile is high contrast',
      () {
        const settings = AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.highContrast,
          ),
        );
        final unforced = themed(settings);
        final forced = themed(settings, highContrast: true);
        expect(forced.primaryColor, unforced.primaryColor);
      },
    );

    test('picks up the adjusted primary in a default text theme', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
        theme: const CupertinoThemeData(),
      );
      expect(theme.textTheme.actionTextStyle.color, theme.primaryColor);
    });

    test('is a CupertinoThemeData', () {
      final CupertinoThemeData theme = themed(
        AccessibilitySettingsSamples.everythingSet,
      );
      expect(theme.applyThemeToAll, isFalse);
    });
  });
}
