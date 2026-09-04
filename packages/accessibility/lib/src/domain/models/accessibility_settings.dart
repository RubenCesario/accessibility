import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:meta/meta.dart';

/// Every accessibility setting of the application, as one immutable value.
@immutable
final class AccessibilitySettings {
  /// Creates settings. Every parameter is optional.
  const AccessibilitySettings({
    this.themeMode = AccessibilityThemeMode.system,
    this.effectsMode = EffectsMode.system,
    this.textSettings = TextSettings.defaults,
    this.colorSettings = ColorSettings.defaults,
  });

  /// The settings that follow the system and override nothing.
  static const defaults = AccessibilitySettings();

  /// The theme brightness.
  final AccessibilityThemeMode themeMode;

  /// Whether effects and animations are allowed.
  final EffectsMode effectsMode;

  /// The text settings.
  final TextSettings textSettings;

  /// The colour settings.
  final ColorSettings colorSettings;

  /// Whether these settings equal [defaults].
  bool get isDefault => this == defaults;

  /// The preset whose text, colour and effects values equal this instance,
  /// or [ThemeProfileLevel.none] when no preset matches.
  ///
  /// Derived on every call; never stored.
  ThemeProfileLevel get matchingThemeProfile {
    const candidates = [
      ThemeProfileLevel.seizureSafe,
      ThemeProfileLevel.visionImpaired,
      ThemeProfileLevel.adhdFriendly,
    ];
    for (final level in candidates) {
      final profile = ThemeProfile.fromLevel(level);
      if (textSettings == profile.textSettings &&
          colorSettings == profile.colorSettings &&
          effectsMode == profile.effectsMode) {
        return level;
      }
    }
    return ThemeProfileLevel.none;
  }

  /// Returns a copy with the given fields replaced.
  AccessibilitySettings copyWith({
    AccessibilityThemeMode? themeMode,
    EffectsMode? effectsMode,
    TextSettings? textSettings,
    ColorSettings? colorSettings,
  }) => AccessibilitySettings(
    themeMode: themeMode ?? this.themeMode,
    effectsMode: effectsMode ?? this.effectsMode,
    textSettings: textSettings ?? this.textSettings,
    colorSettings: colorSettings ?? this.colorSettings,
  );

  /// Returns a copy whose text, colour and effects values are those of the
  /// [level] preset. [themeMode] is kept.
  AccessibilitySettings withThemeProfile(ThemeProfileLevel level) {
    final profile = ThemeProfile.fromLevel(level);
    return copyWith(
      textSettings: profile.textSettings,
      colorSettings: profile.colorSettings,
      effectsMode: profile.effectsMode,
    );
  }

  /// Returns a copy with the next [ColorProfileLevel], wrapping around.
  AccessibilitySettings withNextColorProfile() {
    const levels = ColorProfileLevel.values;
    final next = levels[(colorSettings.colorProfile.index + 1) % levels.length];
    return copyWith(colorSettings: colorSettings.copyWith(colorProfile: next));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessibilitySettings &&
          other.themeMode == themeMode &&
          other.effectsMode == effectsMode &&
          other.textSettings == textSettings &&
          other.colorSettings == colorSettings;

  @override
  int get hashCode =>
      Object.hash(themeMode, effectsMode, textSettings, colorSettings);

  @override
  String toString() =>
      'AccessibilitySettings('
      'themeMode: $themeMode, '
      'effectsMode: $effectsMode, '
      'textSettings: $textSettings, '
      'colorSettings: $colorSettings)';
}
