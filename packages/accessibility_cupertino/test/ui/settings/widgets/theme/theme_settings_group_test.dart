import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget buildGroup(
  AccessibilitySettingsStyle style, [
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: style,
  // `ThemeSettingsGroup` is a box widget, not a sliver, and the standard
  // style's expansion tiles do not fit the fixed test viewport; a real
  // panel scrolls it (see `CupertinoAccessibilitySettingsPanel`).
  child: const SingleChildScrollView(child: ThemeSettingsGroup()),
);

void main() {
  group('ThemeSettingsGroup', () {
    testWidgets('lists the three profiles and the two modes', (tester) async {
      await pumpCupertino(
        tester,
        buildGroup(AccessibilitySettingsStyle.standard),
      );
      expect(find.byType(ThemeProfileSetting), findsNWidgets(3));
      expect(find.byType(CupertinoSwitch), findsNWidgets(3));
      expect(find.byType(ThemeModeSetting), findsOneWidget);
      expect(find.byType(EffectsModeSetting), findsOneWidget);
      expect(find.byType(CupertinoListSection), findsOneWidget);
    });

    testWidgets('adds the none tile in the cards style', (tester) async {
      await pumpCupertino(tester, buildGroup(AccessibilitySettingsStyle.cards));
      expect(find.byType(ThemeProfileSetting), findsNWidgets(4));
      expect(find.byType(CupertinoSwitch), findsNothing);
      expect(find.text('Default profile'), findsOneWidget);
    });

    testWidgets('hides settings on request and collapses when empty', (
      tester,
    ) async {
      await pumpCupertino(
        tester,
        buildGroup(
          AccessibilitySettingsStyle.standard,
          const AccessibilitySettingsConfiguration(
            showThemeProfileSeizureSafe: false,
            showThemeProfileVisionImpaired: false,
            showEffectsSetting: false,
          ),
        ),
      );
      expect(find.byType(ThemeProfileSetting), findsOneWidget);
      expect(find.byType(EffectsModeSetting), findsNothing);
      await pumpCupertino(
        tester,
        buildGroup(
          AccessibilitySettingsStyle.standard,
          const AccessibilitySettingsConfiguration(
            showThemeProfileSeizureSafe: false,
            showThemeProfileVisionImpaired: false,
            showThemeProfileAdhdFriendly: false,
            showThemeModeSetting: false,
            showEffectsSetting: false,
          ),
        ),
      );
      expect(find.byType(CupertinoListSection), findsNothing);
    });
  });
}
