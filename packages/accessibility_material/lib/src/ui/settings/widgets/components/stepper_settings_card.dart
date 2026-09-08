import 'dart:math' as math;

import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A ranged setting as a card with minus and plus buttons and step dots.
final class StepperSettingsCard extends StatelessWidget {
  /// Creates the card.
  const StepperSettingsCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.decrementLabel,
    required this.incrementLabel,
    required this.onChanged,
    super.key,
  });

  /// The icon above the title.
  final IconData icon;

  /// The setting name.
  final String title;

  /// The current value, clamped to the range for display.
  final double value;

  /// The lowest value.
  final double min;

  /// The highest value.
  final double max;

  /// The number of steps between [min] and [max].
  final int divisions;

  /// The spoken label of the minus button.
  final String decrementLabel;

  /// The spoken label of the plus button.
  final String incrementLabel;

  /// Called with the new value.
  final ValueChanged<double> onChanged;

  double get _step => (max - min) / divisions;

  double _clampToRange(double value) => math.min(max, math.max(min, value));

  int get _index => ((_clampToRange(value) - min) / _step).round();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final atMin = _index <= 0;
    final atMax = _index >= divisions;
    return Card(
      color: scheme.surfaceContainerHigh,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: kSettingsCardMinHeight),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28),
              const SizedBox(height: 8),
              AccessibleText(title, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    tooltip: decrementLabel,
                    icon: const Icon(Icons.remove),
                    onPressed: atMin
                        ? null
                        : () => onChanged(min + (_index - 1) * _step),
                  ),
                  Expanded(
                    child: Semantics(
                      value: '${_index + 1}/${divisions + 1}',
                      child: ExcludeSemantics(
                        child: Row(
                          spacing: 4,
                          children: [
                            for (var i = 0; i <= divisions; i++)
                              Expanded(
                                child: Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: i <= _index
                                        ? scheme.primary
                                        : scheme.outlineVariant,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: incrementLabel,
                    icon: const Icon(Icons.add),
                    onPressed: atMax
                        ? null
                        : () => onChanged(min + (_index + 1) * _step),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
