import 'package:cupertino_ui/cupertino_ui.dart';

/// A tappable colour disc with a 44 dp tap target.
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
  Widget build(BuildContext context) => Semantics(
    label: label,
    button: true,
    selected: isSelected,
    onTap: onTap,
    excludeSemantics: true,
    child: GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox.square(
        dimension: kMinInteractiveDimensionCupertino,
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: isSelected
                ? Icon(
                    CupertinoIcons.check_mark,
                    color: color.computeLuminance() > 0.5
                        ? CupertinoColors.black
                        : CupertinoColors.white,
                  )
                : null,
          ),
        ),
      ),
    ),
  );
}
