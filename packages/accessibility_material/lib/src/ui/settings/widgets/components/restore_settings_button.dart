import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A full-width button that restores the default settings.
///
/// Calls [AccessibilitySettingsViewModel.restoreDefaults], then the panel
/// configuration's `onRestoreSettings` when the button is inside an
/// `AccessibilitySettingsPanel`.
final class RestoreSettingsButton extends StatelessWidget {
  /// Creates the button.
  const RestoreSettingsButton({this.style, super.key});

  /// Overrides the default filled style.
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(kPanelPadding),
    child: SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: style,
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
