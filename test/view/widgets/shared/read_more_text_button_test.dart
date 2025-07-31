import 'dart:ui';

import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:accessibility/src/view/widgets/shared/read_more_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ReadMoreTextButton', () {
    const testText = 'This is some detailed test text';

    testWidgets('renders collapsed button initially', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreTextButton(
          text: testText,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Initially the text should be hidden
      expect(find.text(testText), findsNothing);

      // The "more info" text and add icon should be visible
      expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
    });

    testWidgets('expands content when button is tapped', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreTextButton(
          text: testText,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Tap on the button
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The icon should change to remove
      expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.add_circle_outline), findsNothing);
    });

    testWidgets('collapses content when button is tapped again',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreTextButton(
          text: testText,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // First tap to expand
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Tap again to collapse
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The icon should change back to add
      expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.remove_circle_outline), findsNothing);
    });

    testWidgets('applies custom button alignment', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreTextButton(
          text: testText,
          readMoreButtonAlignment: MainAxisAlignment.center,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the Row inside the button
      final row = tester.widget<Row>(
        find.descendant(
          of: find.byType(TextButton),
          matching: find.byType(Row),
        ),
      );

      // Should use the custom alignment
      expect(row.mainAxisAlignment, equals(MainAxisAlignment.center));
    });

    testWidgets('applies custom body text style', (tester) async {
      const customStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.purple,
      );

      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreTextButton(
          text: testText,
          bodyTextStyle: customStyle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Tap to expand the content
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Find the AccessibleText with the test text
      final textWidget =
          tester.widget<AccessibleText>(find.byType(AccessibleText).first);

      // Should have the custom style
      expect(textWidget.style, equals(customStyle));
    });

    testWidgets('applies custom button text style', (tester) async {
      const customStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Colors.amber,
      );

      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreTextButton(
          text: testText,
          readMoreButtonTextStyle: customStyle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find all AccessibleText widgets
      final textWidgets = tester.widgetList<AccessibleText>(
        find.byType(AccessibleText),
      );

      // The button text should have our custom style
      final buttonTextWidget = textWidgets.first;
      expect(buttonTextWidget.style, equals(customStyle));
    });

    testWidgets('uses semantic labels for accessibility', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreTextButton(
          text: testText,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check for TextButton with proper semantics
      final buttonFinder = find.byType(TextButton);
      expect(buttonFinder, findsOneWidget);

      // Verify the button has tap actions
      final gesture = tester.getSemantics(buttonFinder);
      expect(gesture.hasFlag(SemanticsFlag.isButton), isTrue);
    });
  });
}
