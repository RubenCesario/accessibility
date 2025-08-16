import 'package:flutter_test/flutter_test.dart';
import 'package:with_multiple_languages/interfaces/displayable.dart';

/// Test implementation of [Displayable] interface.
class TestDisplayable implements Displayable {
  const TestDisplayable(this._displayName);

  final String _displayName;

  @override
  String get displayName => _displayName;
}

void main() {
  group('Displayable Interface', () {
    group('TestDisplayable Implementation', () {
      test('should return correct display name', () {
        const testItem = TestDisplayable('Test Item');
        expect(testItem.displayName, equals('Test Item'));
      });

      test('should handle empty display name', () {
        const testItem = TestDisplayable('');
        expect(testItem.displayName, equals(''));
      });

      test('should handle display name with special characters', () {
        const testItem = TestDisplayable('Test Item 🌟 with émojis & spëcial');
        expect(
          testItem.displayName,
          equals('Test Item 🌟 with émojis & spëcial'),
        );
      });

      test('should handle display name with numbers', () {
        const testItem = TestDisplayable('Item 123');
        expect(testItem.displayName, equals('Item 123'));
      });

      test('should handle long display name', () {
        const longName =
            'This is a very long display name that contains '
            'multiple words and should be handled correctly by the interface';
        const testItem = TestDisplayable(longName);
        expect(testItem.displayName, equals(longName));
      });

      test('should handle display name with whitespace', () {
        const testItem = TestDisplayable('  Test Item  ');
        expect(testItem.displayName, equals('  Test Item  '));
      });

      test('should handle display name with line breaks', () {
        const testItem = TestDisplayable('Test\nItem\nWith\nBreaks');
        expect(testItem.displayName, equals('Test\nItem\nWith\nBreaks'));
      });
    });

    group('Interface Contract', () {
      test('should be implementable by custom classes', () {
        const testItem = TestDisplayable('Custom Implementation');
        expect(testItem, isA<Displayable>());
        expect(testItem.displayName, isA<String>());
      });

      test('should enforce displayName getter', () {
        const testItem = TestDisplayable('Test');
        // This test ensures the interface contract is met
        expect(() => testItem.displayName, returnsNormally);
      });
    });

    group('Multiple Implementations', () {
      test('should support different implementations', () {
        final items = <Displayable>[
          const TestDisplayable('First Item'),
          const TestDisplayable('Second Item'),
          const TestDisplayable('Third Item'),
        ];

        expect(items.length, equals(3));
        expect(items[0].displayName, equals('First Item'));
        expect(items[1].displayName, equals('Second Item'));
        expect(items[2].displayName, equals('Third Item'));
      });

      test('should work in collections', () {
        final displayableItems = <Displayable>[
          const TestDisplayable('Apple'),
          const TestDisplayable('Banana'),
          const TestDisplayable('Cherry'),
        ];

        final displayNames =
            displayableItems.map((item) => item.displayName).toList();

        expect(displayNames, equals(['Apple', 'Banana', 'Cherry']));
      });
    });
  });
}
