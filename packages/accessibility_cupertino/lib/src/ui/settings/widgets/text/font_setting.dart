import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_switch_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The accessible font on or off. Shown only when a font is registered.
final class FontSetting extends StatelessWidget {
  /// Creates the setting.
  const FontSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = AccessibilityScope.of(context);
    final enabled =
        AccessibilityScope.settingsOf(context).textSettings.fontFamily != null;
    return SettingsSwitchTile(
      title: l10n.accessibleFont,
      subtitle: l10n.accessibleFontSubtitle,
      icon: CupertinoIcons.textformat_abc,
      value: enabled,
      onChanged: (value) => viewModel.setAccessibleFontEnabled(enabled: value),
    );
  }
}
