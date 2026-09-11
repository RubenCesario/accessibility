import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('ThemeProfileSetting applies and clears the profile', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      const ThemeProfileSetting(level: ThemeProfileLevel.seizureSafe),
    );
    expect(find.text('Seizure safe profile'), findsOneWidget);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(viewModel.settings, AccessibilitySettingsSamples.seizureSafe);
    expect(
      viewModel.settings.matchingThemeProfile,
      ThemeProfileLevel.seizureSafe,
    );
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
  });

  testWidgets('ThemeProfileSetting reflects a profile set elsewhere', (
    tester,
  ) async {
    await pumpMaterial(
      tester,
      const ThemeProfileSetting(level: ThemeProfileLevel.visionImpaired),
      initial: AccessibilitySettingsSamples.visionImpaired,
    );
    expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
  });
}
