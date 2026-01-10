import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

/// {@template MockSharedPreferencesService}
/// A mock implementation of [SharedPreferencesService] for testing purpose.
/// {@endtemplate}
class MockSharedPreferencesService implements SharedPreferencesService {
  /// {@macro MockSharedPreferencesService}
  MockSharedPreferencesService()
      : _storage = {},
        _methodCalls = [];

  /// The storage map.
  final Map<String, Object?> _storage;

  /// The list of method calls.
  final List<String> _methodCalls;

  /// Returns the list of method calls.
  List<String> get methodCalls => _methodCalls;

  /// Resets the storage and method calls
  void reset() {
    _storage.clear();
    _methodCalls.clear();
  }

  @override
  Future<bool> getEffectsAllowedSetting() async {
    _methodCalls.add('getEffectsAllowedSetting');
    return _storage[LocalStorageKeys.effectsAllowed] as bool? ??
        LocalStorageDefaultValues.effectsAllowedDefault;
  }

  @override
  Future<bool> storeEffectsAllowedSetting({required bool newSetting}) async {
    _methodCalls.add('storeEffectsAllowedSetting');
    _storage[LocalStorageKeys.effectsAllowed] = newSetting;
    return newSetting;
  }

  @override
  Future<String> getThemeModeSetting() async {
    _methodCalls.add('getThemeModeSetting');
    return _storage[LocalStorageKeys.themeMode] as String? ??
        LocalStorageDefaultValues.themeModeDefault;
  }

  @override
  Future<String> storeThemeModeSetting({required String newSetting}) async {
    _methodCalls.add('storeThemeModeSetting');
    _storage[LocalStorageKeys.themeMode] = newSetting;
    return newSetting;
  }

  @override
  Future<double> getWordSpacingSetting() async {
    _methodCalls.add('getWordSpacingSetting');
    return _storage[LocalStorageKeys.textAccessibilitySettingWordSpacing]
            as double? ??
        LocalStorageDefaultValues.wordSpacingDefault;
  }

  @override
  Future<double> storeWordSpacingSetting({required double newSetting}) async {
    _methodCalls.add('storeWordSpacingSetting');
    _storage[LocalStorageKeys.textAccessibilitySettingWordSpacing] = newSetting;
    return newSetting;
  }

  @override
  Future<String> getTextAlignmentSetting() async {
    _methodCalls.add('getTextAlignmentSetting');
    return _storage[LocalStorageKeys.textAccessibilitySettingAlignment]
            as String? ??
        LocalStorageDefaultValues.textAlignmentDefault;
  }

  @override
  Future<String> storeTextAlignmentSetting({required String newSetting}) async {
    _methodCalls.add('storeTextAlignmentSetting');
    _storage[LocalStorageKeys.textAccessibilitySettingAlignment] = newSetting;
    return newSetting;
  }

  @override
  Future<double> getLineHeightSetting() async {
    _methodCalls.add('getLineHeightSetting');
    return _storage[LocalStorageKeys.textAccessibilitySettingLineHeight]
            as double? ??
        LocalStorageDefaultValues.lineHeightDefault;
  }

  @override
  Future<double> storeLineHeightSetting({required double newSetting}) async {
    _methodCalls.add('storeLineHeightSetting');
    _storage[LocalStorageKeys.textAccessibilitySettingLineHeight] = newSetting;
    return newSetting;
  }

  @override
  Future<double> getLetterSpacingSetting() async {
    _methodCalls.add('getLetterSpacingSetting');
    return _storage[LocalStorageKeys.textAccessibilitySettingLetterSpacing]
            as double? ??
        LocalStorageDefaultValues.letterSpacingDefault;
  }

  @override
  Future<double> storeLetterSpacingSetting({required double newSetting}) async {
    _methodCalls.add('storeLetterSpacingSetting');
    _storage[LocalStorageKeys.textAccessibilitySettingLetterSpacing] =
        newSetting;
    return newSetting;
  }

  @override
  Future<double> getTextScaleFactorSetting() async {
    _methodCalls.add('getTextScaleFactorSetting');
    return _storage[LocalStorageKeys.textAccessibilitySettingScaleFactor]
            as double? ??
        LocalStorageDefaultValues.textScaleFactorDefault;
  }

  @override
  Future<double> storeTextScaleFactorSetting({
    required double newSetting,
  }) async {
    _methodCalls.add('storeTextScaleFactorSetting');
    _storage[LocalStorageKeys.textAccessibilitySettingScaleFactor] = newSetting;
    return newSetting;
  }

  @override
  Future<bool> getTextFontWeightSetting() async {
    _methodCalls.add('getTextFontWeightSetting');
    return _storage[LocalStorageKeys.textAccessibilitySettingFontWeight]
            as bool? ??
        LocalStorageDefaultValues.textFontWeightModeDefault;
  }

  @override
  Future<bool> storeTextFontWeightSetting({required bool newSetting}) async {
    _methodCalls.add('storeTextFontWeightSetting');
    _storage[LocalStorageKeys.textAccessibilitySettingFontWeight] = newSetting;
    return newSetting;
  }

