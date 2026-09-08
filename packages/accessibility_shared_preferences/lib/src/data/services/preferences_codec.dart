import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';

/// Builds the settings from stored key-value pairs, translating the 1.x
/// sentinels (`-1.0`, `0`, `''`, `none`) and the 1.x effects boolean.
///
/// Returns `null` when none of [PreferencesKeys.settings] is present.
/// Values of the wrong type and unknown enum names fall back to the
/// defaults, like the JSON codec of the core.
AccessibilitySettings? settingsFromPreferences(Map<String, Object?> values) {
  if (!PreferencesKeys.settings.any(values.containsKey)) {
    return null;
  }
  return AccessibilitySettings(
    themeMode: _enumByName(
      AccessibilityThemeMode.values,
      values[PreferencesKeys.themeMode],
      fallback: AccessibilityThemeMode.system,
    ),
    effectsMode: _effectsMode(values),
    textSettings: TextSettings(
      textScaleFactor:
          _double(values[PreferencesKeys.textScaleFactor]) ??
          TextSettings.defaults.textScaleFactor,
      lineHeight: _unsetBelowZero(values[PreferencesKeys.lineHeight]),
      letterSpacing: _unsetBelowZero(values[PreferencesKeys.letterSpacing]),
      wordSpacing: _unsetBelowZero(values[PreferencesKeys.wordSpacing]),
      isBold:
          _bool(values[PreferencesKeys.isBold]) ?? TextSettings.defaults.isBold,
      textAlign: _enumByName(
        TextAlignMode.values,
        values[PreferencesKeys.textAlign],
        fallback: TextAlignMode.none,
      ),
      color: _color(values[PreferencesKeys.textColor]),
      fontFamily: _nonEmptyString(values[PreferencesKeys.fontFamily]),
    ),
    colorSettings: ColorSettings(
      backgroundColor: _color(values[PreferencesKeys.backgroundColor]),
      colorProfile: _enumByName(
        ColorProfileLevel.values,
        values[PreferencesKeys.colorProfile],
        fallback: ColorProfileLevel.normal,
      ),
    ),
  );
}

/// The key-value pairs that store [settings].
///
/// A `null` value means the key must be removed, so an unset field never
/// leaves a stale value behind. The legacy keys are never written.
Map<String, Object?> preferencesFromSettings(AccessibilitySettings settings) {
  final text = settings.textSettings;
  final color = settings.colorSettings;
  return {
    PreferencesKeys.themeMode: settings.themeMode.name,
    PreferencesKeys.effectsMode: settings.effectsMode.name,
    PreferencesKeys.textScaleFactor: text.textScaleFactor,
    PreferencesKeys.lineHeight: text.lineHeight,
    PreferencesKeys.letterSpacing: text.letterSpacing,
    PreferencesKeys.wordSpacing: text.wordSpacing,
    PreferencesKeys.isBold: text.isBold,
    PreferencesKeys.textAlign: text.textAlign.name,
    PreferencesKeys.textColor: text.color,
    PreferencesKeys.fontFamily: text.fontFamily,
    PreferencesKeys.backgroundColor: color.backgroundColor,
    PreferencesKeys.colorProfile: color.colorProfile.name,
  };
}

EffectsMode _effectsMode(Map<String, Object?> values) {
  final stored = values[PreferencesKeys.effectsMode];
  if (values.containsKey(PreferencesKeys.effectsMode)) {
    return _enumByName(
      EffectsMode.values,
      stored,
      fallback: EffectsMode.system,
    );
  }
  return switch (_bool(values[PreferencesKeys.legacyEffectsAllowed])) {
    true => EffectsMode.enabled,
    false => EffectsMode.disabled,
    null => EffectsMode.system,
  };
}

T _enumByName<T extends Enum>(
  List<T> values,
  Object? name, {
  required T fallback,
}) {
  if (name is! String) {
    return fallback;
  }
  for (final value in values) {
    if (value.name == name) {
      return value;
    }
  }
  return fallback;
}

double? _double(Object? value) => value is num ? value.toDouble() : null;

/// A double that 1.x stored as `-1.0` when unset.
double? _unsetBelowZero(Object? value) {
  final parsed = _double(value);
  return parsed == null || parsed < 0 ? null : parsed;
}

bool? _bool(Object? value) => value is bool ? value : null;

/// An ARGB colour that 1.x stored as `0` when unset.
int? _color(Object? value) => value is int && value != 0 ? value : null;

String? _nonEmptyString(Object? value) =>
    value is String && value.isNotEmpty ? value : null;
