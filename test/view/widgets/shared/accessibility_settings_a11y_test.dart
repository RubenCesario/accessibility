import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_scale_factor_settings_item.dart';
import 'package:accessibility/src/view/widgets/shared/accessibility_settings.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

Future<void> _pumpSettings(WidgetTester tester) async {
  await tester.pumpWidget(
    buildDefaultTestWidget(
      // Use the full configuration so every control is exercised.
      child: const AccessibilitySettings(
        configuration: AccessibilitySettingsConfiguration.all,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AccessibilitySettings accessibility guidelines', () {
    testWidgets('all interactive elements expose a semantic label',
        (tester) async {
      final handle = tester.ensureSemantics();
      await _pumpSettings(tester);
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      handle.dispose();
    });

    testWidgets('tap targets meet the minimum size (48x48)', (tester) async {
      final handle = tester.ensureSemantics();
      await _pumpSettings(tester);
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      handle.dispose();
    });

    testWidgets('text meets the minimum contrast ratio', (tester) async {
      final handle = tester.ensureSemantics();
      await _pumpSettings(tester);
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      handle.dispose();
    });

    testWidgets('font size slider is labelled "Font size" (regression)',
        (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        buildDefaultTestWidget(child: const TextScaleFactorSettingsItem()),
      );
      await tester.pumpAndSettle();
      expect(find.bySemanticsLabel('Font size'), findsOneWidget);
      expect(find.bySemanticsLabel('Slider Letter spacing'), findsNothing);
      handle.dispose();
    });
  });
}
