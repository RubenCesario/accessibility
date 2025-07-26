import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:flutter/foundation.dart' show immutable;

/// Defines the text accessibility settings model.
///
/// The WCAG 2.1 AA guidelines were used to configure
/// the text style properties, referring to the following
/// rules:
///
/// - https://www.w3.org/Translations/WCAG21-it/#contrast-minimum
/// - https://www.w3.org/Translations/WCAG21-it/#resize-text
/// - https://www.w3.org/Translations/WCAG21-it/#text-spacing
@immutable
final class TextSettings {
  /// Creates a [TextSettings] object.
  const TextSettings({
    this.lineHeight = LocalStorageDefaultValues.lineHeightDefault,
    this.wordSpacing = LocalStorageDefaultValues.wordSpacingDefault,
    this.letterSpacing = LocalStorageDefaultValues.letterSpacingDefault,
    this.textScaleFactor = LocalStorageDefaultValues.textScaleFactorDefault,
    this.isFontWeightBold = LocalStorageDefaultValues.textFontWeightModeDefault,
    this.textAlignMode = LocalStorageDefaultValues.textAlignmentDefault,
    this.color = LocalStorageDefaultValues.noColorSelected,
  });

  /// Creates a [TextSettings] object with default settings.
  static const TextSettings defaultSettings = TextSettings();

  /// The line height of the text.
  final double lineHeight;

  /// The word spacing of the text.
  final double wordSpacing;

  /// The letter spacing of the text.
  final double letterSpacing;

  /// The text scale factor of the text.
  final double textScaleFactor;

  /// Whether the text is bold or not.
  final bool isFontWeightBold;

  /// The text alignment of the text.
  final String textAlignMode;

  /// The color value of the text.
  ///
  /// If the value in non-null, the color will override
  /// any existing theme color configuration.
  final int color;

  /// Return a new instance of [TextSettings] updated with
  /// all given parameters.
  TextSettings copyWith({
    double? lineHeight,
    double? wordSpacing,
    double? letterSpacing,
    double? textScaleFactor,
    bool? isFontWeightBold,
    String? textAlignMode,
    int? color,
    double? saturationMultiplier,
  }) =>
      TextSettings(
        lineHeight: lineHeight ?? this.lineHeight,
        wordSpacing: wordSpacing ?? this.wordSpacing,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        isFontWeightBold: isFontWeightBold ?? this.isFontWeightBold,
        textAlignMode: textAlignMode ?? this.textAlignMode,
        color: color ?? this.color,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is TextSettings &&
        other.lineHeight == lineHeight &&
        other.wordSpacing == wordSpacing &&
        other.letterSpacing == letterSpacing &&
        other.textScaleFactor == textScaleFactor &&
        other.isFontWeightBold == isFontWeightBold &&
        other.textAlignMode == textAlignMode &&
        other.color == color;
  }

  @override
  int get hashCode =>
      lineHeight.hashCode ^
      wordSpacing.hashCode ^
      letterSpacing.hashCode ^
      textScaleFactor.hashCode ^
      isFontWeightBold.hashCode ^
      textAlignMode.hashCode ^
      color.hashCode;
}
