import 'package:accessibility_material/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('ColorProfileSetting cycles to the next profile', (tester) async {
    final viewModel = await pumpMaterial(tester, const ColorProfileSetting());
    expect(find.bySemanticsLabel('Normal'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Normal'));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.colorSettings.colorProfile,
      ColorProfileLevel.lowSaturation,
    );
    expect(find.bySemanticsLabel('Low saturation'), findsOneWidget);
  });
}
