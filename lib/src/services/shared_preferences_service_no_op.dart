import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart' show immutable, visibleForTesting;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

/// {@template SharedPreferencesService}
/// This service is a implementation of the [SharedPreferencesService] that
/// does nothing.
/// {@endtemplate}
@immutable
final class SharedPreferencesServiceNoOp implements SharedPreferencesService {
  /// {@macro SharedPreferencesService}
  const SharedPreferencesServiceNoOp();

  @override
  Future<AccessibilitySettingsCollection>
      getLocalStorageAccessibilitySettings() async => a11yDefaultSettings;

  @override
  Future<void> restoreDefaultSettings() async => Future.value();

  @override
  Future<String> storeThemeModeSetting({
    required String newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<String> getThemeModeSetting() async =>
      Future.value(LocalStorageDefaultValues.themeModeDefault);

  @override
  Future<bool> storeEffectsAllowedSetting({
    required bool newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<bool> getEffectsAllowedSetting() async =>
      Future.value(LocalStorageDefaultValues.effectsAllowedDefault);

  @override
  Future<double> getWordSpacingSetting() async =>
      Future.value(LocalStorageDefaultValues.wordSpacingDefault);

  @override
  Future<double> storeWordSpacingSetting({
    required double newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<String> storeTextAlignmentSetting({
    required String newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<String> getTextAlignmentSetting() async =>
      Future.value(LocalStorageDefaultValues.textAlignmentDefault);

  @override
  Future<double> getLineHeightSetting() async =>
      Future.value(LocalStorageDefaultValues.lineHeightDefault);

  @override
  Future<double> storeLineHeightSetting({
    required double newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<double> getLetterSpacingSetting() async =>
      Future.value(LocalStorageDefaultValues.letterSpacingDefault);

  @override
  Future<double> storeLetterSpacingSetting({
    required double newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<double> getTextScaleFactorSetting() async =>
      Future.value(LocalStorageDefaultValues.textScaleFactorDefault);

  @override
  Future<double> storeTextScaleFactorSetting({
    required double newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<bool> getTextFontWeightSetting() async =>
      Future.value(LocalStorageDefaultValues.textFontWeightModeDefault);

  @override
  Future<bool> storeTextFontWeightSetting({
    required bool newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<String> storeThemeProfileSetting({
    required String newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<String> getThemeProfileSetting() async =>
      Future.value(LocalStorageDefaultValues.themeProfileDefault);

  @override
  Future<String> storeColorProfileSetting({
    required String newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<String> getColorProfileSetting() async => Future.value(
        LocalStorageDefaultValues.colorProfileDefault,
      );

  @override
  Future<int> storeTextColorSetting({
    required int newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<int> getTextColorSetting() async => Future.value(
        LocalStorageDefaultValues.noColorSelected,
      );

  @override
  Future<int> storePagesBackgroundColorSetting({
    required int newSetting,
  }) async =>
      Future.value(newSetting);

  @override
  Future<int> getPagesBackgroundColorSetting() async =>
      Future.value(LocalStorageDefaultValues.noColorSelected);

  @override
  Future<bool> getIsAppFirstTimeOpened() async => Future.value(false);

  @override
  Future<bool> storeIsFirstTimeOpened() async => Future.value(false);

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
    final prefs = await SharedPreferences.getInstance();
    switch (value) {
      case final int s:
        await prefs.setInt(key, s);
      case final double s:
        await prefs.setDouble(key, s);
      case final String s:
        await prefs.setString(key, s);
      case final bool s:
        await prefs.setBool(key, s);
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

  /// Stores an int value to test the int branch of [_storeToLocalStorage].
  @visibleForTesting
  Future<void> storeIntValue(String key, int value) async {
    await _storeToLocalStorage<int>(key, value);
  }

  /// Stores a double value to test the double branch of [_storeToLocalStorage].
  @visibleForTesting
  Future<void> storeDoubleValue(String key, double value) async {
    await _storeToLocalStorage<double>(key, value);
  }

  /// Stores a String value to test the String branch of [_storeToLocalStorage].
  @visibleForTesting
  Future<void> storeStringValue(String key, String value) async {
    await _storeToLocalStorage<String>(key, value);
  }

  /// Stores a bool value to test the bool branch of [_storeToLocalStorage].
  @visibleForTesting
  Future<void> storeBoolValue(String key, {required bool value}) async {
    await _storeToLocalStorage<bool>(key, value);
  }
}
