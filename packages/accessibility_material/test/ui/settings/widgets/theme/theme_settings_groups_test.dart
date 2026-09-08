import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_card_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_standard_group.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

Widget scoped(
  Widget group, {
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
  AccessibilitySettingsStyle style = AccessibilitySettingsStyle.standard,
}) => PanelScope(
  configuration: configuration,
  style: style,
  child: CustomScrollView(slivers: [group]),
);

void main() {
  testWidgets('the standard group shows every item by default', (tester) async {
    await pumpMaterial(tester, scoped(const ThemeSettingsStandardGroup()));
    expect(find.byType(ThemeProfileSetting), findsNWidgets(3));
    expect(find.byType(ThemeModeSetting), findsOneWidget);
    expect(find.byType(EffectsModeSetting), findsOneWidget);
  });

  testWidgets('the standard group honours the configuration', (tester) async {
    await pumpMaterial(
      tester,
      scoped(
        const ThemeSettingsStandardGroup(),
        configuration: const AccessibilitySettingsConfiguration(
          showThemeProfileSeizureSafe: false,
          showThemeProfileAdhdFriendly: false,
          showEffectsSetting: false,
        ),
      ),
    );
    expect(find.byType(ThemeProfileSetting), findsOneWidget);
    expect(find.byType(EffectsModeSetting), findsNothing);
  });

  testWidgets('the cards group shows the none card plus the enabled ones', (
    tester,
  ) async {
    await pumpMaterial(
      tester,
      scoped(
        const ThemeSettingsCardGroup(),
        style: AccessibilitySettingsStyle.cards,
        configuration: const AccessibilitySettingsConfiguration(
          showThemeProfileVisionImpaired: false,
        ),
      ),
    );
    expect(find.byType(ThemeProfileCard), findsNWidgets(3));
    expect(find.byType(ThemeModeSetting), findsOneWidget);
    expect(find.byType(EffectsModeSetting), findsOneWidget);
  });
}
