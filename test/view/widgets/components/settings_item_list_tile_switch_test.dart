import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_list_tile_switch.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsItemListTileSwitch', () {
    const testTitle = 'Test Switch Title';
    const testSubtitle = 'Test Switch Subtitle';
    const testIcon = Icons.settings;

    testWidgets('renders correctly with title, subtitle and setting',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(SettingsItemListTileSwitch), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders with icon when provided', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          icon: testIcon,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the icon is rendered
      expect(find.byIcon(testIcon), findsOneWidget);

      // Check icon size
      final icon = tester.widget<Icon>(find.byIcon(testIcon));
      expect(icon.size, equals(IconSize.medium));
    });

    testWidgets('uses accessible text for title and subtitle', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify accessible text widgets are used
      final accessibleTexts = tester
          .widgetList<AccessibleText>(
            find.byType(AccessibleText),
          )
          .toList();

      expect(accessibleTexts.length, equals(2)); // Title and subtitle

      // Find texts by content
      final titleText = tester.widget<AccessibleText>(
        find.ancestor(
          of: find.text(testTitle),
          matching: find.byType(AccessibleText),
        ),
      );

      final subtitleText = tester.widget<AccessibleText>(
        find.ancestor(
          of: find.text(testSubtitle),
          matching: find.byType(AccessibleText),
        ),
      );

      expect(titleText.data, equals(testTitle));
      expect(subtitleText.data, equals(testSubtitle));
    });

    testWidgets('places setting in trailing position', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the ListTile
      final listTile = tester.widget<ListTile>(find.byType(ListTile));

      // Verify the setting is in the trailing position
      expect(listTile.trailing.runtimeType, equals(MockSettingsItem));
    });

    testWidgets('has proper border radius on container', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find ClipRRect and check its border radius
      final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
      expect(clipRRect.borderRadius, equals(BorderRadius.circular(15)));
    });

    testWidgets('applies different padding when icon is present vs absent',
        (tester) async {
      // Test with no icon
      final testWidgetNoIcon = buildDefaultTestWidget(
        child: const SettingsItemListTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidgetNoIcon);
      await tester.pumpAndSettle();

      // Find padding when no icon
      final paddingNoIcon = tester.widget<Padding>(
        find
            .descendant(
              of: find.byType(ClipRRect),
              matching: find.byType(Padding),
            )
            .first,
      );

      // Should have top padding when no icon
      expect(paddingNoIcon.padding, isNot(equals(EdgeInsets.zero)));

      // Test with icon
      final testWidgetWithIcon = buildDefaultTestWidget(
        child: const SettingsItemListTileSwitch(
          title: testTitle,
          subtitle: testSubtitle,
          icon: testIcon,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidgetWithIcon);
      await tester.pumpAndSettle();

      // Find padding when icon is present
      final paddingWithIcon = tester.widget<Padding>(
        find
            .descendant(
              of: find.byType(ClipRRect),
              matching: find.byType(Padding),
            )
            .first,
      );

      // Should have zero padding when icon is present
      expect(paddingWithIcon.padding, equals(EdgeInsets.zero));
    });
  });
}
