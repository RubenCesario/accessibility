import 'dart:collection' show UnmodifiableListView;

import 'package:accessibility/src/core/extensions/colors.dart';
import 'package:accessibility/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorTransformation extension', () {
    group('adjustSaturation', () {
      test('returns original color when saturationMultiplier is null', () {
        const color = Colors.blue;
        final adjustedColor = color.adjustSaturation(null);
        expect(adjustedColor, equals(color));
      });

      test('increases saturation when saturationMultiplier > 1', () {
        const color = Colors.blue;
        final originalHsl = HSLColor.fromColor(color);
        final adjustedColor = color.adjustSaturation(1.5);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.saturation, greaterThan(originalHsl.saturation));
        expect(adjustedHsl.saturation, lessThanOrEqualTo(1.0));
        expect(originalHsl.hue, moreOrLessEquals(adjustedHsl.hue, epsilon: 1));
        expect(
          originalHsl.lightness,
          moreOrLessEquals(adjustedHsl.lightness, epsilon: 0.01),
        );
      });

      test('decreases saturation when saturationMultiplier < 1', () {
        const color = Colors.blue;
        final originalHsl = HSLColor.fromColor(color);
        final adjustedColor = color.adjustSaturation(0.5);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.saturation, lessThan(originalHsl.saturation));
        expect(adjustedHsl.saturation, greaterThanOrEqualTo(0.0));
        expect(originalHsl.hue, moreOrLessEquals(adjustedHsl.hue, epsilon: 1));
        expect(
          originalHsl.lightness,
          moreOrLessEquals(adjustedHsl.lightness, epsilon: 0.01),
        );
      });

      test('sets saturation to 0 when saturationMultiplier is 0', () {
        const color = Colors.blue;
        final adjustedColor = color.adjustSaturation(0);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.saturation, equals(0.0));
      });
    });

    group('adjustLightness', () {
      test('returns original color when lightnessFactor is null', () {
        const color = Colors.blue;
        final adjustedColor = color.adjustLightness(null);
        expect(adjustedColor, equals(color));
      });

      test('increases lightness when positive lightnessFactor is provided', () {
        const color = Colors.blue;
        final originalHsl = HSLColor.fromColor(color);
        final adjustedColor = color.adjustLightness(1.2);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.lightness, greaterThan(originalHsl.lightness));
        expect(adjustedHsl.lightness, lessThanOrEqualTo(1.0));
      });

      test('decreases lightness when negative lightnessFactor is provided', () {
        const color = Colors.blue;
        final originalHsl = HSLColor.fromColor(color);
        final adjustedColor = color.adjustLightness(0.2);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.lightness, lessThan(originalHsl.lightness));
        expect(adjustedHsl.lightness, greaterThanOrEqualTo(0.0));
      });

      test('clamps lightness to 0 when 0 is provided', () {
        const color = Colors.blue;
        final adjustedColor = color.adjustLightness(0);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.lightness, equals(0.0));
      });

      test('clamps lightness to 1 when large positive factor is provided', () {
        const color = Colors.blue;
        final adjustedColor = color.adjustLightness(10);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.lightness, equals(1.0));
      });

      test('saturation is adjusted when lightness changes', () {
        const color = Colors.blue;
        final originalHsl = HSLColor.fromColor(color);
        final adjustedColor = color.adjustLightness(0.4);
        final adjustedHsl = HSLColor.fromColor(adjustedColor);
        expect(adjustedHsl.saturation != originalHsl.saturation, true);
      });

      group('shadeNumberOfColorSwatch', () {
        test('returns correct shade number for color in swatch', () {
          const materialColor = MaterialColor(
            0xFF2196F3,
            <int, Color>{
              50: Color(0xFFE3F2FD),
              100: Color(0xFFBBDEFB),
              200: Color(0xFF90CAF9),
              300: Color(0xFF64B5F6),
              400: Color(0xFF42A5F5),
              500: Color(0xFF2196F3),
              600: Color(0xFF1E88E5),
              700: Color(0xFF1976D2),
              800: Color(0xFF1565C0),
              900: Color(0xFF0D47A1),
            },
          );

          expect(
            materialColor[500]!.shadeNumberOfColorSwatch(materialColor),
            equals(500),
          );

          expect(
            materialColor[100]!.shadeNumberOfColorSwatch(materialColor),
            equals(100),
          );

          expect(
            materialColor[900]!.shadeNumberOfColorSwatch(materialColor),
            equals(900),
          );
        });

        test('returns 50 for first shade in swatch', () {
          const materialColor = MaterialColor(
            0xFF2196F3,
            <int, Color>{
              50: Color(0xFFE3F2FD),
              100: Color(0xFFBBDEFB),
            },
          );

          expect(
            materialColor[50]!.shadeNumberOfColorSwatch(materialColor),
            equals(50),
          );
        });

        test('returns 0 for color not in swatch', () {
          const materialColor = MaterialColor(
            0xFF2196F3,
            <int, Color>{
              50: Color(0xFFE3F2FD),
              100: Color(0xFFBBDEFB),
            },
          );

          const nonExistentColor = Color(0xFF000000);
          expect(
            nonExistentColor.shadeNumberOfColorSwatch(materialColor),
            equals(0),
          );
        });
      });
    });

    group('SemanticColor extension', () {
      testWidgets('semanticLabel returns correct label from context',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates:
                AccessibilityLocalizations.localizationsDelegates,
            supportedLocales: AccessibilityLocalizations.supportedLocales,
            home: Builder(
              builder: (context) {
                const color = Color(0xFF2196F3);
                final label = color.semanticLabel(context);
                expect(label, equals('Blue'));
                return Text(label);
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(Text), findsOneWidget);
      });
    });

    group('ShadeColor extension', () {
      test('colorShades returns correct list of shades', () {
        const materialColor = MaterialColor(
          0xFF2196F3,
          <int, Color>{
            50: Color(0xFFE3F2FD),
            100: Color(0xFFBBDEFB),
            200: Color(0xFF90CAF9),
            300: Color(0xFF64B5F6),
            400: Color(0xFF42A5F5),
            500: Color(0xFF2196F3),
            600: Color(0xFF1E88E5),
            700: Color(0xFF1976D2),
            800: Color(0xFF1565C0),
            900: Color(0xFF0D47A1),
          },
        );
        final shades = materialColor.colorShades;
        expect(shades, isA<UnmodifiableListView<Color>>());
        expect(shades.length, equals(10));
        expect(shades[0], equals(materialColor[50]));
        expect(shades[1], equals(materialColor[100]));
        expect(shades[5], equals(materialColor[500]));
        expect(shades[9], equals(materialColor[900]));
      });

      test('colorShades handles partial shades', () {
        const partialMaterialColor = MaterialColor(
          0xFF2196F3,
          <int, Color>{
            50: Color(0xFFE3F2FD),
            500: Color(0xFF2196F3),
            900: Color(0xFF0D47A1),
          },
        );
        final shades = partialMaterialColor.colorShades;
        expect(shades.length, equals(3));
        expect(shades[0], equals(partialMaterialColor[50]));
        expect(shades[1], equals(partialMaterialColor[500]));
        expect(shades[2], equals(partialMaterialColor[900]));
      });

      test('colorShades returns empty list for empty swatch', () {
        const emptySwatch = MaterialColor(
          0xFF2196F3,
          <int, Color>{},
        );
        final shades = emptySwatch.colorShades;
        expect(shades, isEmpty);
      });
    });
  });
}
