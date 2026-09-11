import 'package:accessibility_cupertino/src/ui/core/color_profile_icons.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Cycles through the colour profiles; the tile shows the current one and
/// its position, and announces the new profile after a tap.
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
    return SettingsTile(
      title: l10n.colorProfile(level.name),
      icon: colorProfileIcon(level),
      additionalInfo: '${level.index + 1}/${ColorProfileLevel.values.length}',
      trailing: const CupertinoListTileChevron(),
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
