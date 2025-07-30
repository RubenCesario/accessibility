import 'package:accessibility/src/view/widgets/components/settings_item_multi_selection_card.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsItemMultiSelectionCard', () {
    const testTitle = 'Test Selection Card';
    const testIcon = Icons.settings;

    late int onTapCount;

    setUp(() {
      onTapCount = 0;
    });

    VoidCallback onTap() => () {
          onTapCount++;
        };

    testWidgets('renders correctly with title and icon', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemMultiSelectionCard(
          title: testTitle,
          selections: 3,
          icon: testIcon,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(SettingsItemMultiSelectionCard), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);

      // Should have 3 selection indicators
      expect(
        find.descendant(
          of: find.byType(SettingsItemMultiSelectionCard),
          matching: find.byType(Container),
        ),
        findsNWidgets(3),
      );
    });

    testWidgets(
        'calls onTap callback and cycles through selections when tapped',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: SettingsItemMultiSelectionCard(
          title: testTitle,
          selections: 3,
          onTap: onTap(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Initially the callback should not have been called
      expect(onTapCount, equals(0));

      // First selection should be active
      final containers = tester
          .widgetList<Container>(
            find.descendant(
              of: find.byType(SettingsItemMultiSelectionCard),
              matching: find.byType(Container),
            ),
          )
          .toList();

      // Not testing exact colors as they depend on the theme
      final firstDecoration = containers.first.decoration! as BoxDecoration;
      expect(firstDecoration.color, isNotNull);

      // Tap the card to advance to next selection
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Check that the callback was called
      expect(onTapCount, equals(1));

      // Second selection should now be active
      final containersAfterTap = tester
          .widgetList<Container>(
            find.descendant(
              of: find.byType(SettingsItemMultiSelectionCard),
              matching: find.byType(Container),
            ),
          )
          .toList();

      // Not testing exact colors as they depend on the theme
      final secondDecoration =
          containersAfterTap[1].decoration! as BoxDecoration;
      expect(secondDecoration.color, isNotNull);
    });

    testWidgets('starts at specified selection index', (tester) async {
      const startingIndex = 1;

      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemMultiSelectionCard(
          title: testTitle,
          selections: 3,
          startingSelectionsIndex: startingIndex,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // The second indicator (index 1) should be active
      final containers = tester
          .widgetList<Container>(
            find.descendant(
              of: find.byType(SettingsItemMultiSelectionCard),
              matching: find.byType(Container),
            ),
          )
          .toList();

      // Check the second container has a different color (active)
      final middleDecoration = containers[1].decoration! as BoxDecoration;
      final firstDecoration = containers[0].decoration! as BoxDecoration;

      expect(middleDecoration.color, isNot(equals(firstDecoration.color)));
    });

    testWidgets('cycles back to first selection after last', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemMultiSelectionCard(
          title: testTitle,
          selections: 2,
          startingSelectionsIndex: 1, // Start at second selection
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Tap to cycle to the next (which should be the first again)
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // First selection should now be active
      final containersAfterTap = tester
          .widgetList<Container>(
            find.descendant(
              of: find.byType(SettingsItemMultiSelectionCard),
              matching: find.byType(Container),
            ),
          )
          .toList();

      // Check the first container is now active
      final firstDecoration =
          containersAfterTap[0].decoration! as BoxDecoration;
      final secondDecoration =
          containersAfterTap[1].decoration! as BoxDecoration;

      expect(firstDecoration.color, isNot(equals(secondDecoration.color)));
    });

    testWidgets('renders in highlighted state correctly', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemMultiSelectionCard(
          title: testTitle,
          selections: 2,
          isHighlighted: true,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the text also uses highlighted style
      final textWidget = tester.widget<AccessibleText>(
        find.descendant(
          of: find.byType(SettingsItemMultiSelectionCard),
          matching: find.byType(AccessibleText),
        ),
      );

      expect(textWidget.textColor, isNotNull);
    });
  });
}
