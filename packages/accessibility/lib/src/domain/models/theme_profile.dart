import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:meta/meta.dart';

/// The text, colour and effects values of a [ThemeProfileLevel] preset.
@immutable
final class ThemeProfile {
  const ThemeProfile._({
    required this.level,
    this.textSettings = TextSettings.defaults,
    this.colorSettings = ColorSettings.defaults,
    this.effectsMode = EffectsMode.system,
  });

  /// Returns the preset of [level].
  factory ThemeProfile.fromLevel(ThemeProfileLevel level) => switch (level) {
    ThemeProfileLevel.none => none,
    ThemeProfileLevel.seizureSafe => seizureSafe,
    ThemeProfileLevel.visionImpaired => visionImpaired,
    ThemeProfileLevel.adhdFriendly => adhdFriendly,
  };

  /// The default settings.
  static const none = ThemeProfile._(level: ThemeProfileLevel.none);

  /// No effects, low saturation.
  static const seizureSafe = ThemeProfile._(
    level: ThemeProfileLevel.seizureSafe,
    effectsMode: EffectsMode.disabled,
    colorSettings: ColorSettings(colorProfile: ColorProfileLevel.lowSaturation),
  );

  /// Bold, doubled text, high saturation.
  static const visionImpaired = ThemeProfile._(
    level: ThemeProfileLevel.visionImpaired,
    textSettings: TextSettings(isBold: true, textScaleFactor: 2),
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// Slightly larger text, no effects, high saturation.
  static const adhdFriendly = ThemeProfile._(
    level: ThemeProfileLevel.adhdFriendly,
    textSettings: TextSettings(textScaleFactor: 1.25),
    effectsMode: EffectsMode.disabled,
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// The level this preset implements.
  final ThemeProfileLevel level;

  /// The text settings of the preset.
  final TextSettings textSettings;

  /// The colour settings of the preset.
  final ColorSettings colorSettings;

  /// The effects mode of the preset.
  final EffectsMode effectsMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeProfile &&
          other.level == level &&
          other.textSettings == textSettings &&
          other.colorSettings == colorSettings &&
          other.effectsMode == effectsMode;

  @override
  int get hashCode =>
      Object.hash(level, textSettings, colorSettings, effectsMode);

  @override
  String toString() =>
      'ThemeProfile('
      'level: $level, '
      'textSettings: $textSettings, '
      'colorSettings: $colorSettings, '
      'effectsMode: $effectsMode)';
}
