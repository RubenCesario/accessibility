import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('TextAlignSetting sets and clears the alignment', (tester) async {
    final viewModel = await pumpCupertino(tester, const TextAlignSetting());
    expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
    await tester.tap(find.text('Align center'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.center);
    expect(find.byIcon(CupertinoIcons.check_mark), findsOneWidget);
    await tester.tap(find.text('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.right);
    await tester.tap(find.text('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.none);
    expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
  });
}
