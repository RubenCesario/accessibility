import 'package:accessibility/src/domain/models/enum_by_name.dart';
import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:test/test.dart';

void main() {
  group('enumByName', () {
    test('returns the value whose name matches', () {
      expect(
        enumByName(
          TextAlignMode.values,
          'justify',
          fallback: TextAlignMode.none,
        ),
        TextAlignMode.justify,
      );
    });

    test('returns the fallback for an unknown name', () {
      expect(
        enumByName(
          TextAlignMode.values,
          'diagonal',
          fallback: TextAlignMode.none,
        ),
        TextAlignMode.none,
      );
    });

    test('returns the fallback for a non-string value', () {
      expect(
        enumByName(TextAlignMode.values, 3, fallback: TextAlignMode.start),
        TextAlignMode.start,
      );
      expect(
        enumByName(TextAlignMode.values, null, fallback: TextAlignMode.end),
        TextAlignMode.end,
      );
    });
  });
}
