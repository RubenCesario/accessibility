import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A full-width filled button that restores the default settings.
///
/// Calls [AccessibilitySettingsViewModel.restoreDefaults], then the panel
/// configuration's `onRestoreSettings` when the button is inside a
/// `CupertinoAccessibilitySettingsPanel`. Fills with [panelAccentColor] by
/// default: the theme's own `primaryColor` (`CupertinoColors.systemBlue`)
/// does not contrast enough against the label.
///
/// The label is the resolved `systemBackground` rather than
/// `CupertinoButton.filled`'s default `primaryContrastingColor`, which
/// `cupertino_ui` defaults to a flat `CupertinoColors.white`: white on the
/// accent's dark variant only reaches 2.8:1, while black reaches 7.4:1.
final class CupertinoRestoreSettingsButton extends StatelessWidget {
  /// Creates the button.
  const CupertinoRestoreSettingsButton({this.color, super.key});

  /// Overrides [panelAccentColor] as the button's fill.
  final Color? color;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(kPanelPadding),
    child: SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        color: color ?? panelAccentColor(context),
        foregroundColor: CupertinoDynamicColor.resolve(
          CupertinoColors.systemBackground,
          context,
        ),
        onPressed: () => _restore(context),
        child: Text(context.l10n.restoreSettings),
      ),
    ),
  );

  Future<void> _restore(BuildContext context) async {
    final viewModel = AccessibilityScope.of(context);
    final onRestore = PanelScope.maybeOf(
      context,
    )?.configuration.onRestoreSettings;
    await viewModel.restoreDefaults();
    await onRestore?.call();
  }
}
