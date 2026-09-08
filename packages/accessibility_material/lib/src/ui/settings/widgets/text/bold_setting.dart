import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_switch.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Bold text on or off.
final class BoldSetting extends StatelessWidget {
  /// Creates the setting.
  const BoldSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemSwitch(
      title: l10n.boldText,
      subtitle: l10n.changeBoldText,
      icon: Icons.format_bold,
      value: AccessibilityScope.settingsOf(context).textSettings.isBold,
      onChanged: (value) => viewModel.setBold(value: value),
    );
  }
}
