import 'package:accessibility/src/core/constants/text_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('kTextThemeMergableEnglishLike2021', () {
    test('should define a complete TextTheme with all style properties', () {
      expect(kTextThemeMergableEnglishLike2021, isA<TextTheme>());
      expect(kTextThemeMergableEnglishLike2021.displayLarge, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.displayMedium, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.displaySmall, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.headlineLarge, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.headlineMedium, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.headlineSmall, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.titleLarge, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.titleMedium, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.titleSmall, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.labelLarge, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.labelMedium, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.labelSmall, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.bodyLarge, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.bodyMedium, isNotNull);
      expect(kTextThemeMergableEnglishLike2021.bodySmall, isNotNull);
    });

    test(
        'displayLarge should have correct properties '
        'according to Material 3 specs', () {
      final style = kTextThemeMergableEnglishLike2021.displayLarge!;
      expect(style.fontSize, equals(57));
      expect(style.fontWeight, equals(FontWeight.w400));
      expect(style.letterSpacing, equals(-0.25));
      expect(style.height, equals(1.12));
      expect(style.textBaseline, equals(TextBaseline.alphabetic));
      expect(style.leadingDistribution, equals(TextLeadingDistribution.even));
      expect(style.debugLabel, equals('englishLike displayLarge 2021'));
    });

    test(
        'displayMedium should have correct properties '
        'according to Material 3 specs', () {
      final style = kTextThemeMergableEnglishLike2021.displayMedium!;
      expect(style.fontSize, equals(45));
      expect(style.fontWeight, equals(FontWeight.w400));
      expect(style.letterSpacing, equals(0));
      expect(style.height, equals(1.16));
    });

    test(
        'bodySmall should have correct properties '
        'according to Material 3 specs', () {
      final style = kTextThemeMergableEnglishLike2021.bodySmall!;
      expect(style.fontSize, equals(12));
      expect(style.fontWeight, equals(FontWeight.w400));
      expect(style.letterSpacing, equals(0.4));
      expect(style.height, equals(1.33));
    });

    test('should have consistent properties across all text styles', () {
      final allStyles = [
        kTextThemeMergableEnglishLike2021.displayLarge!,
        kTextThemeMergableEnglishLike2021.displayMedium!,
        kTextThemeMergableEnglishLike2021.displaySmall!,
        kTextThemeMergableEnglishLike2021.headlineLarge!,
        kTextThemeMergableEnglishLike2021.headlineMedium!,
        kTextThemeMergableEnglishLike2021.headlineSmall!,
        kTextThemeMergableEnglishLike2021.titleLarge!,
        kTextThemeMergableEnglishLike2021.titleMedium!,
        kTextThemeMergableEnglishLike2021.titleSmall!,
        kTextThemeMergableEnglishLike2021.labelLarge!,
        kTextThemeMergableEnglishLike2021.labelMedium!,
        kTextThemeMergableEnglishLike2021.labelSmall!,
        kTextThemeMergableEnglishLike2021.bodyLarge!,
        kTextThemeMergableEnglishLike2021.bodyMedium!,
        kTextThemeMergableEnglishLike2021.bodySmall!,
      ];

      for (final style in allStyles) {
        expect(
          style.textBaseline,
          equals(TextBaseline.alphabetic),
          reason: '${style.debugLabel} should use alphabetic baseline',
        );
        expect(
          style.leadingDistribution,
          equals(TextLeadingDistribution.even),
          reason: '${style.debugLabel} should use even leading distribution',
        );
        expect(
          style.debugLabel?.contains('englishLike'),
          isTrue,
          reason: 'Debug label should indicate englishLike style',
        );
        expect(
          style.debugLabel?.contains('2021'),
          isTrue,
          reason: 'Debug label should indicate 2021 Material specs',
        );
      }
    });

    test('font sizes should follow size hierarchy', () {
      expect(
        kTextThemeMergableEnglishLike2021.displayLarge!.fontSize! >
            kTextThemeMergableEnglishLike2021.displayMedium!.fontSize!,
        isTrue,
      );
      expect(
        kTextThemeMergableEnglishLike2021.displayMedium!.fontSize! >
            kTextThemeMergableEnglishLike2021.displaySmall!.fontSize!,
        isTrue,
      );
      expect(
        kTextThemeMergableEnglishLike2021.displaySmall!.fontSize! >
            kTextThemeMergableEnglishLike2021.headlineLarge!.fontSize!,
        isTrue,
      );
      expect(
        kTextThemeMergableEnglishLike2021.headlineLarge!.fontSize! >
            kTextThemeMergableEnglishLike2021.headlineMedium!.fontSize!,
        isTrue,
      );
    });

    test('should match Material Design 3 type scale', () {
      expect(
        kTextThemeMergableEnglishLike2021.displayLarge!.fontSize,
        equals(57),
      );
      expect(
        kTextThemeMergableEnglishLike2021.headlineSmall!.fontSize,
        equals(24),
      );
      expect(
        kTextThemeMergableEnglishLike2021.titleLarge!.fontSize,
        equals(22),
      );
      expect(kTextThemeMergableEnglishLike2021.bodyLarge!.fontSize, equals(16));
      expect(
        kTextThemeMergableEnglishLike2021.labelSmall!.fontSize,
        equals(11),
      );
    });

    test('should work properly with copywith', () {
      final modifiedTheme = kTextThemeMergableEnglishLike2021.copyWith(
        bodyLarge: kTextThemeMergableEnglishLike2021.bodyLarge?.copyWith(
          color: Colors.red,
        ),
      );
      expect(modifiedTheme.bodyLarge?.color, equals(Colors.red));
      // Other properties from the original style should be preserved
      expect(modifiedTheme.bodyLarge?.fontSize, equals(16));
      expect(modifiedTheme.bodyLarge?.fontWeight, equals(FontWeight.w400));
    });

    test('should be comparable with Typography.englishLike2021', () {
      const materialTypography = Typography.englishLike2021;

      expect(
        kTextThemeMergableEnglishLike2021.bodyMedium?.fontSize,
        equals(materialTypography.bodyMedium?.fontSize),
      );
      expect(
        kTextThemeMergableEnglishLike2021.titleLarge?.fontSize,
        equals(materialTypography.titleLarge?.fontSize),
      );
      expect(
        kTextThemeMergableEnglishLike2021.displayLarge?.fontSize,
        equals(materialTypography.displayLarge?.fontSize),
      );
    });
  });
}
