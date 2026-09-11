import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/accessible_text.dart';

/// Builds the control that expands or collapses a [CollapsibleText].
typedef CollapsibleToggleBuilder =
    Widget Function(
      BuildContext context, {
      required bool expanded,
      required VoidCallback onToggle,
    });

/// Text that is truncated to [maxLines] with a toggle to show it in full.
///
/// The toggle only appears when the text, laid out with the ambient style at
/// the available width, exceeds [maxLines]. In landscape one line is
/// reserved for the toggle. The design-system packages provide the toggle
/// through [toggleBuilder].
final class CollapsibleText extends StatefulWidget {
  /// Creates a collapsible text.
  const CollapsibleText({
    required this.text,
    required this.toggleBuilder,
    this.maxLines = 3,
    this.style,
    super.key,
  }) : assert(maxLines > 0, 'maxLines must be at least 1');

  /// The text to display.
  final String text;

  /// Builds the expand/collapse control.
  final CollapsibleToggleBuilder toggleBuilder;

  /// The number of lines shown while collapsed.
  final int maxLines;

  /// The style merged over the ambient [DefaultTextStyle].
  final TextStyle? style;

  @override
  State<CollapsibleText> createState() => _CollapsibleTextState();
}

class _CollapsibleTextState extends State<CollapsibleText> {
  bool _expanded = false;

  void _toggle() => setState(() => _expanded = !_expanded);

  int _lineCount(BuildContext context, double maxWidth) {
    final style = DefaultTextStyle.of(context).style.merge(widget.style);
    final painter = TextPainter(
      text: TextSpan(text: widget.text, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout(maxWidth: maxWidth);
    final lines = painter.computeLineMetrics().length;
    painter.dispose();
    return lines;
  }

  int _collapsedMaxLines(BuildContext context) =>
      widget.maxLines > 1 &&
          MediaQuery.orientationOf(context) == Orientation.landscape
      ? widget.maxLines - 1
      : widget.maxLines;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      if (_lineCount(context, constraints.maxWidth) <= widget.maxLines) {
        return AccessibleText(widget.text, style: widget.style);
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AccessibleText(
            widget.text,
            style: widget.style,
            maxLines: _expanded ? null : _collapsedMaxLines(context),
            overflow: _expanded ? null : TextOverflow.ellipsis,
          ),
          widget.toggleBuilder(context, expanded: _expanded, onToggle: _toggle),
        ],
      );
    },
  );
}
