import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// {@template ReadMoreText}
/// A widget that shows a text with a read more button.
///
/// The text is not fully visibile but it depends on the
/// [maxLines] parameter.
/// {@endtemplate}
final class ReadMoreText extends StatefulWidget {
  /// The text to display.
  final String text;

  /// The maximum number of lines to show.
  final int maxLines;

  /// The alignment of the read more button.
  final MainAxisAlignment readMoreButtonAlignment;

  /// Whether the read more button has an icon.
  final bool hasReadMoreButtonAnIcon;

  /// The style of the [text].
  final TextStyle? bodyTextStyle;

  /// The style of the [text].
  final TextStyle? readMoreButtonTextStyle;

  /// {@macro ReadMoreText}
  const ReadMoreText({
    required this.text,
    this.maxLines = 3,
    this.readMoreButtonAlignment = MainAxisAlignment.start,
    this.hasReadMoreButtonAnIcon = true,
    this.bodyTextStyle,
    this.readMoreButtonTextStyle,
    super.key,
  }) : assert(maxLines > 0, 'Cannot have less than 1 line in a text');

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  final ValueNotifier<bool> _isTextExpanded = ValueNotifier(false);

  int _computeTextLines(BuildContext context, BoxConstraints constraints) {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: constraints.maxWidth);
    return textPainter.computeLineMetrics().length;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => _computeTextLines(
                  context,
                  constraints,
                ) <=
                widget.maxLines
            ? _ReadMoreTextFixed(
                text: widget.text,
                textStyle: widget.bodyTextStyle,
              )
            : ValueListenableBuilder<bool>(
                valueListenable: _isTextExpanded,
                builder: (_, isTextExpanded, __) => isTextExpanded
                    ? _ReadMoreTextExpanded(
                        text: widget.text,
                        onPressed: () {
                          _isTextExpanded.value = !_isTextExpanded.value;
                        },
                        readMoreButtonAlignment: widget.readMoreButtonAlignment,
                        hasReadMoreButtonAnIcon: widget.hasReadMoreButtonAnIcon,
                        bodyTextStyle: widget.bodyTextStyle,
                        readMoreButtonTextStyle: widget.readMoreButtonTextStyle,
                      )
                    : _ReadMoreTextReduced(
                        text: widget.text,
                        maxLines: widget.maxLines == 1
                            ? widget.maxLines
                            : context.orientation == Orientation.portrait
                                ? widget.maxLines
                                : widget.maxLines - 1,
                        onPressed: () {
                          _isTextExpanded.value = !_isTextExpanded.value;
                        },
                        readMoreButtonAlignment: widget.readMoreButtonAlignment,
                        hasReadMoreButtonAnIcon: widget.hasReadMoreButtonAnIcon,
                        bodyTextStyle: widget.bodyTextStyle,
                        readMoreButtonTextStyle: widget.readMoreButtonTextStyle,
                      ),
              ),
      );
}

class _ReadMoreTextReduced extends StatelessWidget {
  final String text;
  final int maxLines;
  final VoidCallback onPressed;
  final MainAxisAlignment readMoreButtonAlignment;
  final bool hasReadMoreButtonAnIcon;
  final TextStyle? bodyTextStyle;
  final TextStyle? readMoreButtonTextStyle;

  const _ReadMoreTextReduced({
    required this.text,
    required this.maxLines,
    required this.onPressed,
    required this.readMoreButtonAlignment,
    required this.hasReadMoreButtonAnIcon,
    this.bodyTextStyle,
    this.readMoreButtonTextStyle,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AccessibleText(
            text,
            maxLines: maxLines,
            style: bodyTextStyle ?? context.textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: onPressed,
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: readMoreButtonAlignment,
                children: [
                  AccessibleText(
                    context.l10na.read_more,
                    style: readMoreButtonTextStyle ??
                        context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (hasReadMoreButtonAnIcon)
                    Icon(
                      size: IconSize.large,
                      Icons.arrow_right,
                      semanticLabel: context.l10na.expand_text,
                    ),
                ],
              ),
            ),
          ),
        ],
      );
}

class _ReadMoreTextExpanded extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final MainAxisAlignment readMoreButtonAlignment;
  final bool hasReadMoreButtonAnIcon;
  final TextStyle? bodyTextStyle;
  final TextStyle? readMoreButtonTextStyle;

  const _ReadMoreTextExpanded({
    required this.text,
    required this.onPressed,
    required this.readMoreButtonAlignment,
    required this.hasReadMoreButtonAnIcon,
    this.bodyTextStyle,
    this.readMoreButtonTextStyle,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _ReadMoreTextFixed(
            text: text,
            textStyle: bodyTextStyle,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: onPressed,
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: readMoreButtonAlignment,
                children: [
                  AccessibleText(
                    context.l10na.read_less,
                    style: readMoreButtonTextStyle ??
                        context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (hasReadMoreButtonAnIcon)
                    Icon(
                      size: IconSize.large,
                      Icons.arrow_left,
                      semanticLabel: context.l10na.reduce_text,
                    ),
                ],
              ),
            ),
          ),
        ],
      );
}

/// A reusable part of [ReadMoreText] Widget
/// useful when don't need to display the expand/collapse button
class _ReadMoreTextFixed extends StatelessWidget {
  const _ReadMoreTextFixed({
    required this.text,
    this.textStyle,
  });
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: AccessibleText(
          text,
          style: textStyle ?? context.textTheme.bodyMedium,
        ),
      );
}
