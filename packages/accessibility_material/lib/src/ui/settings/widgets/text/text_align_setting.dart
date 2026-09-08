import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_row.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Left, centre or right alignment as three cards; tapping the active one
/// clears the override.
final class TextAlignSetting extends StatelessWidget {
  /// Creates the setting.
  const TextAlignSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = AccessibilityScope.settingsOf(
      context,
    ).textSettings.textAlign;
    final viewModel = AccessibilityScope.of(context);
    final options = [
      (
        TextAlignMode.left,
        Icons.align_horizontal_left_outlined,
        l10n.alignLeft,
      ),
      (
        TextAlignMode.center,
        Icons.align_horizontal_center_outlined,
        l10n.alignCenter,
      ),
      (
        TextAlignMode.right,
        Icons.align_horizontal_right_outlined,
        l10n.alignRight,
      ),
    ];
    return SettingsItemRow(
      items: [
        for (final (mode, icon, label) in options)
          SettingsItemCard(
            title: label,
            icon: icon,
            minHeight: 80,
            isHighlighted: current == mode,
            onTap: () => viewModel.setTextAlign(
              current == mode ? TextAlignMode.none : mode,
            ),
          ),
      ],
    );
  }
}
