import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_color_picker.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Picks the text colour.
final class TextColorSetting extends StatelessWidget {
  /// Creates the setting.
  const TextColorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsTile(title: l10n.adjustTextColors),
        CupertinoColorPicker(
          colors: configuration.textColorCandidates ?? kDefaultColorCandidates,
          selectedColorValue: AccessibilityScope.settingsOf(
            context,
          ).textSettings.color,
          allowPickingShades: configuration.textColorAllowPickingShades,
          changeLabel: l10n.changeTextColor,
          changeShadeLabel: l10n.changeTextColorShade,
          onColorSelected: AccessibilityScope.of(context).setTextColor,
        ),
      ],
    );
  }
}
