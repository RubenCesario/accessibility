import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:with_multiple_languages/constants/theme/color_schemes.dart';

void main() {
  group('Color Schemes', () {
    group('kLightColorScheme', () {
      test('should have light brightness', () {
        expect(kLightColorScheme.brightness, equals(Brightness.light));
      });

      test('should have correct primary color', () {
        expect(kLightColorScheme.primary, equals(const Color(0xff006a65)));
      });

      test('should have correct surface tint', () {
        expect(kLightColorScheme.surfaceTint, equals(const Color(0xff006a65)));
      });

      test('should have white on primary', () {
        expect(kLightColorScheme.onPrimary, equals(const Color(0xffffffff)));
      });

      test('should have correct primary container', () {
        expect(
          kLightColorScheme.primaryContainer,
          equals(const Color(0xff9df2ea)),
        );
      });

      test('should have correct secondary color', () {
        expect(kLightColorScheme.secondary, equals(const Color(0xff4a6361)));
      });

      test('should have correct error color', () {
        expect(kLightColorScheme.error, equals(const Color(0xffba1a1a)));
      });

      test('should have correct surface color', () {
        expect(kLightColorScheme.surface, equals(const Color(0xfff4fbf9)));
      });

      test('should have correct on surface color', () {
        expect(kLightColorScheme.onSurface, equals(const Color(0xff161d1c)));
      });

      test('should have black shadow', () {
        expect(kLightColorScheme.shadow, equals(const Color(0xff000000)));
      });

      test('should have black scrim', () {
        expect(kLightColorScheme.scrim, equals(const Color(0xff000000)));
      });
    });

    group('kHighConstrastLightColorScheme', () {
      test('should have light brightness', () {
        expect(
          kHighConstrastLightColorScheme.brightness,
          equals(Brightness.light),
        );
      });

      test('should have darker primary than regular light', () {
        expect(
          kHighConstrastLightColorScheme.primary,
          equals(const Color(0xff003230)),
        );
      });

      test('should have white on primary', () {
        expect(
          kHighConstrastLightColorScheme.onPrimary,
          equals(const Color(0xffffffff)),
        );
      });

      test('should have black on surface', () {
        expect(
          kHighConstrastLightColorScheme.onSurface,
          equals(const Color(0xff000000)),
        );
      });

      test('should have black on surface variant', () {
        expect(
          kHighConstrastLightColorScheme.onSurfaceVariant,
          equals(const Color(0xff000000)),
        );
      });

      test('should have darker outline than regular light', () {
        expect(
          kHighConstrastLightColorScheme.outline,
          equals(const Color(0xff242e2d)),
        );
      });
    });

    group('kDarkColorScheme', () {
      test('should have dark brightness', () {
        expect(kDarkColorScheme.brightness, equals(Brightness.dark));
      });

      test('should have correct primary color', () {
        expect(kDarkColorScheme.primary, equals(const Color(0xff81d5ce)));
      });

      test('should have correct surface tint', () {
        expect(kDarkColorScheme.surfaceTint, equals(const Color(0xff81d5ce)));
      });

      test('should have dark on primary', () {
        expect(kDarkColorScheme.onPrimary, equals(const Color(0xff003734)));
      });

      test('should have correct primary container', () {
        expect(
          kDarkColorScheme.primaryContainer,
          equals(const Color(0xff00504c)),
        );
      });

      test('should have correct secondary color', () {
        expect(kDarkColorScheme.secondary, equals(const Color(0xffb0ccc9)));
      });

      test('should have correct error color', () {
        expect(kDarkColorScheme.error, equals(const Color(0xffffb4ab)));
      });

      test('should have dark surface color', () {
        expect(kDarkColorScheme.surface, equals(const Color(0xff0e1514)));
      });

      test('should have light on surface color', () {
        expect(kDarkColorScheme.onSurface, equals(const Color(0xffdde4e2)));
      });

      test('should have black shadow', () {
        expect(kDarkColorScheme.shadow, equals(const Color(0xff000000)));
      });

      test('should have black scrim', () {
        expect(kDarkColorScheme.scrim, equals(const Color(0xff000000)));
      });
    });

    group('kHighConstrastDarkColorScheme', () {
      test('should have dark brightness', () {
        expect(
          kHighConstrastDarkColorScheme.brightness,
          equals(Brightness.dark),
        );
      });

      test('should have brighter primary than regular dark', () {
        expect(
          kHighConstrastDarkColorScheme.primary,
          equals(const Color(0xffabfff8)),
        );
      });

      test('should have black on primary', () {
        expect(
          kHighConstrastDarkColorScheme.onPrimary,
          equals(const Color(0xff000000)),
        );
      });

      test('should have white on surface', () {
        expect(
          kHighConstrastDarkColorScheme.onSurface,
          equals(const Color(0xffffffff)),
        );
      });

      test('should have white on surface variant', () {
        expect(
          kHighConstrastDarkColorScheme.onSurfaceVariant,
          equals(const Color(0xffffffff)),
        );
      });

      test('should have lighter outline than regular dark', () {
        expect(
          kHighConstrastDarkColorScheme.outline,
          equals(const Color(0xffe8f2f0)),
        );
      });
    });

    group('Color Scheme Consistency', () {
      test('all color schemes should have valid colors', () {
        final schemes = [
          kLightColorScheme,
          kHighConstrastLightColorScheme,
          kDarkColorScheme,
          kHighConstrastDarkColorScheme,
        ];

        for (final scheme in schemes) {
          expect(scheme.primary, isA<Color>());
          expect(scheme.onPrimary, isA<Color>());
          expect(scheme.secondary, isA<Color>());
          expect(scheme.onSecondary, isA<Color>());
          expect(scheme.surface, isA<Color>());
          expect(scheme.onSurface, isA<Color>());
          expect(scheme.error, isA<Color>());
          expect(scheme.onError, isA<Color>());
        }
      });

      test('light schemes should have light brightness', () {
        expect(kLightColorScheme.brightness, equals(Brightness.light));
        expect(
          kHighConstrastLightColorScheme.brightness,
          equals(Brightness.light),
        );
      });

      test('dark schemes should have dark brightness', () {
        expect(kDarkColorScheme.brightness, equals(Brightness.dark));
        expect(
          kHighConstrastDarkColorScheme.brightness,
          equals(Brightness.dark),
        );
      });

      test('high contrast schemes should have better contrast', () {
        // High contrast light should have darker primary
        expect(
          kHighConstrastLightColorScheme.primary.toARGB32(),
          lessThan(kLightColorScheme.primary.toARGB32()),
        );

        // High contrast dark should have brighter primary
        expect(
          kHighConstrastDarkColorScheme.primary.toARGB32(),
          greaterThan(kDarkColorScheme.primary.toARGB32()),
        );
      });
    });
  });
}
