import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/default_color_candidates.dart';
import 'package:flutter_test/flutter_test.dart';

const primaries = [
  0xFFF44336,
  0xFFE91E63,
  0xFF9C27B0,
  0xFF673AB7,
  0xFF3F51B5,
  0xFF2196F3,
  0xFF03A9F4,
  0xFF00BCD4,
  0xFF009688,
  0xFF4CAF50,
  0xFF8BC34A,
  0xFFCDDC39,
  0xFFFFEB3B,
  0xFFFFC107,
  0xFFFF9800,
  0xFFFF5722,
  0xFF795548,
  0xFF9E9E9E,
  0xFF607D8B,
];

void main() {
  test('kDefaultColorCandidates holds the 19 Material primaries in order', () {
    expect(kDefaultColorCandidates, hasLength(19));
    expect([
      for (final swatch in kDefaultColorCandidates) swatch.toARGB32(),
    ], primaries);
  });

  test(
    'every candidate has the ten shades and the 500 shade is the primary',
    () {
      for (final swatch in kDefaultColorCandidates) {
        for (final key in const [
          50,
          100,
          200,
          300,
          400,
          500,
          600,
          700,
          800,
          900,
        ]) {
          expect(swatch[key], isNotNull, reason: '$swatch $key');
        }
        expect(swatch[500], Color(swatch.toARGB32()), reason: '$swatch');
      }
    },
  );
}
