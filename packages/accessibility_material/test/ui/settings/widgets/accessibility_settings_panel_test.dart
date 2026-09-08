import 'package:accessibility_material/src/ui/settings/widgets/accessibility_settings_panel.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/restore_settings_button.dart';
import 'package:accessibility_material/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_settings_standard_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_card_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_standard_group.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_material.dart';

void main() {
  group('AccessibilitySettingsPanel', () {
    testWidgets('renders the status card and the restore button', (
      tester,
    ) async {
      await pumpMaterial(tester, const AccessibilitySettingsPanel());
      // The status card renders a zero-size box once loaded, and the
      // theme group now pushes the button past the viewport; both are
      // treated as offstage, so skipOffstage: false still finds them.
      expect(find.byType(StatusCard, skipOffstage: false), findsOneWidget);
      expect(
        find.byType(RestoreSettingsButton, skipOffstage: false),
        findsOneWidget,
      );
    });

    testWidgets('renders the theme group in both styles', (tester) async {
      await pumpMaterial(tester, const AccessibilitySettingsPanel());
      expect(find.byType(ThemeSettingsStandardGroup), findsOneWidget);
      await pumpMaterial(
        tester,
        const AccessibilitySettingsPanel(
          style: AccessibilitySettingsStyle.cards,
        ),
      );
      expect(find.byType(ThemeSettingsCardGroup), findsOneWidget);
    });

    testWidgets('hides the theme group on request', (tester) async {
      await pumpMaterial(
        tester,
        const AccessibilitySettingsPanel(
          configuration: AccessibilitySettingsConfiguration(
            showThemeSettingsGroup: false,
          ),
        ),
      );
      expect(find.byType(ThemeSettingsStandardGroup), findsNothing);
    });

    testWidgets('renders the colour group by default', (tester) async {
      await pumpMaterial(tester, const AccessibilitySettingsPanel());
      // The theme group pushes the colour group past the viewport, so it
      // is offstage; skipOffstage: false still finds it.
      expect(
        find.byType(ColorSettingsGroup, skipOffstage: false),
        findsOneWidget,
      );
    });

    testWidgets('hides the colour group on request', (tester) async {
      await pumpMaterial(
        tester,
        const AccessibilitySettingsPanel(
          configuration: AccessibilitySettingsConfiguration(
            showColorSettingsGroup: false,
          ),
        ),
      );
      expect(
        find.byType(ColorSettingsGroup, skipOffstage: false),
        findsNothing,
      );
    });

    testWidgets('renders the text group by default', (tester) async {
      await pumpMaterial(tester, const AccessibilitySettingsPanel());
      // The groups above push the text group past the viewport, so it is
      // offstage; skipOffstage: false still finds it.
      expect(
        find.byType(TextSettingsStandardGroup, skipOffstage: false),
        findsOneWidget,
      );
    });

    testWidgets('hides the text group on request', (tester) async {
      await pumpMaterial(
        tester,
        const AccessibilitySettingsPanel(
          configuration: AccessibilitySettingsConfiguration(
            showTextSettingsGroup: false,
          ),
        ),
      );
      expect(
        find.byType(TextSettingsStandardGroup, skipOffstage: false),
        findsNothing,
      );
    });
  });
}
