import 'package:accessibility_cupertino/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/font_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

void main() {
  testWidgets('BoldSetting toggles bold text', (tester) async {
    final viewModel = await pumpCupertino(tester, const BoldSetting());
    await tester.tap(find.byType(CupertinoSwitch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.isBold, isTrue);
  });

  testWidgets('FontSetting enables and disables the registered font', (
    tester,
  ) async {
    final viewModel = await pumpCupertino(
      tester,
      const FontSetting(),
      fonts: const [andika],
    );
    await tester.tap(find.byType(CupertinoSwitch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.fontFamily, 'Andika');
    expect(viewModel.activeFont, andika);
    await tester.tap(find.byType(CupertinoSwitch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.fontFamily, isNull);
  });
}
