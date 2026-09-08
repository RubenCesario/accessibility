import 'dart:math' as math;

import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// A ranged setting: a titled tile, a slider and two step buttons.
final class SettingsItemSlider extends StatelessWidget {
  /// Creates the slider setting.
  const SettingsItemSlider({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.incrementLabel,
    required this.decrementLabel,
    required this.onChanged,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String subtitle;

  /// The current value, clamped to the range for display.
  final double value;

  /// The lowest value.
  final double min;

  /// The highest value.
  final double max;

  /// The number of steps between [min] and [max].
  final int divisions;

  /// The spoken label of the plus button.
  final String incrementLabel;

  /// The spoken label of the minus button.
  final String decrementLabel;

  /// Called with the new value.
  final ValueChanged<double> onChanged;

  double get _step => (max - min) / divisions;

  double _clampToRange(double value) => math.min(max, math.max(min, value));

  double get _clamped => _clampToRange(value);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ListTile(title: Text(title), subtitle: Text(subtitle)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPanelPadding / 2),
        child: Row(
          children: [
            IconButton(
              tooltip: decrementLabel,
              icon: const Icon(Icons.remove),
              onPressed: () => onChanged(_clampToRange(_clamped - _step)),
            ),
            Expanded(
              child: Slider.adaptive(
                value: _clamped,
                min: min,
                max: max,
                divisions: divisions,
                label: _clamped.toStringAsFixed(2),
                semanticFormatterCallback: (value) => value.toStringAsFixed(2),
                onChanged: onChanged,
              ),
            ),
            IconButton(
              tooltip: incrementLabel,
              icon: const Icon(Icons.add),
              onPressed: () => onChanged(_clampToRange(_clamped + _step)),
            ),
          ],
        ),
      ),
    ],
  );
}
