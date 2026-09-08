import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_switch.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

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
    return SettingsItemSwitch(
      title: l10n.accessibleFont,
      subtitle: l10n.accessibleFontSubtitle,
      icon: Icons.font_download,
      value: enabled,
      onChanged: (value) => viewModel.setAccessibleFontEnabled(enabled: value),
    );
  }
}
