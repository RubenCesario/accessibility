import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/text_align_mode_mapping.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TextAlignMode maps to TextAlign, none to null', () {
    expect(TextAlignMode.none.toTextAlign(), isNull);
    expect(TextAlignMode.start.toTextAlign(), TextAlign.start);
    expect(TextAlignMode.end.toTextAlign(), TextAlign.end);
    expect(TextAlignMode.left.toTextAlign(), TextAlign.left);
    expect(TextAlignMode.right.toTextAlign(), TextAlign.right);
    expect(TextAlignMode.center.toTextAlign(), TextAlign.center);
    expect(TextAlignMode.justify.toTextAlign(), TextAlign.justify);
  });
}
