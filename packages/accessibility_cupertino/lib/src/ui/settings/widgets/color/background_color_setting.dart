import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_color_picker.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Picks the page background colour.
final class BackgroundColorSetting extends StatelessWidget {
  /// Creates the setting.
  const BackgroundColorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsTile(title: l10n.adjustBackgroundColors),
        CupertinoColorPicker(
          colors:
              configuration.backgroundColorCandidates ??
              kDefaultColorCandidates,
          selectedColorValue: AccessibilityScope.settingsOf(
            context,
          ).colorSettings.backgroundColor,
          allowPickingShades: configuration.backgroundColorAllowPickingShades,
          changeLabel: l10n.changePagesBackgroundColor,
          changeShadeLabel: l10n.changeTextColorShade,
          onColorSelected: AccessibilityScope.of(context).setBackgroundColor,
        ),
      ],
    );
  }
}
