import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart' show immutable, visibleForTesting;
import 'package:flutter/widgets.dart' show BuildContext, InheritedWidget;

/// {@template SharedPreferencesInherited}
/// A provider of the shared preferences of the application.
/// {@endtemplate}
@immutable
final class SharedPreferencesInherited extends InheritedWidget {
  /// {@macro SharedPreferencesInherited}
  const SharedPreferencesInherited({
    required super.child,
    required SharedPreferencesService sharedPreferencesService,
    super.key,
  }) : _sharedPreferencesService = sharedPreferencesService;

  final SharedPreferencesService _sharedPreferencesService;

  /// Restores the default settings of the application.
  Future<void> restoreDefaultSettings() async {
    await _sharedPreferencesService.restoreDefaultSettings();
  }

  /// Stores the [newSetting] of the theme mode.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeThemeModeSetting({
    required String newSetting,
  }) async =>
      _sharedPreferencesService.storeThemeModeSetting(newSetting: newSetting);

  /// Returns the stored theme mode.
  ///
  /// If no theme mode is stored, the default value is returned instead.
  Future<String> getThemeModeSetting() async =>
      _sharedPreferencesService.getThemeModeSetting();

  /// Stores the [newSetting] of the effects mode.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<bool> storeEffectsAllowedSetting({
    required bool newSetting,
  }) async =>
      _sharedPreferencesService.storeEffectsAllowedSetting(
        newSetting: newSetting,
      );

  /// Returns the stored effects mode.
  ///
  /// If no effects mode is stored, the default value is returned instead.
  Future<bool> getEffectsAllowedSetting() async =>
      _sharedPreferencesService.getEffectsAllowedSetting();

  /// Returns the stored text word spacing setting.
  ///
  /// If no word spacing is stored, the default value is returned instead.
  Future<double> getWordSpacingSetting() async =>
      _sharedPreferencesService.getWordSpacingSetting();

  /// Stores the [newSetting] of the text word spacing setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeWordSpacingSetting({
    required double newSetting,
  }) async =>
      _sharedPreferencesService.storeWordSpacingSetting(newSetting: newSetting);

  /// Stores the [newSetting] of the text alignment.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeTextAlignmentSetting({
    required String newSetting,
  }) async =>
      _sharedPreferencesService.storeTextAlignmentSetting(
        newSetting: newSetting,
      );

  /// Returns the stored text alignment setting.
  ///
  /// If no text alignment mode is stored,
  /// the default value is returned instead.
  Future<String> getTextAlignmentSetting() async =>
      _sharedPreferencesService.getTextAlignmentSetting();

  /// Returns the stored text line height setting.
  ///
  /// If no line height is stored, the default value is returned instead.
  Future<double> getLineHeightSetting() async =>
      _sharedPreferencesService.getLineHeightSetting();

  /// Stores the [newSetting] of the text line height setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeLineHeightSetting({
    required double newSetting,
  }) async =>
      _sharedPreferencesService.storeLineHeightSetting(newSetting: newSetting);

  /// Returns the stored text letter spacing setting.
  ///
  /// If no letter spacing is stored,
  /// the default value is returned instead.
  Future<double> getLetterSpacingSetting() async =>
      _sharedPreferencesService.getLetterSpacingSetting();

  /// Stores the [newSetting] of the text line height setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeLetterSpacingSetting({
    required double newSetting,
  }) async =>
      _sharedPreferencesService.storeLetterSpacingSetting(
        newSetting: newSetting,
      );

  /// Returns the stored text scale factor setting.
  ///
  /// If no text scale factor is stored,
  /// the default value is returned instead.
  Future<double> getTextScaleFactorSetting() async =>
      _sharedPreferencesService.getTextScaleFactorSetting();

  /// Stores the [newSetting] of the text scale factor setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeTextScaleFactorSetting({
    required double newSetting,
  }) async =>
      _sharedPreferencesService.storeTextScaleFactorSetting(
        newSetting: newSetting,
      );

  /// Returns the stored text font weight mode.
  ///
  /// If no text font weight is stored,
  /// the default value is returned instead.
  Future<bool> getTextFontWeightSetting() async =>
      _sharedPreferencesService.getTextFontWeightSetting();

  /// Stores the [newSetting] of the text font weight mode.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<bool> storeTextFontWeightSetting({
    required bool newSetting,
  }) async =>
      _sharedPreferencesService.storeTextFontWeightSetting(
        newSetting: newSetting,
      );

  /// Returns the stored text font family setting.
  ///
  /// If no font family is stored,
  /// the default value is returned instead.
  Future<String> getTextFontFamilySetting() async =>
      _sharedPreferencesService.getTextFontFamilySetting();

  /// Stores the [newSetting] of the text font family.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeTextFontFamilySetting({
    required String newSetting,
  }) async =>
      _sharedPreferencesService.storeTextFontFamilySetting(
        newSetting: newSetting,
      );

  /// Stores the [newSetting] of the theme profile.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeThemeProfileSetting({
    required String newSetting,
  }) async =>
      _sharedPreferencesService.storeThemeProfileSetting(
        newSetting: newSetting,
      );

  /// Returns the stored theme profile setting.
  ///
  /// If no theme profile is stored, the default value is returned instead.
  Future<String> getThemeProfileSetting() async =>
      _sharedPreferencesService.getThemeProfileSetting();

  /// Stores the [newSetting] of the color profile.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeColorProfileSetting({
    required String newSetting,
  }) async =>
      _sharedPreferencesService.storeColorProfileSetting(
        newSetting: newSetting,
      );

  /// Returns the stored color profile setting.
  ///
  /// If no color profile is stored, the default value is returned instead.
  Future<String> getColorProfileSetting() async =>
      _sharedPreferencesService.getColorProfileSetting();

  /// Stores the [newSetting] of the text color.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<int> storeTextColorSetting({
    required int newSetting,
  }) async =>
      _sharedPreferencesService.storeTextColorSetting(newSetting: newSetting);

  /// Returns the stored text color setting.
  ///
  /// If no text color is stored, the default value is returned instead.
  Future<int> getTextColorSetting() async =>
      _sharedPreferencesService.getTextColorSetting();

  /// Stores the [newSetting] of the pages background color.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<int> storePagesBackgroundColorSetting({
    required int newSetting,
  }) async =>
      _sharedPreferencesService.storePagesBackgroundColorSetting(
        newSetting: newSetting,
      );

  /// Returns the stored pages background color setting.
  ///
  /// If no text color is stored, the default value is returned instead.
  Future<int> getPagesBackgroundColorSetting() async =>
      _sharedPreferencesService.getPagesBackgroundColorSetting();

  /// Returns true if the app is opened for the first time.
  ///
  /// This is something that only happens once, so the first time this
  /// method is invoked it will store the value corresponding to a second
  /// time opening.
  Future<bool> getIsAppFirstTimeOpened() async =>
      _sharedPreferencesService.getIsAppFirstTimeOpened();

  /// Stores the value corresponding to a second time opening.
  Future<bool> storeIsFirstTimeOpened() async =>
      _sharedPreferencesService.storeIsFirstTimeOpened();

  /// Returns the stored settings.
  ///
  /// If no settings are stored, the default values are returned instead.
  @visibleForTesting
  Future<AccessibilitySettingsCollection>
      getLocalStorageAccessibilitySettings() async =>
          _sharedPreferencesService.getLocalStorageAccessibilitySettings();

  /// Returns the closest [SharedPreferencesInherited] instance that
  /// encloses the given context.
  static SharedPreferencesInherited of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<SharedPreferencesInherited>();
    assert(result != null, 'No SharedPreferencesInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant SharedPreferencesInherited oldWidget) =>
      false;
}
