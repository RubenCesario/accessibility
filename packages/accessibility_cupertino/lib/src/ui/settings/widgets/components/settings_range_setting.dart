import 'dart:math' as math;

import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_icon_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A ranged setting.
///
/// Standard style: a titled tile, then a minus button, a slider labelled
/// with [title] and a plus button. Cards style: a notched tile showing the
/// value, with the two buttons at the end, disabled at the ends of the
/// range.
final class SettingsRangeSetting extends StatelessWidget {
  /// Creates the setting.
  const SettingsRangeSetting({
    required this.title,
    required this.subtitle,
    required this.icon,
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

  /// The explanation under the name (standard style).
  final String subtitle;

  /// The icon before the name (cards style).
  final IconData icon;

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

  int get _index => ((_clamped - min) / _step).round();

  @override
  Widget build(BuildContext context) {
    final style =
        PanelScope.maybeOf(context)?.style ??
        AccessibilitySettingsStyle.standard;
    return switch (style) {
      AccessibilitySettingsStyle.standard => _slider(),
      AccessibilitySettingsStyle.cards => _stepper(),
    };
  }

  Widget _slider() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SettingsTile(title: title, subtitle: subtitle),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPanelPadding / 2),
        child: Row(
          children: [
            SettingsIconButton(
              icon: CupertinoIcons.minus,
              label: decrementLabel,
              onPressed: () => onChanged(_clampToRange(_clamped - _step)),
            ),
            Expanded(
              // CupertinoSlider has no label of its own, so its node would
              // be announced as a bare value; the parent annotation names it.
              child: Semantics(
                label: title,
                child: CupertinoSlider(
                  value: _clamped,
                  min: min,
                  max: max,
                  divisions: divisions,
                  onChanged: onChanged,
                ),
              ),
            ),
            SettingsIconButton(
              icon: CupertinoIcons.plus,
              label: incrementLabel,
              onPressed: () => onChanged(_clampToRange(_clamped + _step)),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _stepper() {
    final atMin = _index <= 0;
    final atMax = _index >= divisions;
    return SettingsTile(
      title: title,
      icon: icon,
      additionalInfo: _clamped.toStringAsFixed(2),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsIconButton(
            icon: CupertinoIcons.minus,
            label: decrementLabel,
            onPressed: atMin
                ? null
                : () => onChanged(min + (_index - 1) * _step),
          ),
          SettingsIconButton(
            icon: CupertinoIcons.plus,
            label: incrementLabel,
            onPressed: atMax
                ? null
                : () => onChanged(min + (_index + 1) * _step),
          ),
        ],
      ),
    );
  }
}
