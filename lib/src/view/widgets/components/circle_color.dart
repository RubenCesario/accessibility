import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

/// Displays a colored circle that can be selected.
final class CircleColor extends StatelessWidget {
  /// Whether the color is selected.
  final bool isSelected;

  /// Whether the color should have a shadow.
  final bool withShadow;

  /// The color of the circle.
  final Color color;

  /// The size of the circle.
  final double circleSize;

  /// The callback to be called when the color is selected.
  final ValueSetter<Color>? onColorSet;

  /// The icon to be displayed in the circle when selected.
  final IconData? iconSelected;

  /// Creates a [CircleColor] Widget.
  const CircleColor({
    required this.color,
    this.withShadow = true,
    this.circleSize = 38,
    this.onColorSet,
    this.isSelected = false,
    this.iconSelected,
    super.key,
  }) : assert(
          !isSelected || (isSelected && iconSelected != null),
          'You must provide an icon for selected color',
        );

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onColorSet != null ? () => onColorSet!(color) : null,
        child: Material(
          elevation: withShadow ? 4 : 0,
          shape: const CircleBorder(),
          child: CircleAvatar(
            radius: circleSize / 2,
            backgroundColor: color,
            child: isSelected
                ? Icon(
                    iconSelected,
                    color: context.isDarkMode
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.shadow,
                  )
                : null,
          ),
        ),
      );
}
