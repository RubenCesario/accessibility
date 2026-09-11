import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/theme/accessible_cupertino_theme_data.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_cupertino.dart';

const dark = CupertinoThemeData(brightness: Brightness.dark);

void main() {
  Future<BuildContext> pumpContext(
    WidgetTester tester, {
    CupertinoThemeData? theme,
  }) async {
    late BuildContext captured;
    await pumpCupertino(
      tester,
      Builder(
        builder: (context) {
          captured = context;
          return const SizedBox();
        },
      ),
      theme: theme,
    );
    return captured;
  }

  group('panelSecondaryTextColor', () {
    testWidgets('resolves to the light variant in light mode', (tester) async {
      final context = await pumpContext(tester);
      expect(
        panelSecondaryTextColor(context),
        isSameColorAs(kPanelSecondaryTextColor.color),
      );
    });

    testWidgets('resolves to the dark variant in dark mode', (tester) async {
      final context = await pumpContext(tester, theme: dark);
      expect(
        panelSecondaryTextColor(context),
        isSameColorAs(kPanelSecondaryTextColor.darkColor),
      );
    });
  });

  group('panelAccentColor', () {
    testWidgets('is the primary high-contrast variant of the default theme', (
      tester,
    ) async {
      final light = await pumpContext(tester);
      expect(
        panelAccentColor(light),
        isSameColorAs(CupertinoColors.systemBlue.highContrastColor),
      );
      final night = await pumpContext(tester, theme: dark);
      expect(
        panelAccentColor(night),
        isSameColorAs(CupertinoColors.systemBlue.darkHighContrastColor),
      );
    });

    testWidgets('returns a plain primary colour as is', (tester) async {
      const plain = Color(0xFF2196F3);
      final context = await pumpContext(
        tester,
        theme: const CupertinoThemeData(primaryColor: plain),
      );
      expect(panelAccentColor(context), plain);
    });

    testWidgets('follows the colour profile of the theme', (tester) async {
      final theme = AccessibleCupertinoThemeData.from(
        themeData: const CupertinoThemeData(),
        settings: const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      final context = await pumpContext(tester, theme: theme);
      expect(HSLColor.fromColor(panelAccentColor(context)).saturation, 0);
    });
  });
}
