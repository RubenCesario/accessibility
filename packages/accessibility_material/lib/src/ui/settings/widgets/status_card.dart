import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Shows the settings load status at the top of the panel.
///
/// Renders nothing while idle or loaded, a progress indicator while
/// loading, and the failure message with a retry button that calls
/// [AccessibilitySettingsViewModel.load] again.
final class StatusCard extends StatelessWidget {
  /// Creates the card.
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return switch (AccessibilityScope.statusOf(context)) {
      AccessibilitySettingsIdle() ||
      AccessibilitySettingsLoaded() => const SizedBox.shrink(),
      AccessibilitySettingsLoading() => Padding(
        padding: const EdgeInsets.all(kPanelPadding),
        child: Card(
          child: ListTile(
            leading: const SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
            title: Text(l10n.settingsLoading),
          ),
        ),
      ),
      AccessibilitySettingsLoadFailed() => Padding(
        padding: const EdgeInsets.all(kPanelPadding),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.error_outline),
            title: Text(l10n.settingsLoadFailed),
            trailing: TextButton(
              onPressed: AccessibilityScope.of(context).load,
              child: Text(l10n.retry),
            ),
          ),
        ),
      ),
    };
  }
}
