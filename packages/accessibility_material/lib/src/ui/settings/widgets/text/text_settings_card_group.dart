import 'dart:math' as math;

import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_row.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_cards.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_toggle_cards.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The text group in the cards style: the alignment card, the toggle
/// cards and the stepper cards two per row.
final class TextSettingsCardGroup extends StatelessWidget {
  /// Creates the group.
  const TextSettingsCardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final hasFonts = AccessibilityScope.of(context).accessibleFonts.isNotEmpty;
    final toggles = [
      if (configuration.showBoldSetting) const BoldCard(),
      if (configuration.showFontSetting && hasFonts) const FontCard(),
    ];
    final steppers = [
      if (configuration.showTextScaleFactorSetting) const TextScaleFactorCard(),
      if (configuration.showWordSpacingSetting) const WordSpacingCard(),
      if (configuration.showLineHeightSetting) const LineHeightCard(),
      if (configuration.showLetterSpacingSetting) const LetterSpacingCard(),
    ];
    return SettingsGroup(
      title: context.l10n.sizeAndTextDisplay,
      separator: const SizedBox.shrink(),
      settings: [
        if (configuration.showTextAlignSetting)
          const SettingsItemRow(items: [TextAlignCard()]),
        if (toggles.isNotEmpty) SettingsItemRow(items: toggles),
        for (var i = 0; i < steppers.length; i += 2)
          SettingsItemRow(
            items: steppers.sublist(i, math.min(i + 2, steppers.length)),
          ),
      ],
    );
  }
}
