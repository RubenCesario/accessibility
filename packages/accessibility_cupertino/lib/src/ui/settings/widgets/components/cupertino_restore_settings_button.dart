import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A full-width filled button that restores the default settings.
///
/// Calls [AccessibilitySettingsViewModel.restoreDefaults], then the panel
/// configuration's `onRestoreSettings` when the button is inside a
/// `CupertinoAccessibilitySettingsPanel`.
final class CupertinoRestoreSettingsButton extends StatelessWidget {
  /// Creates the button.
  const CupertinoRestoreSettingsButton({this.color, super.key});

  /// Overrides the theme's primary colour as the button's fill.
  final Color? color;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(kPanelPadding),
    child: SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        color: color,
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
