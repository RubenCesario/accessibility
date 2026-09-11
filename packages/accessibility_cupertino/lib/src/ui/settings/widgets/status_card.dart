import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Shows the settings load status at the top of the panel.
///
/// Renders nothing while idle or loaded, an activity indicator while
/// loading, and the failure message with a retry button that calls
/// [AccessibilitySettingsViewModel.load] again. The retry button is drawn
/// with [panelAccentColor]: `CupertinoButton` never resolves a
/// `foregroundColor`, so an unresolved dynamic colour would keep its light
/// variant in dark mode.
final class StatusCard extends StatelessWidget {
  /// Creates the card.
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return switch (AccessibilityScope.statusOf(context)) {
      AccessibilitySettingsIdle() ||
      AccessibilitySettingsLoaded() => const SizedBox.shrink(),
      AccessibilitySettingsLoading() => SettingsSection(
        settings: [
          SettingsTile(
            title: l10n.settingsLoading,
            trailing: const CupertinoActivityIndicator(),
          ),
        ],
      ),
      AccessibilitySettingsLoadFailed() => SettingsSection(
        settings: [
          SettingsTile(
            title: l10n.settingsLoadFailed,
            icon: CupertinoIcons.exclamationmark_triangle,
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              foregroundColor: panelAccentColor(context),
              onPressed: AccessibilityScope.of(context).load,
              child: Text(l10n.retry),
            ),
          ),
        ],
      ),
    };
  }
}
