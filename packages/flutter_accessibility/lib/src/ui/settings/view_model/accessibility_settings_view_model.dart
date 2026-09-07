import 'package:accessibility/accessibility.dart';
import 'package:flutter/foundation.dart';

/// The ViewModel of the accessibility settings.
///
/// Subscribes to an [AccessibilitySettingsRepository], exposes its settings
/// and load status to the widget tree as a Flutter [ChangeNotifier], and
/// offers one command per setting. The Views (the settings panels or a
/// custom UI) call the commands and never touch the repository.
final class AccessibilitySettingsViewModel extends ChangeNotifier {
  /// Creates the ViewModel over [_repository].
  ///
  /// [accessibleFonts] are the fonts the app offers as accessible
  /// alternatives; the first one is selected by [setAccessibleFontEnabled].
  AccessibilitySettingsViewModel({
    required this._repository,
    List<AccessibleFont> accessibleFonts = const [],
  }) : accessibleFonts = List.unmodifiable(accessibleFonts) {
    _repository.settings.addListener(notifyListeners);
    _repository.status.addListener(notifyListeners);
  }

  final AccessibilitySettingsRepository _repository;

  /// The fonts registered as accessible alternatives, in registration order.
  final List<AccessibleFont> accessibleFonts;

  /// The current settings.
  AccessibilitySettings get settings => _repository.settings.value;

  /// The outcome of the last load.
  AccessibilitySettingsStatus get status => _repository.status.value;

  /// The registered font whose family equals the selected font family, or
  /// `null` when no font is selected or the family is not registered.
  AccessibleFont? get activeFont {
    final family = settings.textSettings.fontFamily;
    if (family == null) {
      return null;
    }
    for (final font in accessibleFonts) {
      if (font.family == family) {
        return font;
      }
    }
    return null;
  }

  /// Loads the stored settings; also used to retry after a failure.
  Future<void> load() => _repository.load();

  /// Sets the theme brightness.
  Future<void> setThemeMode(AccessibilityThemeMode mode) =>
      _repository.save(settings.copyWith(themeMode: mode));

  /// Sets whether effects and animations are allowed.
  Future<void> setEffectsMode(EffectsMode mode) =>
      _repository.save(settings.copyWith(effectsMode: mode));

  /// Sets the multiplier applied to every font size.
  Future<void> setTextScaleFactor(double value) =>
      _saveText(settings.textSettings.copyWith(textScaleFactor: value));

  /// Sets the line height, or clears it with `null`.
  Future<void> setLineHeight(double? value) =>
      _saveText(settings.textSettings.copyWith(lineHeight: value));

  /// Sets the letter spacing, or clears it with `null`.
  Future<void> setLetterSpacing(double? value) =>
      _saveText(settings.textSettings.copyWith(letterSpacing: value));

  /// Sets the word spacing, or clears it with `null`.
  Future<void> setWordSpacing(double? value) =>
      _saveText(settings.textSettings.copyWith(wordSpacing: value));

  /// Sets whether all text is bold.
  Future<void> setBold({required bool value}) =>
      _saveText(settings.textSettings.copyWith(isBold: value));

  /// Sets the text alignment override.
  Future<void> setTextAlign(TextAlignMode mode) =>
      _saveText(settings.textSettings.copyWith(textAlign: mode));

  /// Sets the text colour as ARGB, or clears it with `null`.
  Future<void> setTextColor(int? argb) =>
      _saveText(settings.textSettings.copyWith(color: argb));

  /// Sets the font family, or clears it with `null`.
  Future<void> setFontFamily(String? family) =>
      _saveText(settings.textSettings.copyWith(fontFamily: family));

  /// Selects the first registered accessible font, or clears the font.
  ///
  /// Does nothing when [enabled] is true and no font is registered.
  Future<void> setAccessibleFontEnabled({required bool enabled}) {
    if (!enabled) {
      return setFontFamily(null);
    }
    if (accessibleFonts.isEmpty) {
      return Future.value();
    }
    return setFontFamily(accessibleFonts.first.family);
  }

  /// Sets the page background colour as ARGB, or clears it with `null`.
  Future<void> setBackgroundColor(int? argb) => _repository.save(
    settings.copyWith(
      colorSettings: settings.colorSettings.copyWith(backgroundColor: argb),
    ),
  );

  /// Sets the colour profile.
  Future<void> setColorProfile(ColorProfileLevel level) => _repository.save(
    settings.copyWith(
      colorSettings: settings.colorSettings.copyWith(colorProfile: level),
    ),
  );

  /// Cycles to the next colour profile, wrapping around.
  Future<void> nextColorProfile() =>
      _repository.save(settings.withNextColorProfile());

  /// Applies a theme profile preset, keeping the theme brightness.
  Future<void> applyThemeProfile(ThemeProfileLevel level) =>
      _repository.save(settings.withThemeProfile(level));

  /// Restores the default settings and clears the stored ones.
  Future<void> restoreDefaults() => _repository.clear();

  Future<void> _saveText(TextSettings textSettings) =>
      _repository.save(settings.copyWith(textSettings: textSettings));

  @override
  void dispose() {
    _repository.settings.removeListener(notifyListeners);
    _repository.status.removeListener(notifyListeners);
    super.dispose();
  }
}
