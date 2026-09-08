import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A [CollapsibleText] with a Material button using the localised
/// `moreInfo` / `lessInfo` labels to expand or collapse the text.
final class ReadMoreText extends StatelessWidget {
  /// Creates the text, collapsed to [maxLines].
  const ReadMoreText({
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
      child: TextButton.icon(
        onPressed: onToggle,
        icon: Icon(
          expanded ? Icons.remove_circle_outline : Icons.add_circle_outline,
        ),
        label: Text(expanded ? context.l10n.lessInfo : context.l10n.moreInfo),
      ),
    ),
  );
}
