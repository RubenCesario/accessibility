import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart';
import 'package:flutter/material.dart';

/// {@template AccessibilitySettingsInherited}
/// A provider of all the accessibility settings of the application.
///
/// It is used to provide the current accessibility settings of the application
/// to its children.
/// {@endtemplate}
@immutable
final class AccessibilitySettingsInherited extends InheritedWidget {
  /// {@macro AccessibilitySettingsInherited}
  const AccessibilitySettingsInherited({
    required super.child,
    required AccessibilitySettingsViewModel viewModel,
    super.key,
  }) : _viewModel = viewModel;

  /// The view model of the provider that manages
  /// all the accessibility settings of the application.
  final AccessibilitySettingsViewModel _viewModel;

  /// The current state of the effects of the application.
  ValueNotifier<bool> get effectsAllowed => _viewModel.effectsAllowed;

  /// The current state of the theme mode of the application.
  ValueNotifier<ThemeMode> get themeMode => _viewModel.themeMode;

  /// The current state of the text accessibility settings of the application.
  ValueNotifier<TextSettings> get textSettings => _viewModel.textSettings;

  /// The current state of the color settings of the application.
  ValueNotifier<ColorSettings> get colorSettings => _viewModel.colorSettings;

  /// Restore the default settings of the application.
  void restoreDefaultSettings() => _viewModel.restoreDefaultSettings();

  /// Apply a theme profile to the application.
  void applyThemeProfile(ThemeProfileLevel themeProfileLevel) =>
      _viewModel.applyThemeProfile(themeProfileLevel);

  /// Update the text alignment in the application and in the
  /// shared preferences.
  void updateTextAlignSetting(String newTextAlignMode) =>
      _viewModel.updateTextAlignSetting(newTextAlignMode);

  /// Update the font weight in the application and in the
  /// shared preferences.
  void updateFontWeightSetting({
    required bool newSetting,
  }) =>
      _viewModel.updateFontWeightSetting(newSetting: newSetting);

  /// Moves to the next color profile or the [newColorProfileLevelName]
  /// if it is provided.
  ///
  /// If it reaches the end, it starts again from the beginning.
  void updateColorProfileLevel({
    String? newColorProfileLevelName,
  }) =>
      _viewModel.updateColorProfileLevel(
        newColorProfileLevelName: newColorProfileLevelName,
      );

  /// Update the pages background color in the application and in the
  /// shared preferences.
  void updatePagesBackgroundColorSettings(Color color) =>
      _viewModel.updatePagesBackgroundColorSettings(color);

  /// Update the text color in the application and in the
  /// shared preferences.
  void updateTextColorSettings(Color color) =>
      _viewModel.updateTextColorSettings(color);

  /// Update the letter spacing in the application and in the
  /// shared preferences.
  void updateLetterSpacingSetting(double newSetting) =>
      _viewModel.updateLetterSpacingSetting(newSetting);

  /// Update the line height in the application and in the
  /// shared preferences.
  void updateLineHeightSetting(double newSetting) =>
      _viewModel.updateLineHeightSetting(newSetting);

  /// Update the scale factor in the application and in the
  /// shared preferences.
  void updateScaleFactorSetting(double newSetting) =>
      _viewModel.updateScaleFactorSetting(newSetting);

  /// Update the word spacing in the application and in the
  /// shared preferences.
  void updateWordSpacingSetting(double newSetting) =>
      _viewModel.updateWordSpacingSetting(newSetting);

  /// Update the font family in the application.
  ///
  /// If [useAccessibleFont] is true, the accessible font (Verdana) is applied.
  /// Otherwise, the system default font is restored.
  void updateFontFamilySetting({required bool useAccessibleFont}) =>
      _viewModel.updateFontFamilySetting(useAccessibleFont: useAccessibleFont);

  /// Disposes the resources used by the provider.
  void dispose() => _viewModel.dispose();

  /// Returns the closest [AccessibilitySettingsInherited] instance that
  /// encloses the given context.
  static AccessibilitySettingsInherited of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<AccessibilitySettingsInherited>();
    assert(
      result != null,
      'No AccessibilitySettingsInherited found in context',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AccessibilitySettingsInherited oldWidget) =>
      _viewModel != oldWidget._viewModel;
}
