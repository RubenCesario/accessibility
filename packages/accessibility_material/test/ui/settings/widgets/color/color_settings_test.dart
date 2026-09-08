import 'package:accessibility_material/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/circle_color.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

Widget inPanel(
  Widget child, {
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
}) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.standard,
  child: child,
);

void main() {
  testWidgets('TextColorSetting sets and clears the text colour', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      inPanel(const TextColorSetting()),
    );
    await tester.tap(
      find.bySemanticsLabel('Change the color of the text to:  Red'),
    );
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.color, Colors.red.toARGB32());
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.color, isNull);
  });

  testWidgets('BackgroundColorSetting uses the configured candidates', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      inPanel(
        const BackgroundColorSetting(),
        configuration: const AccessibilitySettingsConfiguration(
          backgroundColorCandidates: [Colors.teal],
          backgroundColorAllowPickingShades: false,
        ),
      ),
    );
    expect(find.byType(CircleColor), findsOneWidget);
    await tester.tap(find.byType(CircleColor));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.colorSettings.backgroundColor,
      Colors.teal.toARGB32(),
    );
  });
}
