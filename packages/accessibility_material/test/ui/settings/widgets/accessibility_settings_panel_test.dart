import 'package:accessibility_material/src/ui/settings/widgets/accessibility_settings_panel.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/restore_settings_button.dart';
import 'package:accessibility_material/src/ui/settings/widgets/status_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_material.dart';

void main() {
  group('AccessibilitySettingsPanel', () {
    testWidgets('renders the status card and the restore button', (
      tester,
    ) async {
      await pumpMaterial(tester, const AccessibilitySettingsPanel());
      // The status card renders a zero-size box once loaded, which the
      // viewport treats as offstage; skipOffstage: false still finds it.
      expect(find.byType(StatusCard, skipOffstage: false), findsOneWidget);
      expect(find.byType(RestoreSettingsButton), findsOneWidget);
    });
  });
}
