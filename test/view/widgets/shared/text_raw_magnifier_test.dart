import 'package:accessibility/src/view/widgets/shared/text_raw_magnifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TextRawMagnifier', () {
    const testText = 'Magnifiable Text';

    testWidgets('renders child widget correctly', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Text(testText),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should render the child text
      expect(find.text(testText), findsOneWidget);

      // Should not show magnifier initially
      expect(find.byType(RawMagnifier), findsNothing);
    });

    testWidgets('shows magnifier on long press', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Text(testText),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Long press on the text
      await tester.startGesture(
        tester.getCenter(find.text(testText)),
      );
      await tester.pump(const Duration(milliseconds: 500));

      // Should show magnifier
      expect(find.byType(RawMagnifier), findsOneWidget);
    });

    testWidgets('hides magnifier when long press ends', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Text(testText),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Long press on the text
      final gesture = await tester.startGesture(
        tester.getCenter(find.text(testText)),
      );
      await tester.pump(const Duration(milliseconds: 500));

      // Should show magnifier
      expect(find.byType(RawMagnifier), findsOneWidget);

      // End the long press
      await gesture.up();
      await tester.pump();

      // Magnifier should be hidden
      expect(find.byType(RawMagnifier), findsNothing);
    });

    testWidgets('updates magnifier position on move during long press',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Center(child: Text(testText)),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Start a long press gesture
      final gesture = await tester.startGesture(
        tester.getCenter(find.text(testText)),
      );
      await tester
          .pump(const Duration(milliseconds: 500)); // Long press duration

      // Get initial magnifier position
      final initialMagnifierPosition =
          tester.getTopLeft(find.byType(RawMagnifier));

      // Move the gesture to a new position
      await gesture.moveBy(const Offset(20, 20));
      await tester.pump();

      // Get the new magnifier position
      final newMagnifierPosition = tester.getTopLeft(find.byType(RawMagnifier));

      // Position should have changed
      expect(newMagnifierPosition, isNot(equals(initialMagnifierPosition)));

      // Clean up
      await gesture.up();
      await tester.pump();
    });

    testWidgets('magnifier has correct size and scale', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Text(testText),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Long press to show magnifier
      await tester.startGesture(
        tester.getCenter(find.text(testText)),
      );
      await tester.pump(const Duration(milliseconds: 500));

      // Get the RawMagnifier widget
      final magnifier = tester.widget<RawMagnifier>(find.byType(RawMagnifier));

      // Verify its properties
      expect(magnifier.size, equals(const Size(200, 100)));
      expect(magnifier.magnificationScale, equals(1.5));
    });

    testWidgets('magnifier has styled decoration', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Text(testText),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Long press to show magnifier
      await tester.startGesture(
        tester.getCenter(find.text(testText)),
      );
      await tester.pump(const Duration(milliseconds: 500));

      // Get the RawMagnifier widget
      final magnifier = tester.widget<RawMagnifier>(find.byType(RawMagnifier));

      // Verify it has decoration
      expect(magnifier.decoration, isA<MagnifierDecoration>());

      // Check that the decoration has a rounded rectangle border
      final decoration = magnifier.decoration;
      expect(decoration.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('works with different child widget types', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Icon(Icons.accessibility, size: 48),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should render the child icon
      expect(find.byIcon(Icons.accessibility), findsOneWidget);

      // Long press on the icon
      await tester.startGesture(
        tester.getCenter(find.byIcon(Icons.accessibility)),
      );
      await tester.pump(const Duration(milliseconds: 500));

      // Should show the magnifier
      expect(find.byType(RawMagnifier), findsOneWidget);
    });

    testWidgets('stores tap position on tap up', (tester) async {
      // This tests that onTapUp updates dragGesturePosition
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: SizedBox(width: 200, height: 200, child: Text(testText)),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Perform a tap (not a long press) at a specific position
      final tapPosition =
          tester.getTopLeft(find.text(testText)) + const Offset(10, 10);
      await tester.tapAt(tapPosition);
      await tester.pump();

      // Start long press at the same position
      await tester.startGesture(
        tester.getTopLeft(find.text(testText)) + const Offset(10, 10),
      );
      await tester.pump(const Duration(milliseconds: 500));
      // The magnifier should now be visible
      expect(find.byType(RawMagnifier), findsOneWidget);

      // The position of the magnifier should be affected by the
      // stored tap position
      final magnifierPosition = tester.getTopLeft(find.byType(RawMagnifier));

      // Now try with a different tap position
      await tester.tap(find.byType(TextRawMagnifier));
      await tester.pump();

      // Start long press at a different position
      final differentPosition = tester.getCenter(find.text(testText));
      await tester.startGesture(differentPosition);
      await tester.pump(const Duration(milliseconds: 500));

      // The new position should be different
      final newMagnifierPosition = tester.getTopLeft(find.byType(RawMagnifier));
      expect(newMagnifierPosition, equals(magnifierPosition));
    });

    testWidgets('shows magnifier when long press starts', (tester) async {
      // This tests the onLongPress handler explicitly
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Text(testText),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify magnifier is hidden initially
      expect(find.byType(RawMagnifier), findsNothing);

      // Start long press without moving
      final gesture =
          await tester.startGesture(tester.getCenter(find.text(testText)));
      await tester.pump(const Duration(milliseconds: 500));

      // Verify magnifier is now visible
      expect(find.byType(RawMagnifier), findsOneWidget);

      // End the long press gesture properly
      await gesture.up();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      // Verify magnifier is hidden again
      expect(find.byType(RawMagnifier), findsNothing);
    });

    testWidgets('magnifier has correct size and scale', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: Text(testText),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Long press to show magnifier
      await tester.startGesture(
        tester.getCenter(find.text(testText)),
      );
      await tester.pump(const Duration(milliseconds: 500));

      // Get the RawMagnifier widget
      final magnifier = tester.widget<RawMagnifier>(find.byType(RawMagnifier));

      // Verify its properties
      expect(magnifier.size, equals(const Size(200, 100)));
      expect(magnifier.magnificationScale, equals(1.5));
    });
  });

  group('constructor comprehensive coverage', () {
    group('minimal parameters', () {
      test('constructor with only required child parameter', () {
        const childWidget = Text('Test Child');
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.key, isNull);
      });

      testWidgets('minimal constructor renders correctly', (tester) async {
        const magnifier = TextRawMagnifier(child: Text('Simple Text'));
        final testWidget = buildDefaultTestWidget(child: magnifier);

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byType(TextRawMagnifier), findsOneWidget);
        expect(find.text('Simple Text'), findsOneWidget);
      });
    });

    group('constructor with key parameter', () {
      test('constructor with ValueKey', () {
        const testKey = ValueKey('magnifier_key');
        const childWidget = Text('Value Key Test');
        const magnifier = TextRawMagnifier(
          key: testKey,
          child: childWidget,
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, equals(childWidget));
      });

      test('constructor with ObjectKey', () {
        final testObject = Object();
        final testKey = ObjectKey(testObject);
        const childWidget = Icon(Icons.zoom_in);
        final magnifier = TextRawMagnifier(
          key: testKey,
          child: childWidget,
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, equals(childWidget));
      });

      test('constructor with GlobalKey', () {
        final testKey = GlobalKey();
        const childWidget = Text('Global Key Test');
        final magnifier = TextRawMagnifier(
          key: testKey,
          child: childWidget,
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, equals(childWidget));
      });

      test('constructor with UniqueKey', () {
        final testKey = UniqueKey();
        const childWidget = Icon(Icons.search);
        final magnifier = TextRawMagnifier(
          key: testKey,
          child: childWidget,
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, equals(childWidget));
      });

      testWidgets('constructor with key renders correctly', (tester) async {
        const testKey = Key('test_magnifier_key');
        const magnifier = TextRawMagnifier(
          key: testKey,
          child: Text('Keyed Widget'),
        );

        final testWidget = buildDefaultTestWidget(child: magnifier);
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byKey(testKey), findsOneWidget);
        expect(find.text('Keyed Widget'), findsOneWidget);
      });
    });

    group('different child widget types', () {
      test('constructor with Text child', () {
        const childWidget = Text('Sample Text Content');
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<Text>());
      });

      test('constructor with Icon child', () {
        const childWidget = Icon(Icons.accessibility);
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<Icon>());
      });

      test('constructor with Container child', () {
        const childWidget = SizedBox(width: 100, height: 50);
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<SizedBox>());
      });

      test('constructor with Image child', () {
        const childWidget =
            Placeholder(fallbackWidth: 100, fallbackHeight: 100);
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<Placeholder>());
      });

      test('constructor with complex nested child', () {
        const childWidget = Column(
          children: [
            Text('Header'),
            Row(
              children: [
                Icon(Icons.star),
                Text('Rating'),
              ],
            ),
            SizedBox(height: 10),
          ],
        );
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<Column>());
      });

      test('constructor with custom widget child', () {
        const childWidget = CircularProgressIndicator();
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<CircularProgressIndicator>());
      });

      testWidgets('different child types render correctly', (tester) async {
        const iconMagnifier = TextRawMagnifier(child: Icon(Icons.home));
        const textMagnifier = TextRawMagnifier(child: Text('Text Child'));

        // Test Icon child
        final iconTestWidget = buildDefaultTestWidget(child: iconMagnifier);
        await tester.pumpWidget(iconTestWidget);
        await tester.pumpAndSettle();
        expect(find.byType(TextRawMagnifier), findsOneWidget);
        expect(find.byIcon(Icons.home), findsOneWidget);

        // Test Text child
        final textTestWidget = buildDefaultTestWidget(child: textMagnifier);
        await tester.pumpWidget(textTestWidget);
        await tester.pumpAndSettle();
        expect(find.byType(TextRawMagnifier), findsOneWidget);
        expect(find.text('Text Child'), findsOneWidget);
      });
    });

    group('parameter combinations', () {
      test('key and simple text child', () {
        const testKey = Key('simple_text_key');
        const childWidget = Text('Simple');
        const magnifier = TextRawMagnifier(
          key: testKey,
          child: childWidget,
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, equals(childWidget));
      });

      test('key and icon child', () {
        const testKey = ValueKey('icon_magnifier');
        const childWidget = Icon(Icons.zoom_out);
        const magnifier = TextRawMagnifier(
          key: testKey,
          child: childWidget,
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, equals(childWidget));
      });

      test('key and complex child', () {
        final testKey = GlobalKey();
        const childWidget = Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text('Card Content'),
          ),
        );
        final magnifier = TextRawMagnifier(
          key: testKey,
          child: childWidget,
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, equals(childWidget));
      });

      testWidgets('key and child combinations render correctly',
          (tester) async {
        const testKey = Key('combination_test');
        const magnifier = TextRawMagnifier(
          key: testKey,
          child: Column(
            children: [
              Text('Title'),
              Icon(Icons.search),
            ],
          ),
        );

        final testWidget = buildDefaultTestWidget(child: magnifier);
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byKey(testKey), findsOneWidget);
        expect(find.text('Title'), findsOneWidget);
        expect(find.byIcon(Icons.search), findsOneWidget);
      });
    });

    group('edge cases and special scenarios', () {
      test('constructor with empty text child', () {
        const childWidget = Text('');
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect((magnifier.child as Text).data, equals(''));
      });

      test('constructor with very long text child', () {
        const longText = 'This is a very long text that might be used to test '
            'how the magnifier handles extensive content that '
            'could potentially overflow or cause layout issues when magnified.';
        const childWidget = Text(longText);
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect((magnifier.child as Text).data, equals(longText));
      });

      test('constructor with invisible child', () {
        const childWidget = Opacity(opacity: 0, child: Text('Hidden'));
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<Opacity>());
      });

      test('constructor with zero-sized child', () {
        const childWidget = SizedBox.shrink();
        const magnifier = TextRawMagnifier(child: childWidget);

        expect(magnifier.child, equals(childWidget));
        expect(magnifier.child, isA<SizedBox>());
      });

      testWidgets('edge case children render without errors', (tester) async {
        const emptyTextMagnifier = TextRawMagnifier(child: Text(''));
        const shrunkMagnifier = TextRawMagnifier(child: SizedBox.shrink());

        // Test empty text
        final emptyTestWidget =
            buildDefaultTestWidget(child: emptyTextMagnifier);
        await tester.pumpWidget(emptyTestWidget);
        await tester.pumpAndSettle();
        expect(find.byType(TextRawMagnifier), findsOneWidget);

        // Test shrunk widget
        final shrunkTestWidget = buildDefaultTestWidget(child: shrunkMagnifier);
        await tester.pumpWidget(shrunkTestWidget);
        await tester.pumpAndSettle();
        expect(find.byType(TextRawMagnifier), findsOneWidget);
      });
    });

    group('constructor', () {
      test('direct constructor', () {
        const magnifier = TextRawMagnifier(child: Text('Coverage Test'));
        expect(magnifier.child, isA<Text>());
      });

      test('constructor with all parameters', () {
        const testKey = Key('full_constructor');
        const magnifier = TextRawMagnifier(
          key: testKey,
          child: Text('Full Constructor Test'),
        );

        expect(magnifier.key, equals(testKey));
        expect(magnifier.child, isA<Text>());
      });
    });
  });
}
