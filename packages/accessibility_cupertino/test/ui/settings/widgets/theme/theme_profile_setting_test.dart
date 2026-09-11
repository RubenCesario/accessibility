import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget cards(Widget child) => PanelScope(
  configuration: const AccessibilitySettingsConfiguration(),
  style: AccessibilitySettingsStyle.cards,
  child: child,
);

void main() {
  group('ThemeProfileSetting', () {
    testWidgets('applies and clears the profile with the switch', (
      tester,
    ) async {
      final viewModel = await pumpCupertino(
        tester,
        const ThemeProfileSetting(level: ThemeProfileLevel.seizureSafe),
      );
      expect(find.text('Seizure safe profile'), findsOneWidget);
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();
      expect(viewModel.settings, AccessibilitySettingsSamples.seizureSafe);
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();
      expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
    });

    testWidgets('reflects a profile set elsewhere', (tester) async {
      await pumpCupertino(
        tester,
        const ThemeProfileSetting(level: ThemeProfileLevel.visionImpaired),
        initial: AccessibilitySettingsSamples.visionImpaired,
      );
      expect(
        tester.widget<CupertinoSwitch>(find.byType(CupertinoSwitch)).value,
        isTrue,
      );
    });

    testWidgets('applies the profile from the cards tile', (tester) async {
      final viewModel = await pumpCupertino(
        tester,
        cards(const ThemeProfileSetting(level: ThemeProfileLevel.adhdFriendly)),
      );
      expect(find.byType(CupertinoSwitch), findsNothing);
      expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
      await tester.tap(find.text('ADHD-friendly profile'));
      await tester.pumpAndSettle();
      expect(viewModel.settings, AccessibilitySettingsSamples.adhdFriendly);
      expect(find.byIcon(CupertinoIcons.check_mark), findsOneWidget);
    });

    testWidgets('the none tile restores the default profile', (tester) async {
      final viewModel = await pumpCupertino(
        tester,
        cards(const ThemeProfileSetting(level: ThemeProfileLevel.none)),
        initial: AccessibilitySettingsSamples.seizureSafe,
      );
      expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
      await tester.tap(find.text('Default profile'));
      await tester.pumpAndSettle();
      expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
      expect(find.byIcon(CupertinoIcons.check_mark), findsOneWidget);
    });
  });
}
