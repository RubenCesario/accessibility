import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_row.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_cards.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_settings_card_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_toggle_cards.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

Widget scoped(
  Widget group, {
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
}) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.cards,
  child: CustomScrollView(slivers: [group]),
);

void main() {
  testWidgets('the group shows every item but the font card by default', (
    tester,
  ) async {
    await pumpMaterial(tester, scoped(const TextSettingsCardGroup()));
    expect(find.byType(TextAlignCard), findsOneWidget);
    expect(find.byType(BoldCard), findsOneWidget);
    expect(find.byType(FontCard), findsNothing);
    expect(find.byType(TextScaleFactorCard), findsOneWidget);
    expect(find.byType(WordSpacingCard), findsOneWidget);
    expect(find.byType(LineHeightCard), findsOneWidget);
    expect(find.byType(LetterSpacingCard), findsOneWidget);
  });

  testWidgets('the font card shows once a font is registered', (tester) async {
    await pumpMaterial(
      tester,
      scoped(const TextSettingsCardGroup()),
      fonts: const [andika],
    );
    expect(find.byType(FontCard), findsOneWidget);
  });

  testWidgets('the group honours the configuration', (tester) async {
    await pumpMaterial(
      tester,
      scoped(
        const TextSettingsCardGroup(),
        configuration: const AccessibilitySettingsConfiguration(
          showTextScaleFactorSetting: false,
          showTextAlignSetting: false,
        ),
      ),
    );
    expect(find.byType(TextScaleFactorCard), findsNothing);
    expect(find.byType(TextAlignCard), findsNothing);
    expect(find.byType(BoldCard), findsOneWidget);
  });

  testWidgets(
    'the four stepper cards form two rows plus the alignment and toggle '
    'rows',
    (tester) async {
      await pumpMaterial(tester, scoped(const TextSettingsCardGroup()));
      expect(find.byType(SettingsItemRow), findsNWidgets(4));
    },
  );
}
