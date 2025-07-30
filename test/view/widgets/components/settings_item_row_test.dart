import 'package:accessibility/src/view/widgets/components/settings_item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsItemRow', () {
    testWidgets('renders correctly with multiple items', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemRow(
          items: [
            MockSettingsItem(),
            MockSettingsItem(),
            MockSettingsItem(),
          ],
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(SettingsItemRow), findsOneWidget);
      expect(find.byType(MockSettingsItem), findsNWidgets(3));

      // Verify items are wrapped in Expanded
      expect(
        find.ancestor(
          of: find.byType(MockSettingsItem),
          matching: find.byType(Expanded),
        ),
        findsNWidgets(3),
      );
    });

    testWidgets('wraps row in padding', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemRow(
          items: [
            MockSettingsItem(),
          ],
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the Row is wrapped in Padding
      expect(
        find.ancestor(
          of: find.byType(Row),
          matching: find.byType(Padding),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders with no items', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemRow(
          items: [],
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should render without errors
      expect(find.byType(SettingsItemRow), findsOneWidget);
      expect(find.byType(MockSettingsItem), findsNothing);
    });

    testWidgets('renders items with equal width', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemRow(
          items: [
            MockSettingsItem(),
            MockSettingsItem(),
          ],
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // All items should be wrapped in Expanded
      final expandedWidgets = tester
          .widgetList<Expanded>(
            find.byType(Expanded),
          )
          .toList();

      // They should all have flex = 1 (equal width)
      expect(expandedWidgets.length, 2);
      expect(expandedWidgets[0].flex, 1);
      expect(expandedWidgets[1].flex, 1);
    });
  });
}
