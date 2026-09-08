import 'package:accessibility_material/src/ui/core/material_palette.dart';
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/color_picker.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Picks the text colour.
final class TextColorSetting extends StatelessWidget {
  /// Creates the setting.
  const TextColorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return ColorPicker(
      colors: configuration.textColorCandidates ?? kMaterialColors,
      selectedColorValue: AccessibilityScope.settingsOf(
        context,
      ).textSettings.color,
      allowPickingShades: configuration.textColorAllowPickingShades,
      changeLabel: l10n.changeTextColor,
      changeShadeLabel: l10n.changeTextColorShade,
      onColorSelected: AccessibilityScope.of(context).setTextColor,
    );
  }
}