  @override
  Future<String> getTextFontFamilySetting() async {
    _methodCalls.add('getTextFontFamilySetting');
    return _storage[LocalStorageKeys.textAccessibilitySettingFontFamily]
            as String? ??
        LocalStorageDefaultValues.fontFamilyDefault;
  }

  @override
  Future<String> storeTextFontFamilySetting({
    required String newSetting,
  }) async {
    _methodCalls.add('storeTextFontFamilySetting');
    _storage[LocalStorageKeys.textAccessibilitySettingFontFamily] = newSetting;
    return newSetting;
  }

  @override
  Future<String> getThemeProfileSetting() async {
    _methodCalls.add('getThemeProfileSetting');
    return _storage[LocalStorageKeys.themeProfileSetting] as String? ??
        LocalStorageDefaultValues.themeProfileDefault;
  }

  @override
  Future<String> storeThemeProfileSetting({required String newSetting}) async {
    _methodCalls.add('storeThemeProfileSetting');
    _storage[LocalStorageKeys.themeProfileSetting] = newSetting;
    return newSetting;
  }

  @override
  Future<String> getColorProfileSetting() async {
    _methodCalls.add('getColorProfileSetting');
    return _storage[LocalStorageKeys.colorProfileSetting] as String? ??
        LocalStorageDefaultValues.colorProfileDefault;
  }

  @override
  Future<String> storeColorProfileSetting({required String newSetting}) async {
    _methodCalls.add('storeColorProfileSetting');
    _storage[LocalStorageKeys.colorProfileSetting] = newSetting;
    return newSetting;
  }

  @override
  Future<int> getTextColorSetting() async {
    _methodCalls.add('getTextColorSetting');
    return _storage[LocalStorageKeys.textColorSetting] as int? ??
        LocalStorageDefaultValues.noColorSelected;
  }

  @override
  Future<int> storeTextColorSetting({required int newSetting}) async {
    _methodCalls.add('storeTextColorSetting');
    _storage[LocalStorageKeys.textColorSetting] = newSetting;
    return newSetting;
  }

  @override
  Future<int> getPagesBackgroundColorSetting() async {
    _methodCalls.add('getPagesBackgroundColorSetting');
    return _storage[LocalStorageKeys.pagesBackgroundColorSetting] as int? ??
        LocalStorageDefaultValues.noColorSelected;
  }

  @override
  Future<int> storePagesBackgroundColorSetting({
    required int newSetting,
  }) async {
    _methodCalls.add('storePagesBackgroundColorSetting');
    _storage[LocalStorageKeys.pagesBackgroundColorSetting] = newSetting;
    return newSetting;
  }

  @override
  Future<bool> getIsAppFirstTimeOpened() async {
    _methodCalls.add('getIsAppFirstTimeOpened');
    return _storage[LocalStorageKeys.isFirstTimeOpened] as bool? ?? true;
  }

  @override
  Future<bool> storeIsFirstTimeOpened() async {
    _methodCalls.add('storeIsFirstTimeOpened');
    _storage[LocalStorageKeys.isFirstTimeOpened] = false;
    return false;
  }

  @override
  Future<void> restoreDefaultSettings() async {
    _methodCalls.add('restoreDefaultSettings');
    await Future.wait([
      storeThemeModeSetting(
        newSetting: LocalStorageDefaultValues.themeModeDefault,
      ),
      storeEffectsAllowedSetting(
        newSetting: LocalStorageDefaultValues.effectsAllowedDefault,
      ),
      storeWordSpacingSetting(
        newSetting: TextSettings.defaultSettings.wordSpacing,
      ),
      storeTextAlignmentSetting(
        newSetting: TextSettings.defaultSettings.textAlignMode,
      ),
      storeLineHeightSetting(
        newSetting: TextSettings.defaultSettings.lineHeight,
      ),
      storeLetterSpacingSetting(
        newSetting: TextSettings.defaultSettings.letterSpacing,
      ),
      storeTextScaleFactorSetting(
        newSetting: TextSettings.defaultSettings.textScaleFactor,
      ),
      storeTextFontWeightSetting(
        newSetting: TextSettings.defaultSettings.isFontWeightBold,
      ),
      storeTextFontFamilySetting(
        newSetting: TextSettings.defaultSettings.fontFamily,
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
    ]);
  }

  @override
  Future<AccessibilitySettingsCollection>
      getLocalStorageAccessibilitySettings() async {
    _methodCalls.add('getLocalStorageAccessibilitySettings');
    final (themeModeSetting, effectsAllowed, textFontFamilySetting) = await (
      getThemeModeSetting(),
      getEffectsAllowedSetting(),
      getTextFontFamilySetting(),
    ).wait;
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
      fontFamily: textFontFamilySetting,
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
      effectsAllowed: effectsAllowed,
      textSettings: textSettings,
      colorSettings: colorSettings,
    );
  }
}
