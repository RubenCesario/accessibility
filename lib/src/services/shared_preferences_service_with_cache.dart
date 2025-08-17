import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart' show immutable, visibleForTesting;
import 'package:flutter/material.dart' show ThemeMode;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferencesWithCache;

/// {@template SharedPreferencesServiceWithCache}
/// This service is a implementation of the [SharedPreferencesService] that
/// provides a cache layer to improve performance.
/// {@endtemplate}
@immutable
final class SharedPreferencesServiceWithCache
    implements SharedPreferencesService {
  /// {@macro SharedPreferencesServiceWithCache}
  const SharedPreferencesServiceWithCache(this._prefs);

  final SharedPreferencesWithCache _prefs;

  @override
  Future<AccessibilitySettingsCollection>
      getLocalStorageAccessibilitySettings() async {
    final (themeModeSetting, isStoredEffectsAllowedNoEffects) =
        await (getThemeModeSetting(), getEffectsAllowedSetting()).wait;
    final (
      textLetterSpacingSetting,
      textLineHeightSetting,
      textWordSpacingSetting,
      textScaleFactorSetting,
      textFontWeightSetting,
      textAlignmentSetting,
      colorProfileSetting,
      textColorSetting,
      pagesBackgroundColorSetting
    ) = await (
      getLetterSpacingSetting(),
      getLineHeightSetting(),
      getWordSpacingSetting(),
      getTextScaleFactorSetting(),
      getTextFontWeightSetting(),
      getTextAlignmentSetting(),
      getColorProfileSetting(),
      getTextColorSetting(),
      getPagesBackgroundColorSetting()
    ).wait;
    final textSettings = TextSettings(
      lineHeight: textLineHeightSetting,
      wordSpacing: textWordSpacingSetting,
      letterSpacing: textLetterSpacingSetting,
      textScaleFactor: textScaleFactorSetting,
      isFontWeightBold: textFontWeightSetting,
      textAlignMode: textAlignmentSetting,
      color: textColorSetting,
    );
    final colorSettings = ColorSettings(
      pagesBackgroundColorValue: pagesBackgroundColorSetting,
      colorProfileLevel: ColorProfileLevel.fromString(colorProfileSetting),
    );
    return (
      themeMode: ThemeMode.values.firstWhere(
        (mode) => mode.name == themeModeSetting,
        orElse: () => ThemeMode.system,
      ),
      effectsAllowed: isStoredEffectsAllowedNoEffects,
      textSettings: textSettings,
      colorSettings: colorSettings,
    );
  }

  @override
  Future<void> restoreDefaultSettings() async => Future.wait(
        [
          storeThemeModeSetting(
            newSetting: LocalStorageDefaultValues.themeModeDefault,
          ),
          storeColorProfileSetting(
            newSetting: LocalStorageDefaultValues.colorProfileDefault,
          ),
          storeTextColorSetting(
            newSetting: LocalStorageDefaultValues.noColorSelected,
          ),
          storePagesBackgroundColorSetting(
            newSetting: LocalStorageDefaultValues.noColorSelected,
          ),
          storeEffectsAllowedSetting(
            newSetting: LocalStorageDefaultValues.effectsAllowedDefault,
          ),
          storeLineHeightSetting(
            newSetting: TextSettings.defaultSettings.lineHeight,
          ),
          storeLetterSpacingSetting(
            newSetting: TextSettings.defaultSettings.letterSpacing,
          ),
          storeWordSpacingSetting(
            newSetting: TextSettings.defaultSettings.wordSpacing,
          ),
          storeTextScaleFactorSetting(
            newSetting: TextSettings.defaultSettings.textScaleFactor,
          ),
          storeTextFontWeightSetting(
            newSetting: TextSettings.defaultSettings.isFontWeightBold,
          ),
          storeTextAlignmentSetting(
            newSetting: TextSettings.defaultSettings.textAlignMode,
          ),
        ],
        eagerError: true,
      );

  @override
  Future<String> storeThemeModeSetting({
    required String newSetting,
  }) async =>
      _storeToLocalStorage<String>(LocalStorageKeys.themeMode, newSetting)
          .then((_) => newSetting);

  @override
  Future<String> getThemeModeSetting() async =>
      _loadFromLocalStorage<String?>(LocalStorageKeys.themeMode).then(
        (storedThemeMode) =>
            storedThemeMode ?? LocalStorageDefaultValues.themeModeDefault,
      );

  @override
  Future<bool> storeEffectsAllowedSetting({
    required bool newSetting,
  }) async =>
      _storeToLocalStorage<bool>(LocalStorageKeys.effectsAllowed, newSetting)
          .then((_) => newSetting);

  @override
  Future<bool> getEffectsAllowedSetting() async =>
      _loadFromLocalStorage<bool?>(LocalStorageKeys.effectsAllowed).then(
        (storedEffectsAllowed) =>
            storedEffectsAllowed ??
            LocalStorageDefaultValues.effectsAllowedDefault,
      );

  @override
  Future<double> getWordSpacingSetting() async =>
      _loadFromLocalStorage<double?>(
        LocalStorageKeys.textAccessibilitySettingWordSpacing,
      ).then(
        (wordSpacing) =>
            wordSpacing ?? LocalStorageDefaultValues.wordSpacingDefault,
      );

  @override
  Future<double> storeWordSpacingSetting({
    required double newSetting,
  }) async =>
      _storeToLocalStorage<double>(
        LocalStorageKeys.textAccessibilitySettingWordSpacing,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<String> storeTextAlignmentSetting({
    required String newSetting,
  }) async =>
      _storeToLocalStorage<String>(
        LocalStorageKeys.textAccessibilitySettingAlignment,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<String> getTextAlignmentSetting() async =>
      _loadFromLocalStorage<String?>(
        LocalStorageKeys.textAccessibilitySettingAlignment,
      ).then(
        (textAlign) =>
            textAlign ?? LocalStorageDefaultValues.textAlignmentDefault,
      );

  @override
  Future<double> getLineHeightSetting() async => _loadFromLocalStorage<double?>(
        LocalStorageKeys.textAccessibilitySettingLineHeight,
      ).then(
        (lineHeight) =>
            lineHeight ?? LocalStorageDefaultValues.lineHeightDefault,
      );

  @override
  Future<double> storeLineHeightSetting({
    required double newSetting,
  }) async =>
      _storeToLocalStorage<double>(
        LocalStorageKeys.textAccessibilitySettingLineHeight,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<double> getLetterSpacingSetting() async =>
      _loadFromLocalStorage<double?>(
        LocalStorageKeys.textAccessibilitySettingLetterSpacing,
      ).then(
        (lineHeight) =>
            lineHeight ?? LocalStorageDefaultValues.letterSpacingDefault,
      );

  @override
  Future<double> storeLetterSpacingSetting({
    required double newSetting,
  }) async =>
      _storeToLocalStorage<double>(
        LocalStorageKeys.textAccessibilitySettingLetterSpacing,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<double> getTextScaleFactorSetting() async =>
      _loadFromLocalStorage<double?>(
        LocalStorageKeys.textAccessibilitySettingScaleFactor,
      ).then(
        (scaleFactor) =>
            scaleFactor ?? LocalStorageDefaultValues.textScaleFactorDefault,
      );

  @override
  Future<double> storeTextScaleFactorSetting({
    required double newSetting,
  }) async =>
      _storeToLocalStorage<double>(
        LocalStorageKeys.textAccessibilitySettingScaleFactor,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<bool> getTextFontWeightSetting() async => _loadFromLocalStorage<bool?>(
        LocalStorageKeys.textAccessibilitySettingFontWeight,
      ).then(
        (storedValue) =>
            storedValue ?? LocalStorageDefaultValues.textFontWeightModeDefault,
      );

  @override
  Future<bool> storeTextFontWeightSetting({
    required bool newSetting,
  }) async =>
      _storeToLocalStorage<bool>(
        LocalStorageKeys.textAccessibilitySettingFontWeight,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<String> storeThemeProfileSetting({
    required String newSetting,
  }) async =>
      _storeToLocalStorage<String>(
        LocalStorageKeys.themeProfileSetting,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<String> getThemeProfileSetting() async =>
      _loadFromLocalStorage<String?>(
        LocalStorageKeys.themeProfileSetting,
      ).then(
        (themeProfileLevel) =>
            themeProfileLevel ?? LocalStorageDefaultValues.themeProfileDefault,
      );

  @override
  Future<String> storeColorProfileSetting({
    required String newSetting,
  }) async =>
      _storeToLocalStorage<String>(
        LocalStorageKeys.colorProfileSetting,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<String> getColorProfileSetting() async =>
      _loadFromLocalStorage<String?>(
        LocalStorageKeys.colorProfileSetting,
      ).then(
        (colorProfileLevel) =>
            colorProfileLevel ?? LocalStorageDefaultValues.colorProfileDefault,
      );

  @override
  Future<int> storeTextColorSetting({
    required int newSetting,
  }) async =>
      _storeToLocalStorage<int>(
        LocalStorageKeys.textColorSetting,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<int> getTextColorSetting() async => _loadFromLocalStorage<int?>(
        LocalStorageKeys.textColorSetting,
      ).then(
        (textColor) => textColor ?? LocalStorageDefaultValues.noColorSelected,
      );

  @override
  Future<int> storePagesBackgroundColorSetting({
    required int newSetting,
  }) async =>
      _storeToLocalStorage<int>(
        LocalStorageKeys.pagesBackgroundColorSetting,
        newSetting,
      ).then((_) => newSetting);

  @override
  Future<int> getPagesBackgroundColorSetting() async =>
      _loadFromLocalStorage<int?>(
        LocalStorageKeys.pagesBackgroundColorSetting,
      ).then(
        (textColor) => textColor ?? LocalStorageDefaultValues.noColorSelected,
      );

  @override
  Future<bool> getIsAppFirstTimeOpened() async =>
      _loadFromLocalStorage<bool>(LocalStorageKeys.isFirstTimeOpened)
          .then((storedIsFirstTimeOpened) => storedIsFirstTimeOpened ?? true);

  @override
  Future<bool> storeIsFirstTimeOpened() async => _storeToLocalStorage<bool>(
        LocalStorageKeys.isFirstTimeOpened,
        false,
      ).then((_) => false);

  /// Stores a T [value] in the local storage, associated to the [key].
  ///
  /// To use this method, you must specify the type of the value
  /// you want to store after the method name.
  /// For example:
  /// ```dart
  /// _storeToLocalStorage<bool>(LocalStorageKeys.effectsAllowed, newSetting);
  /// ```
  /// will store a boolean value.
  ///
  /// All possible keys are defined in [LocalStorageKeys].
  ///
  /// This method provides the flexibility to be used as a void method,
  /// or a returning value one, depending on your needs.
  /// For example, if you need to use the value right after storing it,
  /// you can call the method like this:
  /// ```dart
  /// _storeToLocalStorage<bool>(LocalStorageKeys.effectsAllowed, newSetting)
  /// .then((_) => newSetting);
  /// ```
  /// This way, you can return the value wherever you need it.
  Future<void> _storeToLocalStorage<T>(String key, T value) async {
    switch (value) {
      case final int s:
        await _prefs.setInt(key, s);
      case final double s:
        await _prefs.setDouble(key, s);
      case final String s:
        await _prefs.setString(key, s);
      case final bool s:
        await _prefs.setBool(key, s);
      default:
        throw UnimplementedError('Unsupported value type');
    }
  }

  /// Stores a list of integers in the local storage.
  ///
  /// This is used to test the error handling of the [_storeToLocalStorage]
  /// [UnimplementedError] behavior.
  @visibleForTesting
  Future<void> storeUnsupportedValueType() async {
    await _storeToLocalStorage<List<int>>(
      'test',
      [1, 2, 3],
    );
  }

  /// Returns the value of [key] stored in the local storage.
  ///
  /// To use this method, you must specify the type of the value
  /// you want to retrieve after the method name.
  /// For example:
  /// ```dart
  /// _loadFromLocalStorage<bool>('LocalStorageKeys.isFirstTimeOpened');
  /// ```
  /// will expect to return a boolean value.
  /// All possible keys are defined in [LocalStorageKeys].
  ///
  /// If the key is not found, it will return null.
  ///
  /// If you don't want to handle an optional value when you retrieve the data,
  /// consider calling a .then() method on the returned future, to use a default
  /// value in case of null. For example:
  /// ```dart
  /// _loadFromLocalStorage<bool>('LocalStorageKeys.isFirstTimeOpened')
  /// .then((storedIsFirstTimeOpened) => storedIsFirstTimeOpened ?? true);
  /// ```
  /// will return a bool with a default value of true.
  Future<T?> _loadFromLocalStorage<T extends Object?>(String key) async =>
      _prefs.containsKey(key) ? _prefs.get(key) as T : null;
}
