import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget inPanel(AccessibilitySettingsStyle style, Widget child) => PanelScope(
  configuration: const AccessibilitySettingsConfiguration(),
  style: style,
  child: child,
);

void main() {
  group('SettingsTile', () {
    testWidgets('is a plain tile outside a panel and in the standard style', (
      tester,
    ) async {
      await pumpCupertino(
        tester,
        const SettingsTile(
          title: 'Title',
          subtitle: 'Sub',
          additionalInfo: '1',
        ),
      );
      expect(find.byType(CupertinoListTile), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(
        tester.widget<Text>(find.text('Sub')).style?.color,
        kPanelSecondaryTextColor,
      );
      expect(
        tester.widget<Text>(find.text('1')).style?.color,
        kPanelSecondaryTextColor,
      );
      await pumpCupertino(
        tester,
        inPanel(
          AccessibilitySettingsStyle.standard,
          const SettingsTile(title: 'Title'),
        ),
      );
      expect(
        tester
            .widget<CupertinoListTile>(find.byType(CupertinoListTile))
            .leadingSize,
        28,
      );
    });

    testWidgets('is a notched tile in the cards style', (tester) async {
      await pumpCupertino(
        tester,
        inPanel(
          AccessibilitySettingsStyle.cards,
          const SettingsTile(title: 'Title', icon: CupertinoIcons.gear),
        ),
      );
      expect(
        tester
            .widget<CupertinoListTile>(find.byType(CupertinoListTile))
            .leadingSize,
        30,
      );
      expect(find.byIcon(CupertinoIcons.gear), findsOneWidget);
    });

    testWidgets('taps and exposes the selected state', (tester) async {
      var taps = 0;
      await pumpCupertino(
        tester,
        SettingsTile(title: 'Title', selected: true, onTap: () => taps++),
      );
      await tester.tap(find.text('Title'));
      expect(taps, 1);
      final semantics = tester.getSemantics(find.text('Title'));
      expect(semantics.flagsCollection.isSelected.toBoolOrNull(), isTrue);
      expect(
        semantics.getSemanticsData().hasAction(SemanticsAction.tap),
        isTrue,
      );
    });
  });
}
