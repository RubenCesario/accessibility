import 'package:accessibility/src/models/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../resources/theme/color_schemes.dart';

void main() {
  const lightColorScheme = kLightColorScheme;
  const darkColorScheme = kDarkColorScheme;
  const highContrastLightColorScheme = kHighContrastLightColorScheme;
  const highContrastDarkColorScheme = kHighContrastDarkColorScheme;
  final testTextTheme = Typography.englishLike2021.apply(fontSizeFactor: 1.1);

  group('AppThemes', () {
    test('constructor creates instance with correct properties', () {
      final lightTheme = ThemeData.light().copyWith(
        colorScheme: lightColorScheme,
        textTheme: testTextTheme,
      );
      final darkTheme = ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        textTheme: testTextTheme,
      );
      final lightHighContrastTheme = ThemeData.light().copyWith(
        colorScheme: highContrastLightColorScheme,
        textTheme: testTextTheme,
      );
      final darkHighContrastTheme = ThemeData.dark().copyWith(
        colorScheme: highContrastDarkColorScheme,
        textTheme: testTextTheme,
      );

      final appThemes = AppThemes(
        lightTheme: lightTheme,
        darkTheme: darkTheme,
        lightHighContrastTheme: lightHighContrastTheme,
        darkHighContrastTheme: darkHighContrastTheme,
      );

      expect(appThemes.lightTheme, equals(lightTheme));
      expect(appThemes.darkTheme, equals(darkTheme));
      expect(appThemes.lightHighContrastTheme, equals(lightHighContrastTheme));
      expect(appThemes.darkHighContrastTheme, equals(darkHighContrastTheme));
      expect(appThemes.lightMediumContrastTheme, isNull);
      expect(appThemes.darkMediumContrastTheme, isNull);
    });

    test('constructor creates instance with optional medium contrast themes',
        () {
      final lightTheme = ThemeData.light().copyWith(
        colorScheme: lightColorScheme,
        textTheme: testTextTheme,
      );
      final darkTheme = ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        textTheme: testTextTheme,
      );
      final lightHighContrastTheme = ThemeData.light().copyWith(
        colorScheme: highContrastLightColorScheme,
        textTheme: testTextTheme,
      );
      final darkHighContrastTheme = ThemeData.dark().copyWith(
        colorScheme: highContrastDarkColorScheme,
        textTheme: testTextTheme,
      );
      final lightMediumContrastTheme = ThemeData.light().copyWith(
        colorScheme: lightColorScheme,
      );
      final darkMediumContrastTheme = ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
      );

      final appThemes = AppThemes(
        lightTheme: lightTheme,
        darkTheme: darkTheme,
        lightHighContrastTheme: lightHighContrastTheme,
        darkHighContrastTheme: darkHighContrastTheme,
        lightMediumContrastTheme: lightMediumContrastTheme,
        darkMediumContrastTheme: darkMediumContrastTheme,
      );

      expect(
        appThemes.lightMediumContrastTheme,
        equals(lightMediumContrastTheme),
      );
      expect(
        appThemes.darkMediumContrastTheme,
        equals(darkMediumContrastTheme),
      );
    });

    group('fromColorSchemes factory', () {
      test(
          'creates instance with required color schemes and default text theme',
          () {
        final appThemes = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        expect(appThemes.lightTheme.colorScheme, equals(lightColorScheme));
        expect(appThemes.darkTheme.colorScheme, equals(darkColorScheme));
        expect(
          appThemes.lightHighContrastTheme.colorScheme,
          equals(highContrastLightColorScheme),
        );
        expect(
          appThemes.darkHighContrastTheme.colorScheme,
          equals(highContrastDarkColorScheme),
        );

        expect(
          appThemes.lightMediumContrastTheme?.colorScheme,
          equals(lightColorScheme),
        );
        expect(
          appThemes.darkMediumContrastTheme?.colorScheme,
          equals(darkColorScheme),
        );
      });

      test('creates instance with all color schemes and custom text theme', () {
        final mediumLightColorScheme =
            lightColorScheme.copyWith(brightness: Brightness.light);
        final mediumDarkColorScheme =
            darkColorScheme.copyWith(brightness: Brightness.dark);
        final appThemes = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
          lightMediumContrastColorScheme: mediumLightColorScheme,
          darkMediumContrastColorScheme: mediumDarkColorScheme,
          textTheme: testTextTheme,
        );

        expect(appThemes.lightTheme.colorScheme, equals(lightColorScheme));
        expect(appThemes.darkTheme.colorScheme, equals(darkColorScheme));
        expect(
          appThemes.lightHighContrastTheme.colorScheme,
          equals(highContrastLightColorScheme),
        );
        expect(
          appThemes.darkHighContrastTheme.colorScheme,
          equals(highContrastDarkColorScheme),
        );
        expect(
          appThemes.lightMediumContrastTheme?.colorScheme,
          equals(mediumLightColorScheme),
        );
        expect(
          appThemes.darkMediumContrastTheme?.colorScheme,
          equals(mediumDarkColorScheme),
        );

        expect(appThemes.lightTheme.textTheme, equals(testTextTheme));
        expect(appThemes.darkTheme.textTheme, equals(testTextTheme));
      });
    });

    group('copyWith', () {
      test('creates copy with updated properties', () {
        final originalAppThemes = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        final newLightTheme = ThemeData.light().copyWith(
          colorScheme:
              const ColorScheme.light().copyWith(primary: Colors.purple),
        );

        final newDarkTheme = ThemeData.dark().copyWith(
          colorScheme:
              const ColorScheme.dark().copyWith(primary: Colors.yellow),
        );

        final updatedAppThemes = originalAppThemes.copyWith(
          lightTheme: newLightTheme,
          darkTheme: newDarkTheme,
        );
        expect(updatedAppThemes.lightTheme, equals(newLightTheme));
        expect(updatedAppThemes.darkTheme, equals(newDarkTheme));
        expect(
          updatedAppThemes.lightHighContrastTheme,
          equals(originalAppThemes.lightHighContrastTheme),
        );
        expect(
          updatedAppThemes.darkHighContrastTheme,
          equals(originalAppThemes.darkHighContrastTheme),
        );
      });

      test('creates copy with all properties updated', () {
        final originalAppThemes = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        final newLightTheme =
            ThemeData.light().copyWith(primaryColor: Colors.amber);
        final newDarkTheme =
            ThemeData.dark().copyWith(primaryColor: Colors.teal);
        final newLightMediumContrastTheme =
            ThemeData.light().copyWith(primaryColor: Colors.orange);
        final newDarkMediumContrastTheme =
            ThemeData.dark().copyWith(primaryColor: Colors.indigo);
        final newLightHighContrastTheme =
            ThemeData.light().copyWith(primaryColor: Colors.lime);
        final newDarkHighContrastTheme =
            ThemeData.dark().copyWith(primaryColor: Colors.deepPurple);

        final updatedAppThemes = originalAppThemes.copyWith(
          lightTheme: newLightTheme,
          darkTheme: newDarkTheme,
          lightMediumContrastTheme: newLightMediumContrastTheme,
          darkMediumContrastTheme: newDarkMediumContrastTheme,
          lightHighContrastTheme: newLightHighContrastTheme,
          darkHighContrastTheme: newDarkHighContrastTheme,
        );

        expect(updatedAppThemes.lightTheme, equals(newLightTheme));
        expect(updatedAppThemes.darkTheme, equals(newDarkTheme));
        expect(
          updatedAppThemes.lightMediumContrastTheme,
          equals(newLightMediumContrastTheme),
        );
        expect(
          updatedAppThemes.darkMediumContrastTheme,
          equals(newDarkMediumContrastTheme),
        );
        expect(
          updatedAppThemes.lightHighContrastTheme,
          equals(newLightHighContrastTheme),
        );
        expect(
          updatedAppThemes.darkHighContrastTheme,
          equals(newDarkHighContrastTheme),
        );
      });
    });

    group('equality', () {
      test('identical instances are equal', () {
        final appThemes = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        final result = appThemes == appThemes;
        expect(result, isTrue);
      });

      test('instances with same values are equal', () {
        final appThemes1 = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        final appThemes2 = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        expect(appThemes1 == appThemes2, isTrue);
        expect(appThemes1.hashCode, equals(appThemes2.hashCode));
      });

      test('instances with different values are not equal', () {
        final appThemes1 = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        final appThemes2 = AppThemes.fromColorSchemes(
          lightColorScheme: lightColorScheme.copyWith(primary: Colors.purple),
          darkColorScheme: darkColorScheme,
          highContrastLightColorScheme: highContrastLightColorScheme,
          highContrastDarkColorScheme: highContrastDarkColorScheme,
        );

        expect(appThemes1 == appThemes2, isFalse);
      });
    });

    test('toString returns a string representation', () {
      final appThemes = AppThemes.fromColorSchemes(
        lightColorScheme: lightColorScheme,
        darkColorScheme: darkColorScheme,
        highContrastLightColorScheme: highContrastLightColorScheme,
        highContrastDarkColorScheme: highContrastDarkColorScheme,
      );

      final stringRepresentation = appThemes.toString();
      expect(stringRepresentation, isA<String>());
      expect(stringRepresentation, contains('AppThemes'));
      expect(stringRepresentation, contains('lightTheme:'));
      expect(stringRepresentation, contains('darkTheme:'));
      expect(stringRepresentation, contains('lightHighContrastTheme:'));
      expect(stringRepresentation, contains('darkHighContrastTheme:'));
      expect(stringRepresentation, contains('lightMediumContrastTheme:'));
      expect(stringRepresentation, contains('darkMediumContrastTheme:'));
    });
  });
}
