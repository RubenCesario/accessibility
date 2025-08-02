import 'package:accessibility/src/view/widgets/components/settings_group.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart' show CustomScrollView;
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsGroup', () {
    const testGroupTitle = 'Group Title';

    testWidgets('renders correctly with title and items', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const CustomScrollView(
          slivers: [
            SettingsGroup(
              title: testGroupTitle,
              settings: [
                SettingsItemCard(
                  title: 'Test Item',
                ),
                SettingsItemCard(
                  title: 'Test Item',
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(SettingsGroup), findsOneWidget);
      expect(find.byType(SettingsItemCard), findsNWidgets(2));
    });

    testWidgets('uses accessible text for title', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const CustomScrollView(
          slivers: [
            SettingsGroup(
              title: testGroupTitle,
              settings: [
                SettingsItemCard(
                  title: 'Test Item 1',
                ),
                SettingsItemCard(
                  title: 'Test Item 2',
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final titleText = find.descendant(
        of: find.byType(SettingsGroup),
        matching: find.byType(AccessibleText).first,
      );
      expect(titleText, findsOneWidget);

      final accessibleText = tester.widget<AccessibleText>(titleText);
      expect(accessibleText.data, equals(testGroupTitle));
    });

    testWidgets('renders with empty children', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const CustomScrollView(
          slivers: [
            SettingsGroup(
              title: testGroupTitle,
              settings: [], // No children
            ),
          ],
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(SettingsGroup), findsOneWidget);
      expect(find.byType(SettingsItemCard), findsNothing);
    });
  });
}
