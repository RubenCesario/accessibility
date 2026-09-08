import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('TextScaleFactorSetting steps and slides', (tester) async {
    final viewModel = await pumpMaterial(
      tester,
      const TextScaleFactorSetting(),
    );
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1.25);
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1);
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1);
    await tester.drag(find.byType(Slider), const Offset(600, 0));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 2);
  });

  testWidgets('WordSpacingSetting starts at the minimum when unset', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(tester, const WordSpacingSetting());
    expect(viewModel.settings.textSettings.wordSpacing, isNull);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.wordSpacing, closeTo(1.125, 0.001));
  });

  testWidgets('LineHeightSetting and LetterSpacingSetting step', (
    tester,
  ) async {
    var viewModel = await pumpMaterial(tester, const LineHeightSetting());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.lineHeight, closeTo(1.625, 0.001));
    viewModel = await pumpMaterial(tester, const LetterSpacingSetting());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.textSettings.letterSpacing,
      closeTo(0.625, 0.001),
    );
  });
}
