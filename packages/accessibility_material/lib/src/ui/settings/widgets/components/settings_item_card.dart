import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A tappable card with an icon and a title, highlighted when selected.
///
/// The whole card is one labelled, selectable tap target.
final class SettingsItemCard extends StatelessWidget {
  /// Creates the card.
  const SettingsItemCard({
    required this.title,
    this.onTap,
    this.icon,
    this.isHighlighted = false,
    this.minHeight,
    super.key,
  });

  /// The label.
  final String title;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// The icon above the label.
  final IconData? icon;

  /// Whether the card shows as selected.
  final bool isHighlighted;

  /// The minimum height, [kSettingsCardMinHeight] by default.
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final foreground = isHighlighted ? scheme.onPrimaryContainer : null;
    return Semantics(
      label: title,
      button: true,
      selected: isHighlighted,
      onTap: onTap,
      excludeSemantics: true,
      child: Card(
        color: isHighlighted
            ? scheme.primaryContainer
            : scheme.surfaceContainerHigh,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kPanelRadius),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: minHeight ?? kSettingsCardMinHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon, size: 28, color: foreground),
                  if (icon != null) const SizedBox(height: 8),
                  AccessibleText(
                    title,
                    textAlign: TextAlign.center,
                    textColor: foreground,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
