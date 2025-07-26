import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// A widget that shows a text with on click to a button.
final class ReadMoreTextButton extends StatefulWidget {
  /// The text to display.
  final String text;

  /// The alignment of the read more button.
  final MainAxisAlignment readMoreButtonAlignment;

  /// The style of the [text].
  final TextStyle? bodyTextStyle;

  /// The style of the [text].
  final TextStyle? readMoreButtonTextStyle;

  /// Create a [ReadMoreTextButton] widget.
  const ReadMoreTextButton({
    required this.text,
    this.readMoreButtonAlignment = MainAxisAlignment.start,
    this.bodyTextStyle,
    this.readMoreButtonTextStyle,
    super.key,
  });

  @override
  State<ReadMoreTextButton> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreTextButton> {
  final ValueNotifier<bool> _isTextExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _isTextExpanded,
        builder: (context, isTextExpanded, child) => Column(
          children: [
            Visibility(
              visible: isTextExpanded,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSize.smaller,
                ),
                child: Column(
                  children: [
                    AccessibleText(
                      widget.text,
                      style:
                          widget.bodyTextStyle ?? context.textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: Colors.transparent,
                iconColor: context.colorScheme.onSurface,
              ),
              onPressed: () {
                _isTextExpanded.value = !_isTextExpanded.value;
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: widget.readMoreButtonAlignment,
                  children: [
                    Icon(
                      isTextExpanded
                          ? Icons.remove_circle_outline
                          : Icons.add_circle_outline,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    AccessibleText(
                      isTextExpanded
                          ? context.l10na.less_info
                          : context.l10na.more_info,
                      style: widget.readMoreButtonTextStyle ??
                          context.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
