import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The colours of the app for the current settings.
///
/// Light and dark come from the theme mode (system follows the platform);
/// the background override and the colour profile of the settings are
/// applied on top, the way the theme packages do it.
final class Palette {
  const Palette._({
    required this.background,
    required this.surface,
    required this.text,
    required this.accent,
    required this.onAccent,
  });

  /// Resolves the palette for [settings] under [context].
  factory Palette.of(BuildContext context, AccessibilitySettings settings) {
    final dark = switch (settings.themeMode) {
      AccessibilityThemeMode.system =>
        MediaQuery.platformBrightnessOf(context) == Brightness.dark,
      AccessibilityThemeMode.light => false,
      AccessibilityThemeMode.dark => true,
    };
    final base = dark ? _dark : _light;
    final background = settings.colorSettings.backgroundColor;
    final profile = settings.colorSettings.colorProfile;
    Color adjust(Color color) => profile == ColorProfileLevel.normal
        ? color
        : color.withColorProfile(ColorProfile.fromLevel(profile));
    return Palette._(
      background: background == null
          ? adjust(base.background)
          : Color(background),
      surface: adjust(base.surface),
      text: adjust(base.text),
      accent: adjust(base.accent),
      onAccent: adjust(base.onAccent),
    );
  }

  static const _light = Palette._(
    background: Color(0xFFFFFBFE),
    surface: Color(0xFFE7E0EC),
    text: Color(0xFF1C1B1F),
    accent: Color(0xFF5B3FA0),
    onAccent: Color(0xFFFFFFFF),
  );

  static const _dark = Palette._(
    background: Color(0xFF1C1B1F),
    surface: Color(0xFF49454F),
    text: Color(0xFFE6E1E5),
    accent: Color(0xFFD0BCFF),
    onAccent: Color(0xFF381E72),
  );

  /// The page background.
  final Color background;

  /// The buttons' background.
  final Color surface;

  /// The default text colour.
  final Color text;

  /// The colour of an active button.
  final Color accent;

  /// The text colour on [accent].
  final Color onAccent;
}
