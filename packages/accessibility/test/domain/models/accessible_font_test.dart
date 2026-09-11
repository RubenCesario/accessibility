import 'package:accessibility/src/domain/models/accessible_font.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibleFont', () {
    test('qualifies the family with the package when present', () {
      const font = AccessibleFont(
        family: 'Andika',
        package: 'accessibility_font_andika',
      );
      expect(font.qualifiedFamily, 'packages/accessibility_font_andika/Andika');
    });

    test('keeps the bare family without a package', () {
      const font = AccessibleFont(family: 'OpenDyslexic');
      expect(font.qualifiedFamily, 'OpenDyslexic');
    });

    test('is a value type with a readable toString', () {
      const a = AccessibleFont(family: 'Andika', package: 'p');
      const b = AccessibleFont(family: 'Andika', package: 'p');
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(const AccessibleFont(family: 'Andika')));
      expect(a.toString(), contains('Andika'));
    });
  });
}
