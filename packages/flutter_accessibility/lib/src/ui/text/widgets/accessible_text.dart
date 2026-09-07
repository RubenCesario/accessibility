import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_text_style.dart';
import 'package:flutter_accessibility/src/ui/core/text_align_mode_mapping.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// A [Text] whose alignment follows the accessibility text settings.
///
/// The style is the ambient [DefaultTextStyle] merged with [style], with
/// [textColor] overriding the colour. The widget never applies the text
/// scale, spacing, weight or family itself: the theme packages apply them to
/// every text theme style, and a custom design system applies them once with
/// [AccessibleTextStyle.applyTextSettings] on its root [DefaultTextStyle].
/// Applying them here as well would scale text twice. The settings alignment,
/// when set, overrides [textAlign].
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

  /// A colour that overrides the ambient colour.
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
    var effectiveStyle = DefaultTextStyle.of(context).style.merge(style);
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
