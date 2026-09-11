import 'package:accessibility/src/domain/models/enum_by_name.dart';
import 'package:accessibility/src/domain/models/json_reading.dart';
import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:meta/meta.dart';

/// Sentinel that tells [TextSettings.copyWith] a parameter was not passed.
const Object _unset = Object();

/// The text accessibility settings.
///
/// `null` on a nullable field means "do not override the app value". The
/// ranges follow WCAG 2.1 AA 1.4.4 (resize text) and 1.4.12 (text spacing).
@immutable
final class TextSettings {
  /// Creates text settings. Every parameter is optional.
  const TextSettings({
    this.lineHeight,
    this.wordSpacing,
    this.letterSpacing,
    this.textScaleFactor = 1.0,
    this.isBold = false,
    this.textAlign = TextAlignMode.none,
    this.color,
    this.fontFamily,
  });

  /// The settings that override nothing.
  static const defaults = TextSettings();

  /// Creates settings from a JSON object produced by [toJson].
  ///
  /// Missing keys and values of the wrong type fall back to the defaults;
  /// unknown [textAlign] names fall back to [TextAlignMode.none].
  factory TextSettings.fromJson(Map<String, Object?> json) => TextSettings(
    lineHeight: readDouble(json, 'lineHeight'),
    wordSpacing: readDouble(json, 'wordSpacing'),
    letterSpacing: readDouble(json, 'letterSpacing'),
    textScaleFactor:
        readDouble(json, 'textScaleFactor') ?? defaults.textScaleFactor,
    isBold: readBool(json, 'isBold') ?? defaults.isBold,
    textAlign: enumByName(
      TextAlignMode.values,
      json['textAlign'],
      fallback: defaults.textAlign,
    ),
    color: readInt(json, 'color'),
    fontFamily: readString(json, 'fontFamily'),
  );

  /// Line height multiplier, or `null` to keep the app value.
  final double? lineHeight;

  /// Extra space between words in logical pixels, or `null`.
  final double? wordSpacing;

  /// Extra space between letters in logical pixels, or `null`.
  final double? letterSpacing;

  /// Multiplier applied to every font size. `1.0` means no scaling.
  final double textScaleFactor;

  /// Whether all text is rendered bold.
  final bool isBold;

  /// Horizontal alignment override.
  final TextAlignMode textAlign;

  /// Text colour as ARGB, or `null` to keep the theme colour.
  final int? color;

  /// Font family override, or `null` to keep the app font.
  final String? fontFamily;

  /// Whether these settings equal [defaults].
  bool get isDefault => this == defaults;

  /// Returns a copy with the given fields replaced.
  ///
  /// Passing `null` for [lineHeight], [wordSpacing], [letterSpacing],
  /// [color] or [fontFamily] clears that field; not passing it keeps the
  /// current value.
  TextSettings copyWith({
    Object? lineHeight = _unset,
    Object? wordSpacing = _unset,
    Object? letterSpacing = _unset,
    double? textScaleFactor,
    bool? isBold,
    TextAlignMode? textAlign,
    Object? color = _unset,
    Object? fontFamily = _unset,
  }) => TextSettings(
    lineHeight: identical(lineHeight, _unset)
        ? this.lineHeight
        : lineHeight == null
        ? null
        : (lineHeight is int ? lineHeight.toDouble() : lineHeight as double?),
    wordSpacing: identical(wordSpacing, _unset)
        ? this.wordSpacing
        : wordSpacing == null
        ? null
        : (wordSpacing is int
              ? wordSpacing.toDouble()
              : wordSpacing as double?),
    letterSpacing: identical(letterSpacing, _unset)
        ? this.letterSpacing
        : letterSpacing == null
        ? null
        : (letterSpacing is int
              ? letterSpacing.toDouble()
              : letterSpacing as double?),
    textScaleFactor: textScaleFactor ?? this.textScaleFactor,
    isBold: isBold ?? this.isBold,
    textAlign: textAlign ?? this.textAlign,
    color: identical(color, _unset) ? this.color : color as int?,
    fontFamily: identical(fontFamily, _unset)
        ? this.fontFamily
        : fontFamily as String?,
  );

  /// Serialises to a JSON object with one key per field.
  Map<String, Object?> toJson() => {
    'lineHeight': lineHeight,
    'wordSpacing': wordSpacing,
    'letterSpacing': letterSpacing,
    'textScaleFactor': textScaleFactor,
    'isBold': isBold,
    'textAlign': textAlign.name,
    'color': color,
    'fontFamily': fontFamily,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextSettings &&
          other.lineHeight == lineHeight &&
          other.wordSpacing == wordSpacing &&
          other.letterSpacing == letterSpacing &&
          other.textScaleFactor == textScaleFactor &&
          other.isBold == isBold &&
          other.textAlign == textAlign &&
          other.color == color &&
          other.fontFamily == fontFamily;

  @override
  int get hashCode => Object.hash(
    lineHeight,
    wordSpacing,
    letterSpacing,
    textScaleFactor,
    isBold,
    textAlign,
    color,
    fontFamily,
  );

  @override
  String toString() =>
      'TextSettings('
      'lineHeight: $lineHeight, '
      'wordSpacing: $wordSpacing, '
      'letterSpacing: $letterSpacing, '
      'textScaleFactor: $textScaleFactor, '
      'isBold: $isBold, '
      'textAlign: $textAlign, '
      'color: $color, '
      'fontFamily: $fontFamily)';
}
