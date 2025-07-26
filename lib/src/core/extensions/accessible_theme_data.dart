import 'package:accessibility/src/core/animations/page_transitions.dart';
import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/extensions/colors.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:flutter/material.dart';

/// {@template AccessibleThemeData}
/// A theme data that conforms to accessibility settings.
///
/// It is used to apply the current accessibility settings of the application
/// to its children.
/// {@endtemplate}
extension type AccessibleThemeData._(ThemeData themeData) implements ThemeData {
  /// Returns a new [AccessibleThemeData] that conforms to the provided
  /// accessibility settings.
  ///
  /// The WCAG 2.1 AA guidelines were used to configure
  /// the text style properties, referring to the following
  /// rules:
  ///
  /// - https://www.w3.org/Translations/WCAG21-it/#contrast-minimum
  /// - https://www.w3.org/Translations/WCAG21-it/#resize-text
  /// - https://www.w3.org/Translations/WCAG21-it/#text-spacing
  factory AccessibleThemeData.from({
    required ThemeData themeData,
    required TextSettings settings,
    required ColorSettings colorSettings,
    required bool effectsEnabled,
  }) =>
      AccessibleThemeData._(
        applyTextSettingsOnTheme(
          theme: applyColorSettingsOnTheme(
            theme: applyEffectsSettingOnTheme(
              theme: themeData,
              effectsEnabled: effectsEnabled,
            ),
            settings: colorSettings,
          ),
          settings: settings,
        ),
      );
}

