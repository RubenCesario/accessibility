import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('TextAlignSetting sets and clears the alignment', (tester) async {
    final viewModel = await pumpMaterial(tester, const TextAlignSetting());
    await tester.tap(find.bySemanticsLabel('Align center'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.center);
    await tester.tap(find.bySemanticsLabel('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.right);
    await tester.tap(find.bySemanticsLabel('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.none);
  });
}
