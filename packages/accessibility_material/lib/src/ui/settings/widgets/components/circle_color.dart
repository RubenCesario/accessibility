import 'package:material_ui/material_ui.dart';

/// A tappable colour disc with a 48 dp tap target.
final class CircleColor extends StatelessWidget {
  /// Creates the disc.
  const CircleColor({
    required this.color,
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.size = 38,
    super.key,
  });

  /// The colour shown.
  final Color color;

  /// The spoken name of the colour.
  final String label;

  /// Called when the disc is tapped.
  final VoidCallback? onTap;

  /// Whether a check mark is drawn on the disc.
  final bool isSelected;

  /// The diameter of the disc.
  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      label: label,
      button: true,
      selected: isSelected,
      onTap: onTap,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox.square(
          dimension: kMinInteractiveDimension,
          child: Center(
            child: Material(
              elevation: 4,
              shape: const CircleBorder(),
              child: CircleAvatar(
                radius: size / 2,
                backgroundColor: color,
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: color.computeLuminance() > 0.5
                            ? scheme.onSurface
                            : scheme.surface,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
