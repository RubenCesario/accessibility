import 'package:accessibility_material/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

Widget scoped(
  Widget group, {
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
}) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.standard,
  child: CustomScrollView(slivers: [group]),
);

void main() {
  testWidgets('the group shows every item by default', (tester) async {
    await pumpMaterial(tester, scoped(const ColorSettingsGroup()));
    expect(find.byType(ColorProfileSetting), findsOneWidget);
    expect(find.byType(TextColorSetting), findsOneWidget);
    expect(find.byType(BackgroundColorSetting), findsOneWidget);
  });

  testWidgets('the group honours the configuration', (tester) async {
    await pumpMaterial(
      tester,
      scoped(
        const ColorSettingsGroup(),
        configuration: const AccessibilitySettingsConfiguration(
          showTextColorSetting: false,
        ),
      ),
    );
    expect(find.byType(ColorProfileSetting), findsOneWidget);
    expect(find.byType(TextColorSetting), findsNothing);
    expect(find.byType(BackgroundColorSetting), findsOneWidget);
  });
}
