import 'package:accessibility_cupertino/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/circle_color.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

const teal = ColorSwatch<int>(0xFF009688, {
  500: Color(0xFF009688),
  900: Color(0xFF004D40),
});

Widget inPanel(
  Widget child, [
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.standard,
  child: child,
);

void main() {
  testWidgets('TextColorSetting sets the text colour from the palette', (
    tester,
  ) async {
    final viewModel = await pumpCupertino(
      tester,
      inPanel(const TextColorSetting()),
    );
    expect(find.text('Adjust text colors'), findsOneWidget);
    expect(find.byType(CircleColor), findsNWidgets(19));
    await tester.tap(
      find.bySemanticsLabel('Change the color of the text to:  Red'),
    );
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.color, 0xFFF44336);
  });

  testWidgets('BackgroundColorSetting uses the configured candidates', (
    tester,
  ) async {
    final viewModel = await pumpCupertino(
      tester,
      inPanel(
        const BackgroundColorSetting(),
        const AccessibilitySettingsConfiguration(
          backgroundColorCandidates: [teal],
          backgroundColorAllowPickingShades: false,
        ),
      ),
    );
    expect(find.text('Adjust background colors'), findsOneWidget);
    expect(find.byType(CircleColor), findsOneWidget);
    await tester.tap(find.byType(CircleColor));
    await tester.pumpAndSettle();
    expect(viewModel.settings.colorSettings.backgroundColor, 0xFF009688);
    expect(find.byType(CircleColor), findsOneWidget);
  });
}
