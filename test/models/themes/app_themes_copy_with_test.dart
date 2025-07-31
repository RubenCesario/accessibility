import 'package:accessibility/src/models/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../resources/theme/color_schemes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const lightColorScheme = kLightColorScheme;
  const darkColorScheme = kDarkColorScheme;
  const highContrastLightColorScheme = kHighContrastLightColorScheme;
  const highContrastDarkColorScheme = kHighContrastDarkColorScheme;
  final testTextTheme = Typography.englishLike2021.apply(fontSizeFactor: 1.1);

  group('AppThemes copyWith', () {
    test('copyWith method updates medium and high contrast themes', () {
      // Create base themes
      final lightTheme = ThemeData.light();
      final darkTheme = ThemeData.dark();

      // Create base high contrast themes that will be replaced in copyWith
      final lightHighContrastTheme = ThemeData.light();
      final darkHighContrastTheme = ThemeData.dark();

      final initialThemes = AppThemes(
        lightTheme: lightTheme,
        darkTheme: darkTheme,
        lightHighContrastTheme: lightHighContrastTheme,
        darkHighContrastTheme: darkHighContrastTheme,
      );

      // Create new theme data for contrast variants
      final lightMediumContrastTheme = ThemeData.light().copyWith(
        colorScheme: lightColorScheme,
        textTheme: testTextTheme,
      );

      final darkMediumContrastTheme = ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        textTheme: testTextTheme,
      );

      final newLightHighContrastTheme = ThemeData.light().copyWith(
        colorScheme: highContrastLightColorScheme,
        textTheme: testTextTheme,
      );

      final newDarkHighContrastTheme = ThemeData.dark().copyWith(
        colorScheme: highContrastDarkColorScheme,
        textTheme: testTextTheme,
      );

      // Create a copy with all contrast themes updated
      final updatedThemes = initialThemes.copyWith(
        lightMediumContrastTheme: lightMediumContrastTheme,
        darkMediumContrastTheme: darkMediumContrastTheme,
        lightHighContrastTheme: newLightHighContrastTheme,
        darkHighContrastTheme: newDarkHighContrastTheme,
      );

      // Verify all themes are updated correctly
      expect(updatedThemes.lightTheme, equals(lightTheme));
      expect(updatedThemes.darkTheme, equals(darkTheme));
      expect(
        updatedThemes.lightMediumContrastTheme,
        equals(lightMediumContrastTheme),
      );
      expect(
        updatedThemes.darkMediumContrastTheme,
        equals(darkMediumContrastTheme),
      );
      expect(
        updatedThemes.lightHighContrastTheme,
        equals(newLightHighContrastTheme),
      );
      expect(
        updatedThemes.darkHighContrastTheme,
        equals(newDarkHighContrastTheme),
      );
    });
  });
}
