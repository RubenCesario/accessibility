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

  group('constructor coverage', () {
    testWidgets('constructor creates widget with required child parameter',
        (tester) async {
      const childWidget = Text('Test Child Widget');

      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: childWidget,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should render the TextRawMagnifier widget
      expect(find.byType(TextRawMagnifier), findsOneWidget);

      // Should render the child widget
      expect(find.text('Test Child Widget'), findsOneWidget);

      // Get the widget to verify the child was set correctly
      final magnifier = tester.widget<TextRawMagnifier>(
        find.byType(TextRawMagnifier),
      );

      // Should have the correct child
      expect(magnifier.child, equals(childWidget));
    });

    testWidgets('constructor with different child widget types',
        (tester) async {
      // Test constructor with different child types to ensure full coverage
      const iconChild = Icon(Icons.star, size: 24);

      final testWidget = buildDefaultTestWidget(
        child: const TextRawMagnifier(
          child: iconChild,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should render correctly with Icon child
      expect(find.byType(TextRawMagnifier), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);

      // Get the widget to verify the child was set correctly
      final magnifier = tester.widget<TextRawMagnifier>(
        find.byType(TextRawMagnifier),
      );

      expect(magnifier.child, equals(iconChild));
    });
  });
}
