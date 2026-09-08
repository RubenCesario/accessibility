import 'package:accessibility_material/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('EffectsModeSetting sets the effects mode', (tester) async {
    final viewModel = await pumpMaterial(tester, const EffectsModeSetting());
    expect(viewModel.settings.effectsMode, EffectsMode.system);
    await tester.tap(find.text('On'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.effectsMode, EffectsMode.enabled);
    await tester.tap(find.text('Off'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.effectsMode, EffectsMode.disabled);
    await tester.tap(find.text('System'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.effectsMode, EffectsMode.system);
  });
}
