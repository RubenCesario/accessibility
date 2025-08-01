import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:accessibility/src/view/widgets/shared/read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ReadMoreText', () {
    const shortText = 'This is a short text';
    const longText = '''
      This is a very long text that will definitely span multiple lines.
      It needs to be long enough to exceed the default max lines setting.
      Adding more text to ensure we have enough content to test both the
      expanded and collapsed states properly.
      We need enough text to make sure it wraps across multiple lines
      when rendered in the test environment.
    ''';

    // Helper function to simulate device orientation
    Widget buildWithOrientation({
      required Orientation orientation,
      int customMaxLines = 3,
    }) =>
        buildDefaultTestWidget(
          child: Builder(
            builder: (context) => MediaQuery(
              // Override the MediaQuery data to set the orientation
              data: MediaQuery.of(context).copyWith(
                size: Size(
                  orientation == Orientation.landscape ? 800 : 400,
                  orientation == Orientation.landscape ? 400 : 800,
                ),
              ),
              child: ReadMoreText(
                text: longText,
                maxLines: customMaxLines,
              ),
            ),
          ),
        );

    testWidgets('renders short text without read more button', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: shortText,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Short text should be fully visible
      expect(find.widgetWithText(AccessibleText, shortText), findsOneWidget);

      // Should not show read more/less buttons for short text
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('respects device orientation when setting maxLines',
        (tester) async {
      // Test with portrait orientation first
      await tester.pumpWidget(
        buildWithOrientation(
          orientation: Orientation.portrait,
          customMaxLines: 2,
        ),
      );
      await tester.pumpAndSettle();

      // Find the ReadMoreText widget to verify its maxLines in portrait mode
      final portraitReadMoreText = tester.widget<ReadMoreText>(
        find.byType(ReadMoreText),
      );

      // In portrait, should respect the provided maxLines (2 in this case)
      expect(portraitReadMoreText.maxLines, equals(2));

      // Now test with landscape orientation
      await tester.pumpWidget(
        buildWithOrientation(
          orientation: Orientation.landscape,
          customMaxLines: 2,
        ),
      );
      await tester.pumpAndSettle();

      // Find the ReadMoreText widget again to verify
      //its maxLines in landscape mode
      final landscapeReadMoreText = tester.widget<ReadMoreText>(
        find.byType(ReadMoreText),
      );

      // Expect different behavior in landscape
      // orientation - it should show more lines
      expect(landscapeReadMoreText.maxLines, equals(2));

      // This will get the internal build result where the
      // widget's maxLines property is used
      // to determine the actual displayed lines
      final textWidget = tester.widget<Text>(
        find
            .descendant(
              of: find.byType(ReadMoreText),
              matching: find.byType(Text),
            )
            .first,
      );

      // In landscape, the effective maxLines should
      // be influenced by orientation
      expect(textWidget.maxLines, isNot(equals(2)));
    });

    testWidgets('renders long text with read more button', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Long text should be rendered but truncated
      expect(find.widgetWithText(AccessibleText, longText), findsWidgets);

      // Should show a read more button
      expect(find.byType(TextButton), findsOneWidget);

      // Should contain "read more" text
      final l10n = tester.element(find.byType(ReadMoreText)).l10na;
      expect(find.widgetWithText(TextButton, l10n.read_more), findsWidgets);
    });

    testWidgets('expands text when read more is tapped', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Initially shows "read more" text
      final l10n = tester.element(find.byType(ReadMoreText)).l10na;
      expect(find.widgetWithText(TextButton, l10n.read_more), findsWidgets);

      // Tap the read more button
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Now should show "read less" text
      expect(find.widgetWithText(TextButton, l10n.read_less), findsWidgets);
      expect(find.widgetWithText(TextButton, l10n.read_more), findsNothing);

      // Should show the full text
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('collapses text when read less is tapped', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // First tap to expand
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      final l10n = tester.element(find.byType(ReadMoreText)).l10na;

      // Now tap to collapse
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Should show "read more" again
      expect(find.widgetWithText(TextButton, l10n.read_more), findsWidgets);
      expect(find.widgetWithText(TextButton, l10n.read_less), findsNothing);

      // Should no longer show ScrollView for full text
      expect(find.byType(SingleChildScrollView), findsNothing);
    });

    testWidgets('applies custom max lines', (tester) async {
      const customMaxLines = 1;

      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: customMaxLines,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the AccessibleText for truncated text
      final textWidget =
          find.byType(AccessibleText).evaluate().first.widget as AccessibleText;

      // Should have our custom max lines
      expect(textWidget.maxLines, equals(customMaxLines));
    });

    testWidgets('applies custom button alignment', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
          readMoreButtonAlignment: MainAxisAlignment.end,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the Row widget inside the button
      final row = tester.widget<Row>(
        find.descendant(
          of: find.byType(TextButton),
          matching: find.byType(Row),
        ),
      );

      // Should use the custom alignment
      expect(row.mainAxisAlignment, equals(MainAxisAlignment.end));
    });

    testWidgets('hides read more button icon when specified', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
          hasReadMoreButtonAnIcon: false,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should not show any icons
      expect(find.byIcon(Icons.arrow_right), findsNothing);
    });

    testWidgets('shows read more button icon by default', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should show the expand arrow icon
      expect(find.byIcon(Icons.arrow_right), findsOneWidget);
    });

    testWidgets('applies custom body text style', (tester) async {
      const customStyle = TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        color: Colors.indigo,
      );

      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
          bodyTextStyle: customStyle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // First AccessibleText widget should have our body style
      final textWidgets = tester
          .widgetList<AccessibleText>(
            find.byType(AccessibleText),
          )
          .toList();

      // The first widget should be our text content
      final contentTextWidget = textWidgets.first;
      expect(contentTextWidget.style, equals(customStyle));
    });

    testWidgets('applies custom button text style', (tester) async {
      const customStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        color: Colors.teal,
      );

      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 2,
          readMoreButtonTextStyle: customStyle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find all AccessibleText widgets
      final textWidgets = tester
          .widgetList<AccessibleText>(
            find.byType(AccessibleText),
          )
          .toList();

      // The second widget should be our button text
      final buttonTextWidget = textWidgets[1];
      expect(buttonTextWidget.style, equals(customStyle));
    });

    testWidgets('adjusts maxLines in landscape orientation', (tester) async {
      // Set landscape orientation
      tester.view.physicalSize = const Size(1000, 500);

      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // In landscape, maxLines should be reduced by 1
      final textWidget =
          find.byType(AccessibleText).evaluate().first.widget as AccessibleText;
      expect(textWidget.maxLines, equals(2)); // 3-1=2 in landscape

      // Reset for other tests
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
    });

    testWidgets('throws assertion error when maxLines is <= 0', (tester) async {
      expect(
        () => ReadMoreText(
          text: shortText,
          maxLines: 0,
        ),
        throwsA(
          isA<AssertionError>().having(
            (e) => e.message,
            'message',
            contains('Cannot have less than 1 line in a text'),
          ),
        ),
      );
    });

    testWidgets('respects maxLines=1 in landscape orientation', (tester) async {
      // Test with maxLines=1 which is a special case in the code
      // Set landscape orientation
      tester.view.physicalSize = const Size(1000, 500);

      final testWidget = buildDefaultTestWidget(
        child: const ReadMoreText(
          text: longText,
          maxLines: 1,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Even in landscape, with maxLines=1 it should remain 1
      final textWidget =
          find.byType(AccessibleText).evaluate().first.widget as AccessibleText;
      expect(textWidget.maxLines, equals(1));

      // Reset for other tests
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
    });
  });
}
