import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Left, centre or right alignment as a segmented button; deselecting the
/// active segment clears the override.
final class TextAlignCard extends StatelessWidget {
  /// Creates the card.
  const TextAlignCard({super.key});

  static const _modes = {
    TextAlignMode.left,
    TextAlignMode.center,
    TextAlignMode.right,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = AccessibilityScope.settingsOf(
      context,
    ).textSettings.textAlign;
    final viewModel = AccessibilityScope.of(context);
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: kSettingsCardMinHeight),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AccessibleText(l10n.textAlignment, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              SegmentedButton<TextAlignMode>(
                emptySelectionAllowed: true,
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: TextAlignMode.left,
                    icon: const Icon(Icons.align_horizontal_left_outlined),
                    tooltip: l10n.alignLeft,
                  ),
                  ButtonSegment(
                    value: TextAlignMode.center,
                    icon: const Icon(Icons.align_horizontal_center_outlined),
                    tooltip: l10n.alignCenter,
                  ),
                  ButtonSegment(
                    value: TextAlignMode.right,
                    icon: const Icon(Icons.align_horizontal_right_outlined),
                    tooltip: l10n.alignRight,
                  ),
                ],
                selected: _modes.contains(current) ? {current} : const {},
                onSelectionChanged: (selection) => viewModel.setTextAlign(
                  selection.isEmpty ? TextAlignMode.none : selection.single,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
