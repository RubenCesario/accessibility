import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_switch_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Bold text on or off.
final class BoldSetting extends StatelessWidget {
  /// Creates the setting.
  const BoldSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = AccessibilityScope.of(context);
    return SettingsSwitchTile(
      title: l10n.boldText,
      subtitle: l10n.changeBoldText,
      icon: CupertinoIcons.bold,
      value: AccessibilityScope.settingsOf(context).textSettings.isBold,
      onChanged: (value) => viewModel.setBold(value: value),
    );
  }
}
