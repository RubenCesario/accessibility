import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AccessibilitySettingsCollection accessibilitySettingsCollection;
  late AccessibilitySettingsViewModel viewModel;

  setUp(() {
    accessibilitySettingsCollection = (
      effectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
      themeMode: ThemeMode.system,
      textSettings: TextSettings.defaultSettings,
      colorSettings: ColorSettings.defaultSettings,
    );
    viewModel =
        AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
      accessibilitySettingsCollection: accessibilitySettingsCollection,
    );
  });

  tearDown(() {
    viewModel.dispose();
  });

  group('defaultSettings', () {
    test('should provide a default static instance with default values', () {
      final defaultVM = AccessibilitySettingsViewModel.defaultSettings;

      expect(defaultVM.themeMode.value, equals(ThemeMode.system));
      expect(
        defaultVM.effectsAllowed.value,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(
        defaultVM.textSettings.value,
        equals(TextSettings.defaultSettings),
      );
      expect(
        defaultVM.colorSettings.value,
        equals(ColorSettings.defaultSettings),
      );
    });

    test('defaultSettings should be a singleton instance', () {
      final firstAccess = AccessibilitySettingsViewModel.defaultSettings;
      final secondAccess = AccessibilitySettingsViewModel.defaultSettings;

      expect(identical(firstAccess, secondAccess), isTrue);
    });
  });

  group('initialization', () {
    test('should initialize with the given accessibility settings', () {
      expect(
        viewModel.themeMode.value,
        equals(accessibilitySettingsCollection.themeMode),
      );
      expect(
        viewModel.effectsAllowed.value,
        equals(accessibilitySettingsCollection.effectsAllowed),
      );
      expect(
        viewModel.textSettings.value,
        equals(accessibilitySettingsCollection.textSettings),
      );
      expect(
        viewModel.colorSettings.value,
        equals(accessibilitySettingsCollection.colorSettings),
      );
    });

    test('should initialize with default values when not specified', () {
      final defaultViewModel =
          AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
        accessibilitySettingsCollection: (
          effectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
          themeMode: ThemeMode.system,
          textSettings: TextSettings.defaultSettings,
          colorSettings: ColorSettings.defaultSettings,
        ),
      );
      expect(defaultViewModel.themeMode.value, equals(ThemeMode.system));
      expect(
        defaultViewModel.effectsAllowed.value,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(
        defaultViewModel.textSettings.value,
        equals(TextSettings.defaultSettings),
      );
      expect(
        defaultViewModel.colorSettings.value,
        equals(ColorSettings.defaultSettings),
      );
    });
  });

  group('restore default settings', () {
    test('should restore all settings to their default values', () {
      // First, modify all settings from defaults
      // Modify settings from defaults
      viewModel
        ..updateColorProfileLevel(
          newColorProfileLevelName: ColorProfileLevel.highContrast.name,
        )
        ..updateTextAlignSetting('center')
        ..updateFontWeightSetting(newSetting: true)
        ..updateLetterSpacingSetting(10)
        ..updateLineHeightSetting(2.5)
        ..updateScaleFactorSetting(1.5)
        ..updateWordSpacingSetting(5);

      // Update theme mode by creating a new view model with copyWith
      final temp = viewModel.copyWith(themeMode: ThemeMode.dark);
      viewModel = temp.copyWith(
        effectsAllowed: !LocalStorageDefaultValues.effectsAllowedDefault,
      );

      // Verify values were changed
      expect(viewModel.themeMode.value, equals(ThemeMode.dark));
      expect(
        viewModel.effectsAllowed.value,
        equals(!LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(viewModel.textSettings.value.textAlignMode, equals('center'));

      // Now restore defaults
      viewModel.restoreDefaultSettings();

      // Verify all settings are back to defaults
      expect(viewModel.themeMode.value, equals(ThemeMode.system));
      expect(
        viewModel.effectsAllowed.value,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(
        viewModel.textSettings.value,
        equals(TextSettings.defaultSettings),
      );
      expect(
        viewModel.colorSettings.value,
        equals(ColorSettings.defaultSettings),
      );
    });
  });

  group('apply theme profile', () {
    test('should apply seizure safe theme profile correctly', () {
      viewModel.applyThemeProfile(ThemeProfileLevel.seizureSafe);
      final expectedThemeProfile =
          ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe);

      expect(
        viewModel.textSettings.value,
        equals(expectedThemeProfile.textSettings),
      );
      expect(
        viewModel.colorSettings.value,
        equals(expectedThemeProfile.colorSettings),
      );
      expect(
        viewModel.effectsAllowed.value,
        equals(expectedThemeProfile.effectsAllowed),
      );
    });

    test('should apply vision impaired theme profile correctly', () {
      viewModel.applyThemeProfile(ThemeProfileLevel.visionImpaired);
      final expectedThemeProfile =
          ThemeProfile.fromLevel(ThemeProfileLevel.visionImpaired);

      expect(
        viewModel.textSettings.value,
        equals(expectedThemeProfile.textSettings),
      );
      expect(
        viewModel.colorSettings.value,
        equals(expectedThemeProfile.colorSettings),
      );
      expect(
        viewModel.effectsAllowed.value,
        equals(expectedThemeProfile.effectsAllowed),
      );
    });

    test('should apply adhd friendly theme profile correctly', () {
      viewModel.applyThemeProfile(ThemeProfileLevel.adhdFriendly);
      final expectedThemeProfile =
          ThemeProfile.fromLevel(ThemeProfileLevel.adhdFriendly);

      expect(
        viewModel.textSettings.value,
        equals(expectedThemeProfile.textSettings),
      );
      expect(
        viewModel.colorSettings.value,
        equals(expectedThemeProfile.colorSettings),
      );
      expect(
        viewModel.effectsAllowed.value,
        equals(expectedThemeProfile.effectsAllowed),
      );
    });
  });

  group('text settings updates', () {
    test('should update text alignment correctly', () {
      final newTextAlignValue = TextAlign.center.name;
      viewModel.updateTextAlignSetting(newTextAlignValue);

      expect(
        viewModel.textSettings.value.textAlignMode,
        equals(newTextAlignValue),
      );
    });

    test('should update font weight correctly', () {
      const newFontWeight = true;
      viewModel.updateFontWeightSetting(newSetting: newFontWeight);

      expect(
        viewModel.textSettings.value.isFontWeightBold,
        equals(newFontWeight),
      );
    });

    test('should update letter spacing correctly', () {
      const newLetterSpacing = 5.0;
      viewModel.updateLetterSpacingSetting(newLetterSpacing);

      expect(
        viewModel.textSettings.value.letterSpacing,
        equals(newLetterSpacing),
      );
    });

    test('should update line height correctly', () {
      const newLineHeight = 2.5;
      viewModel.updateLineHeightSetting(newLineHeight);

      expect(viewModel.textSettings.value.lineHeight, equals(newLineHeight));
    });

    test('should update text scale factor correctly', () {
      const newScaleFactor = 1.75;
      viewModel.updateScaleFactorSetting(newScaleFactor);

      expect(
        viewModel.textSettings.value.textScaleFactor,
        equals(newScaleFactor),
      );
    });

    test('should update word spacing correctly', () {
      const newWordSpacing = 8.0;
      viewModel.updateWordSpacingSetting(newWordSpacing);

      expect(viewModel.textSettings.value.wordSpacing, equals(newWordSpacing));
    });

    test('should update text color correctly', () {
      const newColor = Colors.purple;
      viewModel.updateTextColorSettings(newColor);

      expect(viewModel.textSettings.value.color, equals(newColor.toARGB32()));
    });
  });

  group('color settings updates', () {
    test('should update color profile level when name is provided', () {
      final newColorProfileLevelName = ColorProfileLevel.highContrast.name;
      viewModel.updateColorProfileLevel(
        newColorProfileLevelName: newColorProfileLevelName,
      );

      expect(
        viewModel.colorSettings.value.colorProfileLevel.name,
        equals(newColorProfileLevelName),
      );
    });

    test('should update to next color profile when no name is provided', () {
      // Save current index
      final initialIndex =
          viewModel.colorSettings.value.colorProfileLevel.index;
      final expectedNextIndex = (initialIndex + 1) % ColorProfile.values.length;
      final expectedNextLevel = ColorProfile.values[expectedNextIndex].level;

      viewModel.updateColorProfileLevel();

      expect(
        viewModel.colorSettings.value.colorProfileLevel,
        equals(expectedNextLevel),
      );
    });

    test('should update pages background color correctly', () {
      const newColor = Colors.amber;
      viewModel.updatePagesBackgroundColorSettings(newColor);

      expect(
        viewModel.colorSettings.value.pagesBackgroundColorValue,
        equals(newColor.toARGB32()),
      );
    });
  });

  group('copyWith method for updating settings', () {
    test('should update settings individually', () {
      // Save original values
      final originalEffectsAllowed = viewModel.effectsAllowed.value;
      final originalTextSettings = viewModel.textSettings.value;
      final originalColorSettings = viewModel.colorSettings.value;

      // Only update theme mode using copyWith
      viewModel = viewModel.copyWith(themeMode: ThemeMode.dark);
      expect(viewModel.themeMode.value, equals(ThemeMode.dark));
      expect(viewModel.effectsAllowed.value, equals(originalEffectsAllowed));
      expect(viewModel.textSettings.value, equals(originalTextSettings));
      expect(viewModel.colorSettings.value, equals(originalColorSettings));

      // Only update effects allowed using copyWith
      viewModel = viewModel.copyWith(effectsAllowed: !originalEffectsAllowed);
      expect(
        viewModel.themeMode.value,
        equals(ThemeMode.dark),
      ); // Still the updated value
      expect(viewModel.effectsAllowed.value, equals(!originalEffectsAllowed));
      expect(viewModel.textSettings.value, equals(originalTextSettings));
      expect(viewModel.colorSettings.value, equals(originalColorSettings));

      // Update text settings using copyWith
      final newTextSettings =
          TextSettings.defaultSettings.copyWith(textScaleFactor: 2);
      viewModel = viewModel.copyWith(textSettings: newTextSettings);
      expect(viewModel.textSettings.value, equals(newTextSettings));

      // Update color settings using copyWith
      final newColorSettings = ColorSettings.defaultSettings
          .copyWith(colorProfileLevel: ColorProfileLevel.highContrast);
      viewModel = viewModel.copyWith(colorSettings: newColorSettings);
      expect(viewModel.colorSettings.value, equals(newColorSettings));
    });
  });

  group('copyWith', () {
    test('should create a new instance with specified fields replaced', () {
      const newThemeMode = ThemeMode.dark;
      final newEffectsAllowed = !viewModel.effectsAllowed.value;
      final newTextSettings =
          TextSettings.defaultSettings.copyWith(letterSpacing: 3);
      final newColorSettings = ColorSettings.defaultSettings
          .copyWith(colorProfileLevel: ColorProfileLevel.highContrast);

      final newViewModel = viewModel.copyWith(
        themeMode: newThemeMode,
        effectsAllowed: newEffectsAllowed,
        textSettings: newTextSettings,
        colorSettings: newColorSettings,
      );

      // New instance should have the new values
      expect(newViewModel.themeMode.value, equals(newThemeMode));
      expect(newViewModel.effectsAllowed.value, equals(newEffectsAllowed));
      expect(newViewModel.textSettings.value, equals(newTextSettings));
      expect(newViewModel.colorSettings.value, equals(newColorSettings));

      // Original should be unchanged
      expect(viewModel.themeMode.value, equals(ThemeMode.system));
      expect(
        viewModel.effectsAllowed.value,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(
        viewModel.textSettings.value,
        equals(TextSettings.defaultSettings),
      );
      expect(
        viewModel.colorSettings.value,
        equals(ColorSettings.defaultSettings),
      );
    });

    test('should keep original values for unspecified fields', () {
      const newThemeMode = ThemeMode.dark;
      final newViewModel = viewModel.copyWith(themeMode: newThemeMode);
      expect(newViewModel.themeMode.value, equals(newThemeMode));
      expect(
        newViewModel.effectsAllowed.value,
        equals(viewModel.effectsAllowed.value),
      );
      expect(
        newViewModel.textSettings.value,
        equals(viewModel.textSettings.value),
      );
      expect(
        newViewModel.colorSettings.value,
        equals(viewModel.colorSettings.value),
      );
    });
  });

  group('equality and hash code', () {
    test('identical instances should be equal', () {
      expect(viewModel == viewModel, isTrue);
    });

    test('instances with same values should be equal', () {
      final sameViewModel =
          AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
        accessibilitySettingsCollection: accessibilitySettingsCollection,
      );
      expect(viewModel == sameViewModel, isTrue);
    });

    test('instances with different values should not be equal', () {
      final differentViewModel = viewModel.copyWith(themeMode: ThemeMode.dark);
      expect(viewModel == differentViewModel, isFalse);
    });

    test('hash code should be the same for equal instances', () {
      final sameViewModel =
          AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
        accessibilitySettingsCollection: accessibilitySettingsCollection,
      );
      expect(viewModel.hashCode, equals(sameViewModel.hashCode));
    });
  });

  group('toString', () {
    test('should include all field values', () {
      final stringRepresentation = viewModel.toString();
      expect(
        stringRepresentation,
        contains(viewModel.themeMode.value.toString()),
      );
      expect(
        stringRepresentation,
        contains(viewModel.effectsAllowed.value.toString()),
      );
      expect(stringRepresentation, contains('textSettings'));
      expect(stringRepresentation, contains('colorSettings'));
    });
  });

  group('font family settings', () {
    test('should enable accessible font when useAccessibleFont is true', () {
      viewModel.updateFontFamilySetting(useAccessibleFont: true);

      expect(
        viewModel.textSettings.value.fontFamily,
        equals(LocalStorageDefaultValues.accessibleFontFamily),
      );
      expect(viewModel.textSettings.value.isAccessibleFontEnabled, isTrue);
    });

    test('should disable accessible font when useAccessibleFont is false', () {
      viewModel.updateFontFamilySetting(useAccessibleFont: true);
      expect(viewModel.textSettings.value.isAccessibleFontEnabled, isTrue);

      viewModel.updateFontFamilySetting(useAccessibleFont: false);

      expect(
        viewModel.textSettings.value.fontFamily,
        equals(LocalStorageDefaultValues.fontFamilyDefault),
      );
      expect(viewModel.textSettings.value.isAccessibleFontEnabled, isFalse);
    });

    test('should toggle accessible font correctly', () {
      expect(viewModel.textSettings.value.isAccessibleFontEnabled, isFalse);

      viewModel.updateFontFamilySetting(useAccessibleFont: true);
      expect(viewModel.textSettings.value.isAccessibleFontEnabled, isTrue);

      viewModel.updateFontFamilySetting(useAccessibleFont: false);
      expect(viewModel.textSettings.value.isAccessibleFontEnabled, isFalse);
    });
  });
}
