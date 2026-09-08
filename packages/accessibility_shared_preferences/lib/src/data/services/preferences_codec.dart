import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';

/// Builds the settings from stored key-value pairs, translating the 1.x
/// sentinels (`-1.0`, `0`, `''`) and the 1.x effects boolean, then letting
/// [AccessibilitySettings.fromJson] apply the defaults for missing keys,
/// wrong types and unknown enum names.
///
/// Returns `null` when none of [PreferencesKeys.settings] is present.
AccessibilitySettings? settingsFromPreferences(Map<String, Object?> values) {
  if (!PreferencesKeys.settings.any(values.containsKey)) {
    return null;
  }
  return AccessibilitySettings.fromJson({
    'themeMode': values[PreferencesKeys.themeMode],
    'effectsMode': _effectsMode(values),
    'textSettings': {
      'textScaleFactor': values[PreferencesKeys.textScaleFactor],
      'lineHeight': _unsetBelowZero(values[PreferencesKeys.lineHeight]),
      'letterSpacing': _unsetBelowZero(values[PreferencesKeys.letterSpacing]),
      'wordSpacing': _unsetBelowZero(values[PreferencesKeys.wordSpacing]),
      'isBold': values[PreferencesKeys.isBold],
      'textAlign': values[PreferencesKeys.textAlign],
      'color': _unsetZero(values[PreferencesKeys.textColor]),
      'fontFamily': _unsetEmpty(values[PreferencesKeys.fontFamily]),
    },
    'colorSettings': {
      'backgroundColor': _unsetZero(values[PreferencesKeys.backgroundColor]),
      'colorProfile': values[PreferencesKeys.colorProfile],
    },
  });
}

/// The key-value pairs that store [settings], from
/// [AccessibilitySettings.toJson] renamed to the 1.x keys.
///
/// A `null` value means the key must be removed, so an unset field never
/// leaves a stale value behind. The legacy keys are never written.
Map<String, Object?> preferencesFromSettings(AccessibilitySettings settings) {
  final json = settings.toJson();
  final text = json['textSettings']! as Map<String, Object?>;
  final color = json['colorSettings']! as Map<String, Object?>;
  return {
    PreferencesKeys.themeMode: json['themeMode'],
    PreferencesKeys.effectsMode: json['effectsMode'],
    PreferencesKeys.textScaleFactor: text['textScaleFactor'],
    PreferencesKeys.lineHeight: text['lineHeight'],
    PreferencesKeys.letterSpacing: text['letterSpacing'],
    PreferencesKeys.wordSpacing: text['wordSpacing'],
    PreferencesKeys.isBold: text['isBold'],
    PreferencesKeys.textAlign: text['textAlign'],
    PreferencesKeys.textColor: text['color'],
    PreferencesKeys.fontFamily: text['fontFamily'],
    PreferencesKeys.backgroundColor: color['backgroundColor'],
    PreferencesKeys.colorProfile: color['colorProfile'],
  };
}

/// The effects mode name for [AccessibilitySettings.fromJson]: the stored
/// `effectsMode` value when its key is present (unknown values fall back to
/// `system` there); else the 1.x boolean, where `true` (the 1.x default)
/// becomes `system` and `false` becomes `disabled`; else `null`, that is
/// `system`.
Object? _effectsMode(Map<String, Object?> values) {
  if (values.containsKey(PreferencesKeys.effectsMode)) {
    return values[PreferencesKeys.effectsMode];
  }
  return switch (values[PreferencesKeys.legacyEffectsAllowed]) {
    true => EffectsMode.system.name,
    false => EffectsMode.disabled.name,
    _ => null,
  };
}

/// A double that 1.x stored as `-1.0` when unset; any negative value is
/// treated as unset. Other values pass through for the core to validate.
Object? _unsetBelowZero(Object? value) =>
    value is num && value < 0 ? null : value;

/// An ARGB colour that 1.x stored as `0` when unset.
Object? _unsetZero(Object? value) => value == 0 ? null : value;

/// A string that 1.x stored as `''` when unset.
Object? _unsetEmpty(Object? value) => value == '' ? null : value;
