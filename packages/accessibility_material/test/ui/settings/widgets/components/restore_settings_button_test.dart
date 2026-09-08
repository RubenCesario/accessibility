import 'package:accessibility_material/src/ui/settings/widgets/components/restore_settings_button.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  group('RestoreSettingsButton', () {
    testWidgets('restores the defaults', (tester) async {
      final service = FakeAccessibilityStorageService(
        initial: AccessibilitySettingsSamples.everythingSet,
      );
      final viewModel = await pumpMaterial(
        tester,
        const RestoreSettingsButton(),
        service: service,
      );
      expect(viewModel.settings, AccessibilitySettingsSamples.everythingSet);
      await tester.tap(find.text('Restore settings'));
      await tester.pumpAndSettle();
      expect(viewModel.settings, AccessibilitySettings.defaults);
      expect(service.stored, isNull);
    });

    testWidgets('then calls the panel callback', (tester) async {
      var called = 0;
      await pumpMaterial(
        tester,
        PanelScope(
          configuration: AccessibilitySettingsConfiguration(
            onRestoreSettings: () => called++,
          ),
          style: AccessibilitySettingsStyle.standard,
          child: const RestoreSettingsButton(),
        ),
      );
      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();
      expect(called, 1);
    });
  });
}
