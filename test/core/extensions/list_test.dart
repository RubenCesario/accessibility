import 'package:accessibility/src/core/extensions/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SeparatedBy extension', () {
    test('should return same list when length is less than 2', () {
      final widgets = <Widget>[
        const Text('Single Item'),
      ];
      const Widget separator = SizedBox(height: 10);
      final result = widgets.withSeparatorBetweenWidgets(separator: separator);
      expect(result, equals(widgets));
      expect(result.length, equals(1));
    });

    test('should return empty list when input is empty', () {
      final widgets = <Widget>[];
      const Widget separator = SizedBox(height: 10);
      final result = widgets.withSeparatorBetweenWidgets(separator: separator);
      expect(result, equals(widgets));
      expect(result.isEmpty, isTrue);
    });

    test('should add separator between widgets', () {
      final widgets = <Widget>[
        const Text('First Item'),
        const Text('Second Item'),
        const Text('Third Item'),
      ];
      const Widget separator = SizedBox(height: 10);
      final result = widgets.withSeparatorBetweenWidgets(separator: separator);
      expect(result.length, equals(2 * widgets.length - 1));
      expect(result[0], equals(widgets[0]));
      expect(result[1], equals(separator));
      expect(result[2], equals(widgets[1]));
      expect(result[3], equals(separator));
      expect(result[4], equals(widgets[2]));
    });

    test('should work with exactly two widgets', () {
      final widgets = <Widget>[
        const Text('First Item'),
        const Text('Second Item'),
      ];
      const Widget separator = SizedBox(height: 10);
      final result = widgets.withSeparatorBetweenWidgets(separator: separator);
      expect(result.length, equals(3));
      expect(result[0], equals(widgets[0]));
      expect(result[1], equals(separator));
      expect(result[2], equals(widgets[1]));
    });
  });
}
