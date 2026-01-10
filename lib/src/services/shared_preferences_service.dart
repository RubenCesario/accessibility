import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/services/mock_shared_preferences_service.dart';
import 'package:flutter/foundation.dart' show immutable, visibleForTesting;

/// {@template SharedPreferencesService}
/// The service that handles all accessibility local storage operations.
/// {@endtemplate}
@immutable
abstract interface class SharedPreferencesService {
  /// Returns the stored settings.
  ///
  /// If no settings are stored, the default values are returned instead.
  Future<AccessibilitySettingsCollection>
      getLocalStorageAccessibilitySettings();

  /// Restores the default settings of the application.
  Future<void> restoreDefaultSettings();

  /// Stores the [newSetting] of the theme mode.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeThemeModeSetting({
    required String newSetting,
  });

  /// Returns the stored theme mode.
  ///
  /// If no theme mode is stored, the default value is returned instead.
  Future<String> getThemeModeSetting();

  /// Stores the [newSetting] of the effects mode.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<bool> storeEffectsAllowedSetting({
    required bool newSetting,
  });

  /// Returns the stored effects mode.
  ///
  /// If no effects mode is stored, the default value is returned instead.
  Future<bool> getEffectsAllowedSetting();

  /// Returns the stored text word spacing setting.
  ///
  /// If no word spacing is stored, the default value is returned instead.
  Future<double> getWordSpacingSetting();

  /// Stores the [newSetting] of the text word spacing setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeWordSpacingSetting({
    required double newSetting,
  });

  /// Stores the [newSetting] of the text alignment.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeTextAlignmentSetting({
    required String newSetting,
  });

  /// Returns the stored text alignment setting.
  ///
  /// If no text alignment mode is stored,
  /// the default value is returned instead.
  Future<String> getTextAlignmentSetting();

  /// Returns the stored text line height setting.
  ///
  /// If no line height is stored, the default value is returned instead.
  Future<double> getLineHeightSetting();

  /// Stores the [newSetting] of the text line height setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeLineHeightSetting({
    required double newSetting,
  });

  /// Returns the stored text letter spacing setting.
  ///
  /// If no letter spacing is stored,
  /// the default value is returned instead.
  Future<double> getLetterSpacingSetting();

  /// Stores the [newSetting] of the text letter spacing setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeLetterSpacingSetting({
    required double newSetting,
  });

  /// Returns the stored text scale factor setting.
  ///
  /// If no text scale factor is stored,
  /// the default value is returned instead.
  Future<double> getTextScaleFactorSetting();

  /// Stores the [newSetting] of the text scale factor setting.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<double> storeTextScaleFactorSetting({
    required double newSetting,
  });

  /// Returns the stored text font weight mode.
  ///
  /// If no text font weight is stored,
  /// the default value is returned instead.
  Future<bool> getTextFontWeightSetting();

  /// Stores the [newSetting] of the text font weight mode.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<bool> storeTextFontWeightSetting({
    required bool newSetting,
  });

  /// Returns the stored text font family setting.
  ///
  /// If no font family is stored,
  /// the default value is returned instead.
  Future<String> getTextFontFamilySetting();

  /// Stores the [newSetting] of the text font family.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeTextFontFamilySetting({
    required String newSetting,
  });

  /// Stores the [newSetting] of the theme profile.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeThemeProfileSetting({
    required String newSetting,
  });

  /// Returns the stored theme profile setting.
  ///
  /// If no theme profile is stored, the default value is returned instead.
  Future<String> getThemeProfileSetting();

  /// Stores the [newSetting] of the color profile.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<String> storeColorProfileSetting({
    required String newSetting,
  });

  /// Returns the stored color profile setting.
  ///
  /// If no color profile is stored, the default value is returned instead.
  Future<String> getColorProfileSetting();

  /// Stores the [newSetting] of the text color.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<int> storeTextColorSetting({
    required int newSetting,
  });

  /// Returns the stored text color setting.
  ///
  /// If no text color is stored, the default value is returned instead.
  Future<int> getTextColorSetting();

  /// Stores the [newSetting] of the pages background color.
  ///
  /// Returns [newSetting] to expose it to the application.
  Future<int> storePagesBackgroundColorSetting({
    required int newSetting,
  });

  /// Returns the stored pages background color setting.
  ///
  /// If no text color is stored, the default value is returned instead.
  Future<int> getPagesBackgroundColorSetting();

  /// Returns true if the app is opened for the first time.
  ///
  /// This is something that only happens once, so the first time this
  /// method is invoked it will store the value corresponding to a second
  /// time opening.
  Future<bool> getIsAppFirstTimeOpened();

  /// Stores the value corresponding to a second time opening.
  Future<bool> storeIsFirstTimeOpened();

  /// Creates a mock implementation of [SharedPreferencesService] for testing.
  ///
  /// [initialStorage] is the initial storage map for testing.
  /// [initialMethodCalls] is the initial list of method calls for testing.
  @visibleForTesting
  static MockSharedPreferencesService createMockService({
    Map<String, Object?> initialStorage = const {},
    List<String> initialMethodCalls = const [],
  }) =>
      MockSharedPreferencesService();
}
