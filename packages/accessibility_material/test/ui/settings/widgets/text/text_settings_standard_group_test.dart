import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/font_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_settings_standard_group.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

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
  testWidgets('the group shows every item but the font setting by default', (
    tester,
  ) async {
    await pumpMaterial(tester, scoped(const TextSettingsStandardGroup()));
    expect(find.byType(TextAlignSetting), findsOneWidget);
    expect(find.byType(BoldSetting), findsOneWidget);
    expect(find.byType(FontSetting), findsNothing);
    expect(find.byType(TextScaleFactorSetting), findsOneWidget);
    expect(find.byType(WordSpacingSetting), findsOneWidget);
    expect(find.byType(LineHeightSetting), findsOneWidget);
    expect(find.byType(LetterSpacingSetting), findsOneWidget);
  });

  testWidgets('the font setting shows once a font is registered', (
    tester,
  ) async {
    await pumpMaterial(
      tester,
      scoped(const TextSettingsStandardGroup()),
      fonts: const [andika],
    );
    expect(find.byType(FontSetting), findsOneWidget);
  });

  testWidgets('the group honours the configuration', (tester) async {
    await pumpMaterial(
      tester,
      scoped(
        const TextSettingsStandardGroup(),
        configuration: const AccessibilitySettingsConfiguration(
          showTextScaleFactorSetting: false,
          showTextAlignSetting: false,
        ),
      ),
    );
    expect(find.byType(TextScaleFactorSetting), findsNothing);
    expect(find.byType(TextAlignSetting), findsNothing);
    expect(find.byType(BoldSetting), findsOneWidget);
  });
}
