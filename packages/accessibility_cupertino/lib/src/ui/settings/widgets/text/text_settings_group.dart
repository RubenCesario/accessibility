import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/font_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The text group: alignment, switches, then the four ranges.
final class TextSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const TextSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final hasFonts = AccessibilityScope.of(context).accessibleFonts.isNotEmpty;
    return SettingsSection(
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
