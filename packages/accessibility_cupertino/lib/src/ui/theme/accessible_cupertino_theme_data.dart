import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A [CupertinoThemeData] with the accessibility settings applied.
///
/// The theme mode sets the brightness (`system` keeps the app theme's own,
/// which follows the platform when `null`); the colour settings set the
/// page background and adjust the theme colours with the colour profile,
/// variant by variant for a [CupertinoDynamicColor] (never for
/// [ColorProfileLevel.normal]); the text settings are applied through
/// [AccessibleTextStyle.applyTextSettings] to every style of the text
/// theme. [AccessibleText] therefore applies only alignment and colour.
extension type AccessibleCupertinoThemeData._(CupertinoThemeData _themeData)
    implements CupertinoThemeData {
  /// Applies [settings] to [themeData].
  ///
  /// [font] is the registered font matching the settings' family, used to
  /// qualify the family with its package. [highContrast] applies the
  /// high-contrast colour profile in addition to the settings' profile,
  /// for the OS "increase contrast" setting; it is a no-op when the
  /// settings' profile is already [ColorProfileLevel.highContrast], since
  /// that pass already applied it.
  factory AccessibleCupertinoThemeData.from({
    required CupertinoThemeData themeData,
    required AccessibilitySettings settings,
    AccessibleFont? font,
    bool highContrast = false,
  }) {
    final brightness = switch (settings.themeMode) {
      AccessibilityThemeMode.system => null,
      AccessibilityThemeMode.light => Brightness.light,
      AccessibilityThemeMode.dark => Brightness.dark,
    };
    final colored = _applyColorSettings(
      themeData.copyWith(brightness: brightness),
      settings.colorSettings,
      highContrast: highContrast,
    );
    return AccessibleCupertinoThemeData._(
      colored.copyWith(
        textTheme: _applyTextSettings(
          colored.textTheme,
          settings.textSettings,
          font,
        ),
      ),
    );
  }
}

CupertinoThemeData _applyColorSettings(
  CupertinoThemeData theme,
  ColorSettings settings, {
  required bool highContrast,
}) {
  var result = theme;
  if (settings.colorProfile != ColorProfileLevel.normal) {
    result = _adjustColors(
      result,
      ColorProfile.fromLevel(settings.colorProfile),
    );
  }
  if (highContrast && settings.colorProfile != ColorProfileLevel.highContrast) {
    result = _adjustColors(
      result,
      ColorProfile.fromLevel(ColorProfileLevel.highContrast),
    );
  }
  final background = settings.backgroundColor;
  // After both profile passes: the user picked this exact colour, and
  // _adjustColors would otherwise recolour it. Parity with Material,
  // whose profile pass only touches the colour scheme.
  if (background != null) {
    result = result.copyWith(scaffoldBackgroundColor: Color(background));
  }
  return result;
}

/// Applies [profile] to every colour of [theme].
CupertinoThemeData _adjustColors(
  CupertinoThemeData theme,
  ColorProfile profile,
) => theme.copyWith(
  primaryColor: _adjust(theme.primaryColor, profile),
  primaryContrastingColor: _adjust(theme.primaryContrastingColor, profile),
  barBackgroundColor: _adjust(theme.barBackgroundColor, profile),
  scaffoldBackgroundColor: _adjust(theme.scaffoldBackgroundColor, profile),
  selectionHandleColor: _adjust(theme.selectionHandleColor, profile),
);

/// Applies [profile] to [color], variant by variant when it is dynamic so
/// it keeps resolving against brightness, elevation and OS contrast.
///
/// The rebuilt colour carries no debug label: [CupertinoDynamicColor]
/// exposes it only to its own library, so it cannot be read back and
/// reapplied here; it only ever affects diagnostics output.
Color _adjust(Color color, ColorProfile profile) => switch (color) {
  CupertinoDynamicColor() => CupertinoDynamicColor(
    color: color.color.withColorProfile(profile),
    darkColor: color.darkColor.withColorProfile(profile),
    highContrastColor: color.highContrastColor.withColorProfile(profile),
    darkHighContrastColor: color.darkHighContrastColor.withColorProfile(
      profile,
    ),
    elevatedColor: color.elevatedColor.withColorProfile(profile),
    darkElevatedColor: color.darkElevatedColor.withColorProfile(profile),
    highContrastElevatedColor: color.highContrastElevatedColor.withColorProfile(
      profile,
    ),
    darkHighContrastElevatedColor: color.darkHighContrastElevatedColor
        .withColorProfile(profile),
  ),
  _ => color.withColorProfile(profile),
};

CupertinoTextThemeData _applyTextSettings(
  CupertinoTextThemeData source,
  TextSettings text,
  AccessibleFont? font,
) {
  if (text.isDefault) {
    return source;
  }
  TextStyle style(TextStyle style) => style.applyTextSettings(text, font: font);
  return source.copyWith(
    textStyle: style(source.textStyle),
    actionTextStyle: style(source.actionTextStyle),
    actionSmallTextStyle: style(source.actionSmallTextStyle),
    tabLabelTextStyle: style(source.tabLabelTextStyle),
    navTitleTextStyle: style(source.navTitleTextStyle),
    navLargeTitleTextStyle: style(source.navLargeTitleTextStyle),
    navActionTextStyle: style(source.navActionTextStyle),
    pickerTextStyle: style(source.pickerTextStyle),
    dateTimePickerTextStyle: style(source.dateTimePickerTextStyle),
  );
}
