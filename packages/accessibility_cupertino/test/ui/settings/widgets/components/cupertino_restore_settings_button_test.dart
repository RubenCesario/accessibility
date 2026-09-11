import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_restore_settings_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  group('CupertinoRestoreSettingsButton', () {
    testWidgets('restores the defaults', (tester) async {
      final service = FakeAccessibilityStorageService(
        initial: AccessibilitySettingsSamples.everythingSet,
      );
      final viewModel = await pumpCupertino(
        tester,
        const CupertinoRestoreSettingsButton(),
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
      await pumpCupertino(
        tester,
        PanelScope(
          configuration: AccessibilitySettingsConfiguration(
            onRestoreSettings: () => called++,
          ),
          style: AccessibilitySettingsStyle.standard,
          child: const CupertinoRestoreSettingsButton(),
        ),
      );
      await tester.tap(find.byType(CupertinoButton));
      await tester.pumpAndSettle();
      expect(called, 1);
    });
  });
}
