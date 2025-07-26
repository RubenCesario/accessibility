import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/utils/parser.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// {@template AccessibleText}
/// A [Text] that adapts its theme based on the accessibility settings.
///
/// All declared properties of an [AccessibleText] are automatically
/// overridden with the properties [TextSettings], if any.
/// {@endtemplate}
final class AccessibleText extends Text {
  /// The color of the text.
  ///
  /// This color override any existing setting.
  final Color? textColor;

  /// {@macro AccessibleText}
  const AccessibleText(
    super.data, {
    this.textColor,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.softWrap,
    super.overflow,
    super.maxLines,
    super.semanticsLabel,
    super.locale,
    super.textScaler,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    super.key,
  });

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
            data ?? '',
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
