import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:flutter/foundation.dart' show immutable;

/// Defines all theme profile levels.
enum ThemeProfileLevel {
  /// This profile represents the default settings of the
  /// application.
  none,

  /// This profile enables epileptic and seizure prone users
  /// to browse safely by eliminating the risk of seizures that
  /// result from flashing or blinking animations and risky
  /// color combinations.
  seizureSafe,

  /// This profile adjusts the website, so that it is accessible
  /// to the majority of visual impairments such as Degrading
  /// Eyesight, Tunnel Vision, Cataract, Glaucoma, and others.
  visionImpaired,

  /// This profile significantly reduces distractions, to help
  /// people with ADHD and Neurodevelopmental disorders browse,
  /// read, and focus on the essential elements of the website
  /// more easily.
  adhdFriendly;

  /// Parses a [String] to a [ThemeProfileLevel].
  static ThemeProfileLevel fromString(String key) =>
      ThemeProfileLevel.values.firstWhere(
        (element) => element.name == key,
        orElse: () => ThemeProfileLevel.none,
      );
}

/// Models a theme profile.
@immutable
final class ThemeProfile {
  /// Creates a [ThemeProfile] instance.
  const ThemeProfile._({
    this.textSettings = TextSettings.defaultSettings,
    this.colorSettings = ColorSettings.defaultSettings,
    this.effectsAllowed = LocalStorageDefaultValues.effectsAllowedDefault,
  });

  /// The default theme profile.
  static const defaultTheme = ThemeProfile._();

  /// The text accessibility settings of the theme profile.
  final TextSettings textSettings;

  /// The color settings of the theme profile.
  final ColorSettings colorSettings;

  /// The effects allowed setting of the theme profile.
  final bool effectsAllowed;

  /// Creates a [ThemeProfile] instance from a [ThemeProfileLevel].
  factory ThemeProfile.fromLevel(ThemeProfileLevel level) => switch (level) {
        ThemeProfileLevel.seizureSafe => ThemeProfile._seizureSafe(),
        ThemeProfileLevel.visionImpaired => ThemeProfile._visionImpaired(),
        ThemeProfileLevel.adhdFriendly => ThemeProfile._adhdFriendly(),
        ThemeProfileLevel.none => ThemeProfile.defaultTheme,
      };

  factory ThemeProfile._seizureSafe() => const ThemeProfile._(
        effectsAllowed: false,
        colorSettings: ColorSettings(
          colorProfileLevel: ColorProfileLevel.lowSaturation,
        ),
      );

  factory ThemeProfile._visionImpaired() => const ThemeProfile._(
        textSettings: TextSettings(
          isFontWeightBold: true,
          textScaleFactor: 2,
        ),
        colorSettings: ColorSettings(
          colorProfileLevel: ColorProfileLevel.highSaturation,
        ),
      );

  factory ThemeProfile._adhdFriendly() => const ThemeProfile._(
        textSettings: TextSettings(
          textScaleFactor: 1.25,
        ),
        effectsAllowed: false,
        colorSettings: ColorSettings(
          colorProfileLevel: ColorProfileLevel.highSaturation,
        ),
      );

  /// Creates a copy of this [ThemeProfile] with the given fields replaced.
  ThemeProfile copyWith({
    TextSettings? textSettings,
    ColorSettings? colorSettings,
    bool? effectsAllowed,
  }) =>
      ThemeProfile._(
        textSettings: textSettings ?? this.textSettings,
        colorSettings: colorSettings ?? this.colorSettings,
        effectsAllowed: effectsAllowed ?? this.effectsAllowed,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeProfile &&
          runtimeType == other.runtimeType &&
          textSettings == other.textSettings &&
          colorSettings == other.colorSettings &&
          effectsAllowed == other.effectsAllowed;

  @override
  int get hashCode =>
      textSettings.hashCode ^ colorSettings.hashCode ^ effectsAllowed.hashCode;

  @override
  String toString() => 'ThemeProfile('
      'textSettings: $textSettings, '
      'colorSettings: $colorSettings, '
      'effectsAllowed: $effectsAllowed)';
}
