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
  });
}
