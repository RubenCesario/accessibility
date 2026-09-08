import 'package:accessibility_material/src/ui/core/material_palette.dart';
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/color_picker.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Picks the page background colour.
final class BackgroundColorSetting extends StatelessWidget {
  /// Creates the setting.
  const BackgroundColorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return ColorPicker(
      colors: configuration.backgroundColorCandidates ?? kMaterialColors,
      selectedColorValue: AccessibilityScope.settingsOf(
        context,
      ).colorSettings.backgroundColor,
      allowPickingShades: configuration.backgroundColorAllowPickingShades,
      changeLabel: l10n.changePagesBackgroundColor,
      changeShadeLabel: l10n.changeTextColorShade,
      onColorSelected: AccessibilityScope.of(context).setBackgroundColor,
    );
  }
}
