import 'package:accessibility_material/src/ui/core/color_profile_icons.dart';
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_multi_selection_card.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Cycles through the colour profiles.
final class ColorProfileSetting extends StatelessWidget {
  /// Creates the setting.
  const ColorProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final level = AccessibilityScope.settingsOf(
      context,
    ).colorSettings.colorProfile;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemMultiSelectionCard(
      selections: ColorProfileLevel.values.length,
      selectedIndex: level.index,
      icon: colorProfileIcon(level),
      title: l10n.colorProfile(level.name),
      onTap: () async {
        await viewModel.nextColorProfile();
        if (!context.mounted) {
          return;
        }
        final next = viewModel.settings.colorSettings.colorProfile;
        await SemanticsService.sendAnnouncement(
          View.of(context),
          '${l10n.colorProfileChangedTo} ${l10n.colorProfile(next.name)}',
          Directionality.of(context),
        );
      },
    );
  }
}
