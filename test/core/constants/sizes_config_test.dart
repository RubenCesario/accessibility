import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IconSize', () {
    test('should define all icon size constants correctly', () {
      expect(IconSize.smaller, equals(20));
      expect(IconSize.medium, equals(24));
      expect(IconSize.large, equals(40));
      expect(IconSize.larger, equals(48));
    });

    test('should maintain correct size progression', () {
      expect(IconSize.smaller < IconSize.medium, isTrue);
      expect(IconSize.medium < IconSize.large, isTrue);
      expect(IconSize.large < IconSize.larger, isTrue);
    });

    test('should follow material design guidelines for icon sizes', () {
      expect(IconSize.smaller % 4, equals(0));
      expect(IconSize.medium % 4, equals(0));
      expect(IconSize.large % 8, equals(0));
      expect(IconSize.larger % 8, equals(0));
    });
  });

  group('PaddingSize', () {
    test('should define all padding size constants correctly', () {
      expect(PaddingSize.smaller, equals(4));
      expect(PaddingSize.small, equals(8));
      expect(PaddingSize.medium, equals(12));
      expect(PaddingSize.large, equals(16));
      expect(PaddingSize.larger, equals(20));
    });

    test('should maintain correct size progression', () {
      expect(PaddingSize.smaller < PaddingSize.small, isTrue);
      expect(PaddingSize.small < PaddingSize.medium, isTrue);
      expect(PaddingSize.medium < PaddingSize.large, isTrue);
      expect(PaddingSize.large < PaddingSize.larger, isTrue);
    });

    test('should correctly calculate values from size factors', () {
      const baseSize = 4;
      // Testing private factors through their public results
      expect(
        PaddingSize.smaller,
        equals(baseSize * 1),
      ); // _paddingSmallerSizeFactor = 1
      expect(
        PaddingSize.small,
        equals(baseSize * 2),
      ); // _paddingSmallSizeFactor = 2
      expect(
        PaddingSize.medium,
        equals(baseSize * 3),
      ); // _paddingMediumSizeFactor = 3
      expect(
        PaddingSize.large,
        equals(baseSize * 4),
      ); // _paddingLargeSizeFactor = 4
      expect(
        PaddingSize.larger,
        equals(baseSize * 5),
      ); // _paddingLargerSizeFactor = 5
    });

    test('should follow material design guidelines for padding sizes', () {
      expect(PaddingSize.smaller % 4, equals(0));
      expect(PaddingSize.small % 4, equals(0));
      expect(PaddingSize.medium % 4, equals(0));
      expect(PaddingSize.large % 4, equals(0));
      expect(PaddingSize.larger % 4, equals(0));
    });
  });
}
