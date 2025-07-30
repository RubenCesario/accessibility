import 'package:accessibility/src/view/widgets/components/settings_item_expansion_tile_switch.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:accessibility/src/view/widgets/shared/read_more_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsItemExpansionTileSwitch', () {
    const testTitle = 'Test Title';
    const testSubtitle = 'Test Subtitle';
    const testExpansionDescription =
        'This is a longer description that explains the setting in more detail';

    testWidgets('renders correctly with all components', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemExpansionTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          expansionDescription: testExpansionDescription,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(SettingsItemExpansionTileSwitch), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(ReadMoreTextButton), findsOneWidget);
    });

    testWidgets('uses accessible text for title and subtitle', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemExpansionTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          expansionDescription: testExpansionDescription,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify accessible text widgets are used
      final accessibleTexts = tester
          .widgetList<AccessibleText>(find.byType(AccessibleText))
          .toList();

      expect(accessibleTexts.length, equals(3));

      final titleText = accessibleTexts.first;
      final subtitleText = accessibleTexts[1];

      expect(titleText.data, equals(testTitle));
      expect(subtitleText.data, equals(testSubtitle));
    });

    testWidgets('passes expansion description to read more button',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemExpansionTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          expansionDescription: testExpansionDescription,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final readMoreButton = tester.widget<ReadMoreTextButton>(
        find.byType(ReadMoreTextButton),
      );

      expect(readMoreButton.text, equals(testExpansionDescription));
    });

    testWidgets('renders setting in trailing position', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemExpansionTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          expansionDescription: testExpansionDescription,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final listTile = tester.widget<ListTile>(find.byType(ListTile));
      expect(listTile.trailing.runtimeType, equals(MockSettingsItem));
    });

    testWidgets('has proper border radius on container', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemExpansionTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          expansionDescription: testExpansionDescription,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
      expect(clipRRect.borderRadius, equals(BorderRadius.circular(15)));
    });
  });
}
