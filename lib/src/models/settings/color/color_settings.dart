import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:flutter/foundation.dart' show immutable;

/// Defines the color settings model.
@immutable
final class ColorSettings {
  /// Creates a [ColorSettings] object.
  const ColorSettings({
    this.pagesBackgroundColorValue = LocalStorageDefaultValues.noColorSelected,
    this.colorProfileLevel = ColorProfileLevel.normal,
  });

  /// Creates a [ColorSettings] object with default settings.
  static const ColorSettings defaultSettings = ColorSettings();

  /// The background color value of the pages for all themes color.
  ///
  /// If the value in non-null, the color will override
  /// any existing theme color configuration.
  final int pagesBackgroundColorValue;

  /// The color profile for all themes color.
  final ColorProfileLevel colorProfileLevel;

  /// Return a new instance of [ColorSettings] updated with
  /// all given parameters.
  ColorSettings copyWith({
    int? pagesBackgroundColorValue,
    ColorProfileLevel? colorProfileLevel,
  }) =>
      ColorSettings(
        pagesBackgroundColorValue:
            pagesBackgroundColorValue ?? this.pagesBackgroundColorValue,
        colorProfileLevel: colorProfileLevel ?? this.colorProfileLevel,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ColorSettings &&
        other.pagesBackgroundColorValue == pagesBackgroundColorValue &&
        other.colorProfileLevel == colorProfileLevel;
  }

  @override
  int get hashCode =>
      pagesBackgroundColorValue.hashCode ^ colorProfileLevel.hashCode;
}
