import 'package:accessibility_material/src/ui/theme/accessible_theme_data.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The four themes and the mode to hand to `MaterialApp`.
final class AccessibleThemes {
  /// Creates the bundle.
  const AccessibleThemes({
    required this.light,
    required this.dark,
    required this.highContrastLight,
    required this.highContrastDark,
    required this.mode,
  });

  /// The light theme with the settings applied.
  final ThemeData light;

  /// The dark theme with the settings applied.
  final ThemeData dark;

  /// [light] with the high-contrast colour profile forced, for
  /// `MaterialApp.highContrastTheme`.
  final ThemeData highContrastLight;

  /// [dark] with the high-contrast colour profile forced, for
  /// `MaterialApp.highContrastDarkTheme`.
  final ThemeData highContrastDark;

  /// The settings' theme mode as `material_ui`'s [ThemeMode].
  final ThemeMode mode;
}

/// Builds the app from the [AccessibleThemes] of the current settings.
typedef AccessibleThemesWidgetBuilder =
    Widget Function(BuildContext context, AccessibleThemes themes);

/// Applies the accessibility settings to the app's themes.
///
/// Place it under an [AccessibilityScope] and above `MaterialApp`; the
/// [builder] receives the four themes and the mode and passes them on. It
/// rebuilds whenever the settings change.
final class AccessibleThemeBuilder extends StatelessWidget {
  /// Creates the builder over [theme] and [darkTheme], which default to
  /// `ThemeData.light()` and `ThemeData.dark()`.
  const AccessibleThemeBuilder({
    required this.builder,
    this.theme,
    this.darkTheme,
    super.key,
  });

  /// Builds the app from the themes.
  final AccessibleThemesWidgetBuilder builder;

  /// The app's light theme, before the settings.
  final ThemeData? theme;

  /// The app's dark theme, before the settings.
  final ThemeData? darkTheme;

  static final ThemeData _defaultLight = ThemeData.light();
  static final ThemeData _defaultDark = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    final settings = AccessibilityScope.settingsOf(context);
    final font = AccessibilityScope.of(context).activeFont;
    final light = theme ?? _defaultLight;
    final dark = darkTheme ?? _defaultDark;
    ThemeData apply(ThemeData base, {required bool forceHighContrast}) =>
        AccessibleThemeData.from(
          themeData: base,
          settings: settings,
          font: font,
          forceHighContrast: forceHighContrast,
        );
    return builder(
      context,
      AccessibleThemes(
        light: apply(light, forceHighContrast: false),
        dark: apply(dark, forceHighContrast: false),
        highContrastLight: apply(light, forceHighContrast: true),
        highContrastDark: apply(dark, forceHighContrast: true),
        mode: switch (settings.themeMode) {
          AccessibilityThemeMode.system => ThemeMode.system,
          AccessibilityThemeMode.light => ThemeMode.light,
          AccessibilityThemeMode.dark => ThemeMode.dark,
        },
      ),
    );
  }
}
