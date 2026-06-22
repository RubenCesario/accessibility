import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// A card that adjusts a discrete range setting with explicit decrease and
/// increase controls (a stepper), instead of a draggable slider.
///
/// The current position is shown by step dots and exposed to screen readers as
/// a value, and the -/+ controls keep a way to go back (unlike a tap-to-cycle
/// card).
final class StepperSettingsCard extends StatelessWidget {
  /// The icon representing the setting.
  final IconData icon;

  /// The title of the setting.
  final String title;

  /// The current value.
  final double value;

  /// The minimum value.
  final double min;

  /// The maximum value.
  final double max;

  /// The number of divisions (there are `divisions + 1` steps).
  final int divisions;

  /// The accessible label for the decrement control.
  final String decrementLabel;

  /// The accessible label for the increment control.
  final String incrementLabel;

  /// Called with the new value when the user steps the setting.
  final ValueChanged<double> onChanged;

  /// Creates a [StepperSettingsCard].
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

  double get _step => (max - min) / divisions;

  int get _index => ((value - min) / _step).round().clamp(0, divisions);

  @override
  Widget build(BuildContext context) {
    final atMin = value <= min;
    final atMax = value >= max;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: kSettingsCardMinHeight),
      child: Card(
        color: context.colorScheme.surfaceContainerLow,
        surfaceTintColor: context.colorScheme.surfaceContainerLow,
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.smaller),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon),
              const SizedBox(height: PaddingSize.small),
              ExcludeSemantics(
                child: SizedBox(
                  width: double.infinity,
                  child: AccessibleText(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ),
              const SizedBox(height: PaddingSize.small),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: atMin
                        ? null
                        : () => onChanged((value - _step).clamp(min, max)),
                    tooltip: decrementLabel,
                    icon: const Icon(Icons.remove),
                  ),
                  Expanded(
                    child: Semantics(
                      value: '${_index + 1}/${divisions + 1}',
                      child: ExcludeSemantics(
                        child: _StepDots(
                          activeIndex: _index,
                          count: divisions + 1,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: atMax
                        ? null
                        : () => onChanged((value + _step).clamp(min, max)),
                    tooltip: incrementLabel,
                    icon: const Icon(Icons.add),
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

class _StepDots extends StatelessWidget {
  const _StepDots({required this.activeIndex, required this.count});

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < count; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: i == activeIndex ? 12 : 8,
                height: i == activeIndex ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == activeIndex
                      ? context.colorScheme.primary
                      : context.colorScheme.outlineVariant,
                ),
              ),
            ),
        ],
      );
}
