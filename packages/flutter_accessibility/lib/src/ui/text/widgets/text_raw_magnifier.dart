import 'package:flutter/widgets.dart';

/// Magnifies [child] under the finger while it is long-pressed.
///
/// Meant for text but works with any widget. The magnifier follows the
/// finger and disappears when it lifts.
final class TextRawMagnifier extends StatefulWidget {
  /// Creates a magnifier over [child].
  const TextRawMagnifier({
    required this.child,
    this.borderColor,
    this.size = const Size(200, 100),
    this.magnificationScale = 1.5,
    super.key,
  });

  /// The widget to magnify.
  final Widget child;

  /// The border colour of the lens; defaults to the ambient text colour,
  /// or black when there is none.
  final Color? borderColor;

  /// The size of the lens.
  final Size size;

  /// The magnification factor.
  final double magnificationScale;

  @override
  State<TextRawMagnifier> createState() => _TextRawMagnifierState();
}

class _TextRawMagnifierState extends State<TextRawMagnifier> {
  Offset? _position;

  void _show(Offset position) => setState(() => _position = position);

  void _hide() => setState(() => _position = null);

  @override
  Widget build(BuildContext context) {
    final position = _position;
    final borderColor =
        widget.borderColor ??
        DefaultTextStyle.of(context).style.color ??
        const Color(0xFF000000);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onLongPressStart: (details) => _show(details.localPosition),
          onLongPressMoveUpdate: (details) => _show(details.localPosition),
          onLongPressEnd: (_) => _hide(),
          onLongPressCancel: _hide,
          child: widget.child,
        ),
        if (position != null)
          Positioned(
            left: position.dx,
            top: position.dy,
            child: RawMagnifier(
              size: widget.size,
              magnificationScale: widget.magnificationScale,
              decoration: MagnifierDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3, color: borderColor),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
