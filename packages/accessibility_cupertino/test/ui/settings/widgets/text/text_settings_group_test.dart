import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/font_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

Widget buildGroup(
  AccessibilitySettingsStyle style, [
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: style,
  child: const SingleChildScrollView(child: TextSettingsGroup()),
);

void main() {
  group('TextSettingsGroup', () {
    testWidgets('lists every text setting with sliders in the standard style', (
      tester,
    ) async {
      await pumpCupertino(
        tester,
        buildGroup(AccessibilitySettingsStyle.standard),
        fonts: const [andika],
      );
      expect(find.text('Size and text display'), findsOneWidget);
      expect(find.byType(TextAlignSetting), findsOneWidget);
      expect(find.byType(BoldSetting), findsOneWidget);
      expect(find.byType(FontSetting), findsOneWidget);
      expect(find.byType(TextScaleFactorSetting), findsOneWidget);
      expect(find.byType(WordSpacingSetting), findsOneWidget);
      expect(find.byType(LineHeightSetting), findsOneWidget);
      expect(find.byType(LetterSpacingSetting), findsOneWidget);
      expect(find.byType(CupertinoSlider), findsNWidgets(4));
    });

    testWidgets('uses steppers in the cards style', (tester) async {
      await pumpCupertino(tester, buildGroup(AccessibilitySettingsStyle.cards));
      expect(find.byType(CupertinoSlider), findsNothing);
      expect(find.byIcon(CupertinoIcons.plus), findsNWidgets(4));
      expect(find.byType(FontSetting), findsNothing);
    });

    testWidgets('hides settings on request', (tester) async {
      await pumpCupertino(
        tester,
        buildGroup(
          AccessibilitySettingsStyle.standard,
          const AccessibilitySettingsConfiguration(
            showTextAlignSetting: false,
            showBoldSetting: false,
            showFontSetting: false,
            showWordSpacingSetting: false,
            showLineHeightSetting: false,
            showLetterSpacingSetting: false,
          ),
        ),
        fonts: const [andika],
      );
      expect(find.byType(TextAlignSetting), findsNothing);
      expect(find.byType(BoldSetting), findsNothing);
      expect(find.byType(FontSetting), findsNothing);
      expect(find.byType(TextScaleFactorSetting), findsOneWidget);
      expect(find.byType(CupertinoSlider), findsOneWidget);
    });
  });
}
