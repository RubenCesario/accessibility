import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('TextScaleFactorSetting steps and slides', (tester) async {
    final viewModel = await pumpCupertino(
      tester,
      const TextScaleFactorSetting(),
    );
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1.25);
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1);
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1);
    // CupertinoSlider.hitTestSelf only accepts drags that start near the
    // thumb, not anywhere on the track; with value == min the thumb sits
    // at the track's left edge, not at the widget's geometric centre that
    // find.byType(...).drag() would use, so the drag starts there instead.
    final sliderRect = tester.getRect(find.byType(CupertinoSlider));
    await tester.dragFrom(
      Offset(sliderRect.left + 12, sliderRect.center.dy),
      const Offset(600, 0),
    );
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 2);
  });

  testWidgets('WordSpacingSetting starts at the minimum when unset', (
    tester,
  ) async {
    final viewModel = await pumpCupertino(tester, const WordSpacingSetting());
    expect(viewModel.settings.textSettings.wordSpacing, isNull);
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.wordSpacing, closeTo(1.125, 0.001));
  });

  testWidgets('LineHeightSetting and LetterSpacingSetting step', (
    tester,
  ) async {
    var viewModel = await pumpCupertino(tester, const LineHeightSetting());
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.lineHeight, closeTo(1.625, 0.001));
    viewModel = await pumpCupertino(tester, const LetterSpacingSetting());
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.textSettings.letterSpacing,
      closeTo(0.625, 0.001),
    );
  });
}
