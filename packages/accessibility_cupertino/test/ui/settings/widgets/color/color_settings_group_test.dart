import 'package:accessibility_cupertino/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget buildGroup([
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.cards,
  child: const SingleChildScrollView(child: ColorSettingsGroup()),
);

void main() {
  group('ColorSettingsGroup', () {
    testWidgets('lists the three colour settings under its title', (
      tester,
    ) async {
      await pumpCupertino(tester, buildGroup());
      expect(find.text('Color adjustment'), findsOneWidget);
      expect(find.byType(ColorProfileSetting), findsOneWidget);
      expect(find.byType(TextColorSetting), findsOneWidget);
      expect(find.byType(BackgroundColorSetting), findsOneWidget);
      expect(find.byType(CupertinoListSection), findsOneWidget);
    });

    testWidgets('hides settings on request', (tester) async {
      await pumpCupertino(
        tester,
        buildGroup(
          const AccessibilitySettingsConfiguration(
            showColorProfileSetting: false,
            showBackgroundColorSetting: false,
          ),
        ),
      );
      expect(find.byType(ColorProfileSetting), findsNothing);
      expect(find.byType(TextColorSetting), findsOneWidget);
      expect(find.byType(BackgroundColorSetting), findsNothing);
    });
  });
}
