import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_restore_settings_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/cupertino_accessibility_settings_panel.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_cupertino.dart';

void main() {
  group('CupertinoAccessibilitySettingsPanel', () {
    testWidgets('renders the status card, the groups and the button', (
      tester,
    ) async {
      await pumpCupertino(tester, const CupertinoAccessibilitySettingsPanel());
      expect(find.byType(StatusCard, skipOffstage: false), findsOneWidget);
      expect(
        find.byType(ThemeSettingsGroup, skipOffstage: false),
        findsOneWidget,
      );
      expect(
        find.byType(ColorSettingsGroup, skipOffstage: false),
        findsOneWidget,
      );
      expect(
        find.byType(TextSettingsGroup, skipOffstage: false),
        findsOneWidget,
      );
      expect(
        find.byType(CupertinoRestoreSettingsButton, skipOffstage: false),
        findsOneWidget,
      );
      expect(find.byType(CustomScrollView), findsOneWidget);
    });

    testWidgets('provides its style and configuration to the items', (
      tester,
    ) async {
      const configuration = AccessibilitySettingsConfiguration(
        showBoldSetting: false,
      );
      await pumpCupertino(
        tester,
        const CupertinoAccessibilitySettingsPanel(
          style: AccessibilitySettingsStyle.cards,
          configuration: configuration,
        ),
      );
      // StatusCard renders SizedBox.shrink() once loaded; inside a sliver a
      // zero-extent child reports SliverGeometry.visible == false, which
      // Viewport.debugVisitOnstageChildren treats as offstage, so the
      // default skipOffstage would find nothing here.
      final scope = PanelScope.of(
        tester.element(find.byType(StatusCard, skipOffstage: false)),
      );
      expect(scope.style, AccessibilitySettingsStyle.cards);
      expect(scope.configuration, configuration);
    });

    testWidgets('hides the groups on request', (tester) async {
      await pumpCupertino(
        tester,
        const CupertinoAccessibilitySettingsPanel(
          configuration: AccessibilitySettingsConfiguration(
            showThemeSettingsGroup: false,
            showColorSettingsGroup: false,
            showTextSettingsGroup: false,
          ),
        ),
      );
      expect(
        find.byType(ThemeSettingsGroup, skipOffstage: false),
        findsNothing,
      );
      expect(
        find.byType(ColorSettingsGroup, skipOffstage: false),
        findsNothing,
      );
      expect(find.byType(TextSettingsGroup, skipOffstage: false), findsNothing);
    });
  });
}
