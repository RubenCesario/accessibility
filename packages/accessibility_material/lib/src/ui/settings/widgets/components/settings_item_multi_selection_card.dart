import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A card that cycles through [selections] values on tap, showing the
/// current position as a row of segments.
final class SettingsItemMultiSelectionCard extends StatelessWidget {
  /// Creates the card.
  const SettingsItemMultiSelectionCard({
    required this.selections,
    required this.selectedIndex,
    required this.title,
    required this.onTap,
    this.icon,
    super.key,
  });

  /// How many values there are.
  final int selections;

  /// The index of the current value.
  final int selectedIndex;

  /// The label of the current value.
  final String title;

  /// Called on tap; the caller advances to the next value.
  final VoidCallback onTap;

  /// The icon of the current value.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      label: title,
      value: '${selectedIndex + 1}/$selections',
      button: true,
      onTap: onTap,
      excludeSemantics: true,
      child: Card(
        color: scheme.surfaceContainerHigh,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kPanelRadius),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: kSettingsCardMinHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon, size: 28),
                  if (icon != null) const SizedBox(height: 8),
                  AccessibleText(title, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Row(
                    spacing: 4,
                    children: [
                      for (var i = 0; i < selections; i++)
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                              color: i == selectedIndex
                                  ? scheme.primary
                                  : scheme.outlineVariant,
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                          ),
                        ),
                    ],
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
