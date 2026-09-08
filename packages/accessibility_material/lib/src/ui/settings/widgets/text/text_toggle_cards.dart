import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Bold text as a toggling card.
final class BoldCard extends StatelessWidget {
  /// Creates the card.
  const BoldCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bold = AccessibilityScope.settingsOf(context).textSettings.isBold;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemCard(
      title: context.l10n.boldText,
      icon: Icons.format_bold,
      isHighlighted: bold,
      onTap: () => viewModel.setBold(value: !bold),
    );
  }
}

/// The accessible font as a toggling card.
final class FontCard extends StatelessWidget {
  /// Creates the card.
  const FontCard({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled =
        AccessibilityScope.settingsOf(context).textSettings.fontFamily != null;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemCard(
      title: context.l10n.accessibleFont,
      icon: enabled ? Icons.font_download : Icons.font_download_outlined,
      isHighlighted: enabled,
      onTap: () => viewModel.setAccessibleFontEnabled(enabled: !enabled),
    );
  }
}
