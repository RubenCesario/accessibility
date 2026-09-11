import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// Lays out settings side by side with equal widths and heights.
final class SettingsItemRow extends StatelessWidget {
  /// Creates a row of [items].
  const SettingsItemRow({required this.items, this.spacing = 10, super.key});

  /// The settings, left to right.
  final List<Widget> items;

  /// The gap between two items.
  final double spacing;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: kPanelPadding,
      vertical: kPanelPadding / 2,
    ),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: spacing,
        children: [for (final item in items) Expanded(child: item)],
      ),
    ),
  );
}