/// Returns the current [ThemeData] in which the
/// accessibility text style properties were configured.
///
/// The WCAG 2.1 AA guidelines were used to configure
/// the text style properties, referring to the following
/// rules:
///
/// - https://www.w3.org/Translations/WCAG21-it/#contrast-minimum
/// - https://www.w3.org/Translations/WCAG21-it/#resize-text
/// - https://www.w3.org/Translations/WCAG21-it/#text-spacing
ThemeData applyTextSettingsOnTheme({
  required ThemeData theme,
  required TextSettings settings,
}) {
  if (settings == TextSettings.defaultSettings) {
    return theme;
  }
  final accessibleTextStyle = TextStyle(
    wordSpacing: settings.wordSpacing,
    letterSpacing: settings.letterSpacing,
    height: settings.lineHeight,
    fontWeight: settings.isFontWeightBold ? FontWeight.bold : null,
  );

  return theme.copyWith(
    textTheme: theme.textTheme.copyWith(
      displayLarge: _produceAccessibleTextStyle(
        theme.textTheme.displayLarge!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      displayMedium: _produceAccessibleTextStyle(
        theme.textTheme.displayMedium!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      displaySmall: _produceAccessibleTextStyle(
        theme.textTheme.displaySmall!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      headlineLarge: _produceAccessibleTextStyle(
        theme.textTheme.headlineLarge!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      headlineMedium: _produceAccessibleTextStyle(
        theme.textTheme.headlineMedium!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      headlineSmall: _produceAccessibleTextStyle(
        theme.textTheme.headlineSmall!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      titleLarge: _produceAccessibleTextStyle(
        theme.textTheme.titleLarge!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      titleMedium: _produceAccessibleTextStyle(
        theme.textTheme.titleMedium!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      titleSmall: _produceAccessibleTextStyle(
        theme.textTheme.titleSmall!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      labelLarge: _produceAccessibleTextStyle(
        theme.textTheme.labelLarge!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      labelMedium: _produceAccessibleTextStyle(
        theme.textTheme.labelMedium!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      labelSmall: _produceAccessibleTextStyle(
        theme.textTheme.labelSmall!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      bodyLarge: _produceAccessibleTextStyle(
        theme.textTheme.bodyLarge!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      bodyMedium: _produceAccessibleTextStyle(
        theme.textTheme.bodyMedium!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      bodySmall: _produceAccessibleTextStyle(
        theme.textTheme.bodySmall!,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
  );
}

/// Returns the current [ThemeData] in which the
/// color settings were configured.
ThemeData applyColorSettingsOnTheme({
  required ThemeData theme,
  required ColorSettings settings,
}) {
  if (settings == ColorSettings.defaultSettings) {
    return theme;
  }
  final colorProfile = ColorProfile.fromLevel(settings.colorProfileLevel);
  final backgroundColor = settings.pagesBackgroundColorValue !=
          LocalStorageDefaultValues.noColorSelected
      ? Color(settings.pagesBackgroundColorValue)
      : null;
  return theme.copyWith(
    dialogTheme: theme.dialogTheme.copyWith(
      backgroundColor: backgroundColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: theme.colorScheme.copyWith(
      primary: _adjustColor(
        theme.colorScheme.primary,
        colorProfile,
      ),
      onPrimary: _adjustColor(
        theme.colorScheme.onPrimary,
        colorProfile,
      ),
      primaryContainer: _adjustColor(
        theme.colorScheme.primaryContainer,
        colorProfile,
      ),
      onPrimaryContainer: _adjustColor(
        theme.colorScheme.onPrimaryContainer,
        colorProfile,
      ),
      primaryFixed: _adjustColor(
        theme.colorScheme.primaryFixed,
        colorProfile,
      ),
      primaryFixedDim: _adjustColor(
        theme.colorScheme.primaryFixedDim,
        colorProfile,
      ),
      onPrimaryFixed: _adjustColor(
        theme.colorScheme.onPrimaryFixed,
        colorProfile,
      ),
      onPrimaryFixedVariant: _adjustColor(
        theme.colorScheme.onPrimaryFixedVariant,
        colorProfile,
      ),
      secondary: _adjustColor(
        theme.colorScheme.secondary,
        colorProfile,
      ),
      onSecondary: _adjustColor(
        theme.colorScheme.onSecondary,
        colorProfile,
      ),
      secondaryContainer: _adjustColor(
        theme.colorScheme.secondaryContainer,
        colorProfile,
      ),
      onSecondaryContainer: _adjustColor(
        theme.colorScheme.onSecondaryContainer,
        colorProfile,
      ),
      secondaryFixed: _adjustColor(
        theme.colorScheme.secondaryFixed,
        colorProfile,
      ),
      secondaryFixedDim: _adjustColor(
        theme.colorScheme.secondaryFixedDim,
        colorProfile,
      ),
      onSecondaryFixed: _adjustColor(
        theme.colorScheme.onSecondaryFixed,
        colorProfile,
      ),
      onSecondaryFixedVariant: _adjustColor(
        theme.colorScheme.onSecondaryFixedVariant,
        colorProfile,
      ),
      tertiary: _adjustColor(
        theme.colorScheme.tertiary,
        colorProfile,
      ),
      onTertiary: _adjustColor(
        theme.colorScheme.onTertiary,
        colorProfile,
      ),
      tertiaryContainer: _adjustColor(
        theme.colorScheme.tertiaryContainer,
        colorProfile,
      ),
      onTertiaryContainer: _adjustColor(
        theme.colorScheme.onTertiaryContainer,
        colorProfile,
      ),
      tertiaryFixed: _adjustColor(
        theme.colorScheme.tertiaryFixed,
        colorProfile,
      ),
      tertiaryFixedDim: _adjustColor(
        theme.colorScheme.tertiaryFixedDim,
        colorProfile,
      ),
      onTertiaryFixed: _adjustColor(
        theme.colorScheme.onTertiaryFixed,
        colorProfile,
      ),
      onTertiaryFixedVariant: _adjustColor(
        theme.colorScheme.onTertiaryFixedVariant,
        colorProfile,
      ),
      error: _adjustColor(
        theme.colorScheme.error,
        colorProfile,
      ),
      errorContainer: _adjustColor(
        theme.colorScheme.errorContainer,
        colorProfile,
      ),
      onError: _adjustColor(
        theme.colorScheme.onError,
        colorProfile,
      ),
      onErrorContainer: _adjustColor(
        theme.colorScheme.onErrorContainer,
        colorProfile,
      ),
      surface: _adjustColor(
        theme.colorScheme.surface,
        colorProfile,
      ),
      onSurface: _adjustColor(
        theme.colorScheme.onSurface,
        colorProfile,
      ),
      surfaceDim: _adjustColor(
        theme.colorScheme.surfaceDim,
        colorProfile,
      ),
      surfaceBright: _adjustColor(
        theme.colorScheme.surfaceBright,
        colorProfile,
      ),
      surfaceContainerLowest: _adjustColor(
        theme.colorScheme.surfaceContainerLowest,
        colorProfile,
      ),
      surfaceContainerLow: _adjustColor(
        theme.colorScheme.surfaceContainerLow,
        colorProfile,
      ),
      surfaceContainer: _adjustColor(
        theme.colorScheme.surfaceContainer,
        colorProfile,
      ),
      surfaceContainerHigh: _adjustColor(
        theme.colorScheme.surfaceContainerHigh,
        colorProfile,
      ),
      surfaceContainerHighest: _adjustColor(
        theme.colorScheme.surfaceContainerHighest,
        colorProfile,
      ),
      onSurfaceVariant: _adjustColor(
        theme.colorScheme.onSurfaceVariant,
        colorProfile,
      ),
      outline: _adjustColor(
        theme.colorScheme.outline,
        colorProfile,
      ),
      outlineVariant: _adjustColor(
        theme.colorScheme.outlineVariant,
        colorProfile,
      ),
      onInverseSurface: _adjustColor(
        theme.colorScheme.onInverseSurface,
        colorProfile,
      ),
      inverseSurface: _adjustColor(
        theme.colorScheme.inverseSurface,
        colorProfile,
      ),
      inversePrimary: _adjustColor(
        theme.colorScheme.inversePrimary,
        colorProfile,
      ),
      shadow: _adjustColor(
        theme.colorScheme.shadow,
        colorProfile,
      ),
      surfaceTint: _adjustColor(
        theme.colorScheme.surfaceTint,
        colorProfile,
      ),
      scrim: _adjustColor(
        theme.colorScheme.scrim,
        colorProfile,
      ),
    ),
  );
}

/// Apply the effects setting to the given [theme].
ThemeData applyEffectsSettingOnTheme({
  required ThemeData theme,
  required bool effectsEnabled,
}) {
  if (theme.pageTransitionsTheme
      is DependsOnEffectsSettingPageTransitionsTheme) {
    return theme;
  }
  return theme.copyWith(
    pageTransitionsTheme: const DependsOnEffectsSettingPageTransitionsTheme(),
  );
}

/// Adjust the color of the given [colorToAdjust] with
/// the given [colorProfile] saturation and lightness.
Color _adjustColor(Color colorToAdjust, ColorProfile colorProfile) {
  if (colorProfile.saturationMultiplier == null &&
      colorProfile.lightnessFactor == null) {
    return colorToAdjust;
  }
  return colorToAdjust
      .adjustSaturation(colorProfile.saturationMultiplier)
      .adjustLightness(colorProfile.lightnessFactor);
}

/// Create an accessible [TextStyle] using:
/// - [textStyleToConfigure] the [TextStyle] in which apply the
/// accessible settings;
/// - [textStyleAccessible] a [TextStyle] configured only with
/// a [TextSettings] instance;
/// - [textScaleFactor] the textScaleFactor property isn't part
/// of the [TextStyle] class, so it must be passed as a separate
/// parameter.
TextStyle _produceAccessibleTextStyle(
  TextStyle textStyleToConfigure,
  TextStyle textStyleAccessible,
  double? textScaleFactor,
  int textColor,
) =>
    textStyleToConfigure.copyWith(
      fontSize: _textScaler(textScaleFactor).scale(
        textStyleToConfigure.fontSize!,
      ),
      wordSpacing: textStyleAccessible.wordSpacing !=
              LocalStorageDefaultValues.wordSpacingDefault
          ? textStyleAccessible.wordSpacing
          : null,
      letterSpacing: textStyleAccessible.letterSpacing !=
              LocalStorageDefaultValues.letterSpacingDefault
          ? textStyleAccessible.letterSpacing
          : null,
      height: textStyleAccessible.height !=
              LocalStorageDefaultValues.lineHeightDefault
          ? textStyleAccessible.height
          : null,
      fontWeight: textStyleAccessible.fontWeight,
      color: textColor != LocalStorageDefaultValues.noColorSelected
          ? Color(textColor)
          : null,
    );

/// Returns a [TextScaler] that scales the font size.
///
/// For example, if the [textScaleFactor] is 1.5, the
/// [TextScaler] will scale the font size incrementing
/// it by 50%.
TextScaler _textScaler(double? textScaleFactor) =>
    textScaleFactor != null && textScaleFactor > 1
        ? TextScaler.linear(textScaleFactor)
        : TextScaler.noScaling;
