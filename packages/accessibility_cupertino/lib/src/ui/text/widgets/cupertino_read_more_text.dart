import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A [CollapsibleText] with a Cupertino button using the localised
/// `moreInfo` / `lessInfo` labels to expand or collapse the text. The
/// toggle is coloured with [kPanelAccentTextColor], not the theme's own
/// `primaryColor` (`CupertinoColors.systemBlue`), which does not contrast
/// enough against the page background in either brightness.
final class CupertinoReadMoreText extends StatelessWidget {
  /// Creates the text, collapsed to [maxLines].
  const CupertinoReadMoreText({
    required this.text,
    this.maxLines = 3,
    this.style,
    super.key,
  });

  /// The text to display.
  final String text;

  /// The number of lines shown while collapsed.
  final int maxLines;

  /// The style merged over the ambient text style.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => CollapsibleText(
    text: text,
    maxLines: maxLines,
    style: style,
    toggleBuilder: (context, {required expanded, required onToggle}) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        foregroundColor: kPanelAccentTextColor,
        onPressed: onToggle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Icon(
              expanded
                  ? CupertinoIcons.minus_circle
                  : CupertinoIcons.plus_circle,
            ),
            Text(expanded ? context.l10n.lessInfo : context.l10n.moreInfo),
          ],
        ),
      ),
    ),
  );
}
