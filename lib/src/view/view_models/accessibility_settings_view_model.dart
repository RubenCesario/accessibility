import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:flutter/material.dart';

/// {@template AccessibilitySettingsViewModel}
/// A view model that manages the accessibility settings of the application.
/// {@endtemplate}
final class AccessibilitySettingsViewModel {
  /// {@macro AccessibilitySettingsViewModel}
  ///
  /// The provider is created from an [AccessibilitySettingsCollection].
  factory AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection({
    required AccessibilitySettingsCollection accessibilitySettingsCollection,
  }) =>
      AccessibilitySettingsViewModel._(
        effectsAllowed: accessibilitySettingsCollection.effectsAllowed,
        themeMode: accessibilitySettingsCollection.themeMode,
        textSettings: accessibilitySettingsCollection.textSettings,
        colorSettings: accessibilitySettingsCollection.colorSettings,
      );

  /// {@macro AccessibilitySettingsViewModel}
  AccessibilitySettingsViewModel._({
    bool effectsAllowed = LocalStorageDefaultValues.effectsAllowedDefault,
    ThemeMode themeMode = ThemeMode.system,
    TextSettings textSettings = TextSettings.defaultSettings,
    ColorSettings colorSettings = ColorSettings.defaultSettings,
  })  : _colorSettings = ValueNotifier(colorSettings),
        _textSettings = ValueNotifier(textSettings),
        _effectsAllowed = ValueNotifier(effectsAllowed),
        _themeMode = ValueNotifier(themeMode);

  final ValueNotifier<ThemeMode> _themeMode;

  final ValueNotifier<bool> _effectsAllowed;

  final ValueNotifier<TextSettings> _textSettings;

  final ValueNotifier<ColorSettings> _colorSettings;

  /// The current state of the effects allowed of the application.
  ValueNotifier<bool> get effectsAllowed => _effectsAllowed;

  /// The current state of the theme mode of the application.
  ValueNotifier<ThemeMode> get themeMode => _themeMode;

  /// The current state of the text accessibility settings of the application.
  ValueNotifier<TextSettings> get textSettings => _textSettings;

  /// The current state of the color settings of the application.
  ValueNotifier<ColorSettings> get colorSettings => _colorSettings;

  /// Disposes the resources used by the provider.
  void dispose() {
    _themeMode.dispose();
    _effectsAllowed.dispose();
    _textSettings.dispose();
    _colorSettings.dispose();
  }

  /// Restore the default settings of the application.
  void restoreDefaultSettings() => _replaceSettings(
        newEffectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
        newThemeMode: ThemeMode.system,
        newTextSettings: TextSettings.defaultSettings,
        newColorSettings: ColorSettings.defaultSettings,
      );

  /// Apply a theme profile to the application.
  void applyThemeProfile(ThemeProfileLevel themeProfileLevel) {
    final themeProfile = ThemeProfile.fromLevel(themeProfileLevel);
    _replaceSettings(
      newTextSettings: themeProfile.textSettings,
      newColorSettings: themeProfile.colorSettings,
      newEffectsAllowed: themeProfile.effectsAllowed,
    );
  }

  /// Update the text alignment in the application and in the
  /// shared preferences.
  void updateTextAlignSetting(String newTextAlignMode) {
    textSettings.value = textSettings.value.copyWith(
      textAlignMode: newTextAlignMode,
    );
  }

  /// Update the font weight in the application and in the
  /// shared preferences.
  void updateFontWeightSetting({
    required bool newSetting,
  }) {
    textSettings.value = textSettings.value.copyWith(
      isFontWeightBold: newSetting,
    );
  }

  /// Moves to the next color profile or the [newColorProfileLevelName]
  /// if it is provided.
  ///
  /// If it reaches the end, it starts again from the beginning.
  void updateColorProfileLevel({
    String? newColorProfileLevelName,
  }) {
    final nextColorProfileLevel = newColorProfileLevelName != null
        ? ColorProfileLevel.fromString(newColorProfileLevelName)
        : ColorProfile
            .values[(colorSettings.value.colorProfileLevel.index + 1) %
                ColorProfile.values.length]
            .level;
    colorSettings.value = colorSettings.value.copyWith(
      colorProfileLevel: nextColorProfileLevel,
    );
  }

  /// Update the pages background color in the application and in the
  /// shared preferences.
  void updatePagesBackgroundColorSettings(Color color) {
    _colorSettings.value = _colorSettings.value.copyWith(
      pagesBackgroundColorValue: color.toARGB32(),
    );
  }

  /// Update the text color in the application and in the
  /// shared preferences.
  void updateTextColorSettings(Color color) {
    textSettings.value = textSettings.value.copyWith(
      color: color.toARGB32(),
    );
  }

  /// Update the letter spacing in the application and in the
  /// shared preferences.
  void updateLetterSpacingSetting(double newSetting) {
    textSettings.value = textSettings.value.copyWith(
      letterSpacing: newSetting,
    );
  }

  /// Update the line height in the application and in the
  /// shared preferences.
  void updateLineHeightSetting(double newSetting) {
    textSettings.value = textSettings.value.copyWith(
      lineHeight: newSetting,
    );
  }

  /// Update the scale factor in the application and in the
  /// shared preferences.
  void updateScaleFactorSetting(double newSetting) {
    textSettings.value = textSettings.value.copyWith(
      textScaleFactor: newSetting,
    );
  }

  /// Update the word spacing in the application and in the
  /// shared preferences.
  void updateWordSpacingSetting(double newSetting) {
    textSettings.value = textSettings.value.copyWith(
      wordSpacing: newSetting,
    );
  }

  /// Replace all given setting to the existing ones.
  void _replaceSettings({
    ThemeMode? newThemeMode,
    bool? newEffectsAllowed,
    TextSettings? newTextSettings,
    ColorSettings? newColorSettings,
  }) {
    if (newThemeMode != null) {
      _themeMode.value = newThemeMode;
    }
    if (newEffectsAllowed != null) {
      _effectsAllowed.value = newEffectsAllowed;
    }
    if (newTextSettings != null) {
      _textSettings.value = newTextSettings;
    }
    if (newColorSettings != null) {
      _colorSettings.value = newColorSettings;
    }
  }

  /// Creates a copy of this view model with the given fields replaced.
  AccessibilitySettingsViewModel copyWith({
    ThemeMode? themeMode,
    bool? effectsAllowed,
    TextSettings? textSettings,
    ColorSettings? colorSettings,
  }) =>
      AccessibilitySettingsViewModel._(
        themeMode: themeMode ?? _themeMode.value,
        effectsAllowed: effectsAllowed ?? _effectsAllowed.value,
        textSettings: textSettings ?? _textSettings.value,
        colorSettings: colorSettings ?? _colorSettings.value,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is AccessibilitySettingsViewModel &&
        other._themeMode.value == _themeMode.value &&
        other._effectsAllowed.value == _effectsAllowed.value &&
        other._textSettings.value == _textSettings.value &&
        other._colorSettings.value == _colorSettings.value;
  }

  @override
  int get hashCode =>
      _themeMode.value.hashCode ^
      _effectsAllowed.value.hashCode ^
      _textSettings.value.hashCode ^
      _colorSettings.value.hashCode;

  @override
  String toString() => 'AccessibilitySettingsViewModel('
      'themeMode: ${_themeMode.value}, '
      'effectsAllowed: ${_effectsAllowed.value}, '
      'textSettings: ${_textSettings.value}, '
      'colorSettings: ${_colorSettings.value})';
}
