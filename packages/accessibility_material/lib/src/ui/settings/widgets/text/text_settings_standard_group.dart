import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/font_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The text group in the standard style: alignment cards, switches and
/// sliders.
final class TextSettingsStandardGroup extends StatelessWidget {
  /// Creates the group.
  const TextSettingsStandardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final hasFonts = AccessibilityScope.of(context).accessibleFonts.isNotEmpty;
    return SettingsGroup(
      title: context.l10n.sizeAndTextDisplay,
      settings: [
        if (configuration.showTextAlignSetting) const TextAlignSetting(),
        if (configuration.showBoldSetting) const BoldSetting(),
        if (configuration.showFontSetting && hasFonts) const FontSetting(),
        if (configuration.showTextScaleFactorSetting)
          const TextScaleFactorSetting(),
        if (configuration.showWordSpacingSetting) const WordSpacingSetting(),
        if (configuration.showLineHeightSetting) const LineHeightSetting(),
        if (configuration.showLetterSpacingSetting)
          const LetterSpacingSetting(),
      ],
    );
  }
}
