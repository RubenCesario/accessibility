import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('ColorProfileSetting cycles to the next profile', (tester) async {
    final viewModel = await pumpCupertino(tester, const ColorProfileSetting());
    expect(find.text('Normal'), findsOneWidget);
    expect(find.text('1/5'), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.paintbrush), findsOneWidget);
    await tester.tap(find.text('Normal'));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.colorSettings.colorProfile,
      ColorProfileLevel.lowSaturation,
    );
    expect(find.text('Low saturation'), findsOneWidget);
    expect(find.text('2/5'), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.circle), findsOneWidget);
  });
}
