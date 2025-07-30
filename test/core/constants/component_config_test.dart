import 'package:accessibility/src/core/constants/component_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Component Config Constants', () {
    test('word spacing slider values should be in valid range', () {
      expect(kMinWordSpacingSliderValue, 0.5);
      expect(kMaxWordSpacingSliderValue, 3);
      expect(kMaxWordSpacingSliderValue > kMinWordSpacingSliderValue, isTrue);
    });

    test('line height slider values should be in valid range', () {
      expect(kMinLineHeightSliderValue, 1.5);
      expect(kMaxLineHeightSliderValue, 2);
      expect(kMaxLineHeightSliderValue > kMinLineHeightSliderValue, isTrue);
    });

    test('letter spacing slider values should be in valid range', () {
      expect(kMinLetterSpacingSliderValue, 0.5);
      expect(kMaxLetterSpacingSliderValue, 1);
      expect(
        kMaxLetterSpacingSliderValue > kMinLetterSpacingSliderValue,
        isTrue,
      );
    });

    test('scale factor slider values should be in valid range', () {
      expect(kMinScaleFactorSliderValue, 1);
      expect(kMaxScaleFactorSliderValue, 2);
      expect(kMaxScaleFactorSliderValue > kMinScaleFactorSliderValue, isTrue);
    });

    test('slider divisions should be a positive integer', () {
      expect(kSliderDivisions, isA<int>());
      expect(kSliderDivisions, greaterThan(0));
      expect(kSliderDivisions, 4);
    });

    test('slider values should work with divisions correctly', () {
      // For each slider range, verify the step values are evenly distributed
      const wordSpacingStep =
          (kMaxWordSpacingSliderValue - kMinWordSpacingSliderValue) /
              kSliderDivisions;
      expect(wordSpacingStep, 0.625); // (3 - 0.5) / 4 = 0.625

      const lineHeightStep =
          (kMaxLineHeightSliderValue - kMinLineHeightSliderValue) /
              kSliderDivisions;
      expect(lineHeightStep, 0.125); // (2 - 1.5) / 4 = 0.125

      const letterSpacingStep =
          (kMaxLetterSpacingSliderValue - kMinLetterSpacingSliderValue) /
              kSliderDivisions;
      expect(letterSpacingStep, 0.125); // (1 - 0.5) / 4 = 0.125

      const scaleFactorStep =
          (kMaxScaleFactorSliderValue - kMinScaleFactorSliderValue) /
              kSliderDivisions;
      expect(scaleFactorStep, 0.25); // (2 - 1) / 4 = 0.25
    });
  });
}
