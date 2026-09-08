import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_cards.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_toggle_cards.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

void main() {
  testWidgets('TextScaleFactorCard steps up', (tester) async {
    final viewModel = await pumpMaterial(tester, const TextScaleFactorCard());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1.25);
  });

  testWidgets('WordSpacingCard steps up from the minimum when unset', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(tester, const WordSpacingCard());
    expect(viewModel.settings.textSettings.wordSpacing, isNull);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.wordSpacing, closeTo(1.125, 0.001));
  });

  testWidgets('LineHeightCard steps up', (tester) async {
    final viewModel = await pumpMaterial(tester, const LineHeightCard());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.lineHeight, closeTo(1.625, 0.001));
  });

  testWidgets('LetterSpacingCard steps up', (tester) async {
    final viewModel = await pumpMaterial(tester, const LetterSpacingCard());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.textSettings.letterSpacing,
      closeTo(0.625, 0.001),
    );
  });

  testWidgets('TextAlignCard sets and clears the alignment', (tester) async {
    final viewModel = await pumpMaterial(tester, const TextAlignCard());
    await tester.tap(find.byIcon(Icons.align_horizontal_center_outlined));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.center);
    await tester.tap(find.byIcon(Icons.align_horizontal_center_outlined));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.none);
  });

  testWidgets('BoldCard toggles bold text', (tester) async {
    final viewModel = await pumpMaterial(tester, const BoldCard());
    await tester.tap(find.bySemanticsLabel('Bold text'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.isBold, isTrue);
    await tester.tap(find.bySemanticsLabel('Bold text'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.isBold, isFalse);
  });

  testWidgets('FontCard enables and disables the registered font', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      const FontCard(),
      fonts: const [andika],
    );
    await tester.tap(find.bySemanticsLabel('Accessible font'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.fontFamily, 'Andika');
    await tester.tap(find.bySemanticsLabel('Accessible font'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.fontFamily, isNull);
  });
}
