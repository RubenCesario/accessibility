import 'package:accessibility/accessibility.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_row.dart';
import 'package:accessibility/src/view/widgets/settings/cards/text_align_card.dart';
import 'package:accessibility/src/view/widgets/settings/cards/text_stepper_cards.dart';
import 'package:accessibility/src/view/widgets/settings/cards/text_toggle_cards.dart';
import 'package:flutter/material.dart';

/// The text settings group rendered as accessible cards.
///
/// The text-align row is unchanged, the bold/accessible-font settings become
/// toggle cards, and the ranges become stepper cards laid out two per row.
final class TextSettingsCardGroup extends StatelessWidget {
  /// Creates a [TextSettingsCardGroup].
  const TextSettingsCardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.a11yConfig;
    final toggleCards = <SettingsItem>[
      if (config.showTextFontWeightSetting) const TextFontWeightCard(),
      if (config.showTextFontFamilySetting) const TextFontFamilyCard(),
    ];
    final stepperCards = <SettingsItem>[
      if (config.showTextScaleFactorSetting) const FontSizeStepperCard(),
      if (config.showTextWordSpacingSetting) const WordSpacingStepperCard(),
      if (config.showTextLineHeightSetting) const LineHeightStepperCard(),
      if (config.showTextLetterSpacingSetting) const LetterSpacingStepperCard(),
    ];
    return SettingsGroup(
      title: context.l10na.size_and_text_display,
      separatorBetweenWidgets: const SizedBox.shrink(),
      settings: [
        if (config.showTextAlignSetting)
          const SettingsItemRow(items: [TextAlignCard()]),
        if (toggleCards.isNotEmpty) SettingsItemRow(items: toggleCards),
        for (var i = 0; i < stepperCards.length; i += 2)
          SettingsItemRow(
            items: stepperCards.sublist(
              i,
              i + 2 < stepperCards.length ? i + 2 : stepperCards.length,
            ),
          ),
      ],
    );
  }
}
