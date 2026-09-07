import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_text_style.dart';
import 'package:flutter_accessibility/src/ui/core/text_align_mode_mapping.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// A [Text] that follows the accessibility text settings.
///
/// The effective style is the ambient [DefaultTextStyle] merged with [style],
/// with the text settings applied on top (scale, spacing, weight, font and
/// colour); [textColor] then overrides the colour. The settings alignment,
/// when set, overrides [textAlign]. Works without any design-system theme.
final class AccessibleText extends StatelessWidget {
  /// Creates an accessible text.
  const AccessibleText(
    this.data, {
    this.textColor,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.locale,
    this.textScaler,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.semanticsIdentifier,
    super.key,
  });

  /// The text to display.
  final String data;

  /// A colour that overrides both the style and the settings colour.
  final Color? textColor;

  /// The style merged over the ambient [DefaultTextStyle].
  final TextStyle? style;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// The alignment used when the settings do not override it.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow is handled.
  final TextOverflow? overflow;

  /// The maximum number of lines.
  final int? maxLines;

  /// {@macro flutter.widgets.Text.semanticsLabel}
  final String? semanticsLabel;

  /// The locale used to select a font for the same Unicode character.
  final Locale? locale;

  /// {@macro flutter.painting.textPainter.textScaler}
  final TextScaler? textScaler;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// The colour used when painting the selection.
  final Color? selectionColor;

  /// A unique identifier for the semantics node of this widget.
  final String? semanticsIdentifier;

  @override
  Widget build(BuildContext context) {
    final settings = AccessibilityScope.settingsOf(context).textSettings;
    final font = AccessibilityScope.of(context).activeFont;
    var effectiveStyle = DefaultTextStyle.of(
      context,
    ).style.merge(style).applyTextSettings(settings, font: font);
    if (textColor != null) {
      effectiveStyle = effectiveStyle.copyWith(color: textColor);
    }
    return Text(
      data,
      style: effectiveStyle,
      textAlign: settings.textAlign.toTextAlign() ?? textAlign,
      strutStyle: strutStyle,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      locale: locale,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
      semanticsIdentifier: semanticsIdentifier,
    );
  }
}
