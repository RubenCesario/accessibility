import 'package:accessibility/src/view/widgets/components/settings_item_list_tile_slider.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsItemListTileSlider', () {
    const testTitle = 'Test Slider Title';
    const testSubtitle = 'Test Slider Subtitle';

    testWidgets('renders correctly with all components', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSlider(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(SettingsItemListTileSlider), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('uses accessible text for title and subtitle', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSlider(
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

    testWidgets('renders setting below the list tile', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSlider(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the Column that contains both ListTile and the setting
      final column = tester.widget<Column>(find.byType(Column));

      // Verify the column contains both ListTile and TestSliderItem
      expect(column.children.length, equals(2));
      expect(column.children[0].runtimeType, equals(ListTile));
      expect(column.children[1].runtimeType, equals(MockSettingsItem));
    });

    testWidgets('has proper border radius on container', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSlider(
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

    testWidgets('applies padding to title', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemListTileSlider(
          title: testTitle,
          subtitle: testSubtitle,
          setting: MockSettingsItem(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the Padding around the title
      final padding = tester.widget<Padding>(
        find
            .ancestor(
              of: find.byType(AccessibleText),
              matching: find.byType(Padding),
            )
            .first,
      );

      // Verify padding is applied
      expect(padding.padding, isNotNull);
    });
  });
}
