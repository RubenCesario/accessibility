import 'dart:ui' as ui show TextHeightBehavior;

import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/utils/parser.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RenderParagraph;
import 'package:flutter/widgets.dart';

/// {@template AccessibleText}
/// A [Text] that adapts its theme based on the accessibility settings.
///
/// All declared properties of an [AccessibleText] are automatically
/// overridden with the properties [TextSettings], if any.
/// {@endtemplate}
final class AccessibleText extends StatelessWidget {
  /// {@macro AccessibleText}
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

  /// The color of the text.
  ///
  /// This color override any existing setting.
  final Color? textColor;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle? style;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with
  /// `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned
  /// as if there was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// {@macro flutter.painting.textPainter.textScaler}
  final TextScaler? textScaler;

  /// An optional maximum number of lines for the text
  /// to span, wrapping if necessary.
  ///
  /// If the text exceeds the given number of lines, it will be truncated
  /// according to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// {@template flutter.widgets.Text.semanticsLabel}
  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics
  /// labels applied directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// const Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  /// {@endtemplate}
  final String? semanticsLabel;

  /// A unique identifier for the semantics node for this widget.
  ///
  /// This is useful for cases where the text widget needs to have a uniquely
  /// identifiable ID that is recognized through the automation tools without
  /// having a dependency on the actual content of the text that can possibly be
  /// dynamic in nature.
  final String? semanticsIdentifier;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// The color to use when painting the selection.
  ///
  /// This is ignored if [SelectionContainer.maybeOf] returns null
  /// in the [BuildContext] of the [Text] widget.
  ///
  /// If null, the ambient [DefaultSelectionStyle] is used (if any); failing
  /// that, the selection color defaults to [DefaultSelectionStyle.defaultColor]
  /// (semi-transparent grey).
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable:
            AccessibilitySettingsInherited.of(context).textSettings,
        builder: (_, textSettings, __) {
          TextAlign? customTextAlign;
          TextStyle? customStyle;
          if (textSettings != TextSettings.defaultSettings) {
            final defaultTextStyle = DefaultTextStyle.of(context);
            customTextAlign = (textSettings.textAlignMode !=
                    LocalStorageDefaultValues.textAlignmentDefault)
                ? parseTextAlign(
                    textSettings.textAlignMode,
                  )
                : textAlign ?? defaultTextStyle.textAlign;
            customStyle = defaultTextStyle.style.merge(style);
            if (textColor != null) {
              customStyle = customStyle.copyWith(
                color: textColor,
              );
            }
          }
          return Text(
            data,
            textAlign: customTextAlign ?? textAlign,
            style: customStyle ?? style,
            strutStyle: strutStyle,
            textDirection: textDirection,
            maxLines: maxLines,
            softWrap: softWrap,
            overflow: overflow,
            selectionColor: selectionColor,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            locale: locale,
            textScaler: textScaler,
            semanticsIdentifier: semanticsIdentifier,
            semanticsLabel: semanticsLabel,
            key: key,
          );
        },
      );
}
