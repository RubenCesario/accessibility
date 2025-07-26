import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

/// {@template TextRawMagnifier}
/// A magnifier optimized for [Text] widgets, but
/// can be used with any widget.
///
/// {@endtemplate}
final class TextRawMagnifier extends StatefulWidget {
  /// The child widget that will be magnified.
  final Widget child;

  /// {@macro TextRawMagnifier}
  const TextRawMagnifier({
    required this.child,
    super.key,
  });

  @override
  State<TextRawMagnifier> createState() => _TextRawMagnifierState();
}

class _TextRawMagnifierState extends State<TextRawMagnifier> {
  /// The position of the gesture that started the magnifier.
  Offset dragGesturePosition = Offset.zero;

  /// Whether the magnifier is shown or not.
  final ValueNotifier<bool> _showMagnifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          GestureDetector(
            onTapUp: (details) {
              dragGesturePosition = details.localPosition;
            },
            onLongPress: () {
              _showMagnifier.value = true;
            },
            onLongPressMoveUpdate: (details) {
              setState(() {
                dragGesturePosition = details.localPosition;
              });
            },
            onLongPressEnd: (_) {
              setState(() {
                _showMagnifier.value = false;
                dragGesturePosition = Offset.zero;
              });
            },
            child: widget.child,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _showMagnifier,
            builder: (context, showMagnifier, _) => showMagnifier
                ? Positioned(
                    left: dragGesturePosition.dx,
                    top: dragGesturePosition.dy,
                    child: RawMagnifier(
                      size: const Size(200, 100),
                      magnificationScale: 1.5,
                      decoration: MagnifierDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 3,
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      );
}
