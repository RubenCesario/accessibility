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
    primaryTextTheme: _produceAccessibleTextTheme(
      theme.primaryTextTheme,
      accessibleTextStyle,
      settings.textScaleFactor,
      settings.color,
    ),
    textTheme: _produceAccessibleTextTheme(
      theme.textTheme,
      accessibleTextStyle,
      settings.textScaleFactor,
      settings.color,
    ),
    // buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _createAccessibleButtonStyle(
        theme.elevatedButtonTheme.style,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _createAccessibleButtonStyle(
        theme.outlinedButtonTheme.style,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: _createAccessibleButtonStyle(
        theme.textButtonTheme.style,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: _createAccessibleButtonStyle(
        theme.filledButtonTheme.style,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    segmentedButtonTheme: theme.segmentedButtonTheme.copyWith(
      style: _createAccessibleButtonStyle(
        theme.segmentedButtonTheme.style,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: _createAccessibleButtonStyle(
        theme.menuButtonTheme.style,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    toggleButtonsTheme: theme.toggleButtonsTheme.copyWith(
      textStyle: _produceAccessibleTextStyle(
        theme.toggleButtonsTheme.textStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    // app bar & tab bar
    appBarTheme: theme.appBarTheme.copyWith(
      titleTextStyle: _produceAccessibleTextStyle(
        theme.appBarTheme.titleTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      toolbarTextStyle: _produceAccessibleTextStyle(
        theme.appBarTheme.toolbarTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      foregroundColor: Color(settings.color),
    ),
    tabBarTheme: theme.tabBarTheme.copyWith(
      labelStyle: _produceAccessibleTextStyle(
        theme.tabBarTheme.labelStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        LocalStorageDefaultValues.noColorSelected,
      ),
      unselectedLabelStyle: _produceAccessibleTextStyle(
        theme.tabBarTheme.unselectedLabelStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        LocalStorageDefaultValues.noColorSelected,
      ),
      labelColor: Color(settings.color),
      indicatorColor: Color(settings.color),
    ),
    inputDecorationTheme: _createAccessibleInputDecorationTheme(
      theme.inputDecorationTheme,
      accessibleTextStyle,
      settings.textScaleFactor,
      settings.color,
    ),
    // list tile
    listTileTheme: theme.listTileTheme.copyWith(
      titleTextStyle: _produceAccessibleTextStyle(
        theme.listTileTheme.titleTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      subtitleTextStyle: _produceAccessibleTextStyle(
        theme.listTileTheme.subtitleTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      leadingAndTrailingTextStyle: _produceAccessibleTextStyle(
        theme.listTileTheme.leadingAndTrailingTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        LocalStorageDefaultValues.noColorSelected,
      ),
      textColor: Color(settings.color),
    ),
    // chip
    chipTheme: theme.chipTheme.copyWith(
      labelStyle: _produceAccessibleTextStyle(
        theme.chipTheme.labelStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    // dialog & snackbar & tooltip
    dialogTheme: theme.dialogTheme.copyWith(
      titleTextStyle: _produceAccessibleTextStyle(
        theme.dialogTheme.titleTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      contentTextStyle: _produceAccessibleTextStyle(
        theme.dialogTheme.contentTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    snackBarTheme: theme.snackBarTheme.copyWith(
      contentTextStyle: _produceAccessibleTextStyle(
        theme.snackBarTheme.contentTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    tooltipTheme: theme.tooltipTheme.copyWith(
      textStyle: _produceAccessibleTextStyle(
        theme.tooltipTheme.textStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    // navigation
    bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
      selectedLabelStyle: _produceAccessibleTextStyle(
        theme.bottomNavigationBarTheme.selectedLabelStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      unselectedLabelStyle: _produceAccessibleTextStyle(
        theme.bottomNavigationBarTheme.unselectedLabelStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        LocalStorageDefaultValues.noColorSelected,
      ),
      selectedItemColor: Color(settings.color),
    ),
    navigationBarTheme: theme.navigationBarTheme.copyWith(
      labelTextStyle: _produceAccessibleWidgetStatePropertyTextStyle(
        theme.navigationBarTheme.labelTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    navigationDrawerTheme: theme.navigationDrawerTheme.copyWith(
      labelTextStyle: _produceAccessibleWidgetStatePropertyTextStyle(
        theme.navigationDrawerTheme.labelTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    navigationRailTheme: theme.navigationRailTheme.copyWith(
      selectedLabelTextStyle: _produceAccessibleTextStyle(
        theme.navigationRailTheme.selectedLabelTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      unselectedLabelTextStyle: _produceAccessibleTextStyle(
        theme.navigationRailTheme.unselectedLabelTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        LocalStorageDefaultValues.noColorSelected,
      ),
    ),
    // table
    dataTableTheme: theme.dataTableTheme.copyWith(
      dataTextStyle: _produceAccessibleTextStyle(
        theme.dataTableTheme.dataTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      headingTextStyle: _produceAccessibleTextStyle(
        theme.dataTableTheme.headingTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    // date picker
    datePickerTheme: theme.datePickerTheme.copyWith(
      headerHelpStyle: _produceAccessibleTextStyle(
        theme.datePickerTheme.headerHelpStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      headerHeadlineStyle: _produceAccessibleTextStyle(
        theme.datePickerTheme.headerHeadlineStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      weekdayStyle: _produceAccessibleTextStyle(
        theme.datePickerTheme.weekdayStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      dayStyle: _produceAccessibleTextStyle(
        theme.datePickerTheme.dayStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      yearStyle: _produceAccessibleTextStyle(
        theme.datePickerTheme.yearStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      rangePickerHeaderHeadlineStyle: _produceAccessibleTextStyle(
        theme.datePickerTheme.rangePickerHeaderHeadlineStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      rangePickerHeaderHelpStyle: _produceAccessibleTextStyle(
        theme.datePickerTheme.rangePickerHeaderHelpStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      cancelButtonStyle: _createAccessibleButtonStyle(
        theme.datePickerTheme.cancelButtonStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      confirmButtonStyle: _createAccessibleButtonStyle(
        theme.datePickerTheme.confirmButtonStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      dayForegroundColor: WidgetStatePropertyAll(Color(settings.color)),
      yearForegroundColor: WidgetStatePropertyAll(Color(settings.color)),
      headerForegroundColor: Color(settings.color),
      todayForegroundColor: WidgetStatePropertyAll(Color(settings.color)),
      rangePickerHeaderForegroundColor: Color(settings.color),
      rangeSelectionOverlayColor: WidgetStatePropertyAll(Color(settings.color)),
    ),
    // time picker
    timePickerTheme: theme.timePickerTheme.copyWith(
      dialTextStyle: _produceAccessibleTextStyle(
        theme.timePickerTheme.dialTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      helpTextStyle: _produceAccessibleTextStyle(
        theme.timePickerTheme.helpTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      dayPeriodTextStyle: _produceAccessibleTextStyle(
        theme.timePickerTheme.dayPeriodTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      hourMinuteTextStyle: _produceAccessibleTextStyle(
        theme.timePickerTheme.hourMinuteTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      timeSelectorSeparatorTextStyle:
          _produceAccessibleWidgetStatePropertyTextStyle(
        theme.timePickerTheme.timeSelectorSeparatorTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      cancelButtonStyle: _createAccessibleButtonStyle(
        theme.timePickerTheme.cancelButtonStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      confirmButtonStyle: _createAccessibleButtonStyle(
        theme.timePickerTheme.confirmButtonStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      dialTextColor: Color(settings.color),
      dayPeriodTextColor: Color(settings.color),
      hourMinuteTextColor: Color(settings.color),
    ),
    // cupertino
    cupertinoOverrideTheme: theme.cupertinoOverrideTheme?.copyWith(
      textTheme: theme.cupertinoOverrideTheme?.textTheme?.copyWith(
        textStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.textStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        actionTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.actionTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        actionSmallTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.actionSmallTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        tabLabelTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.tabLabelTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        navTitleTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.navTitleTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        navLargeTitleTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.navLargeTitleTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        navActionTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.navActionTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        pickerTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.pickerTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
        dateTimePickerTextStyle: _produceAccessibleTextStyle(
          theme.cupertinoOverrideTheme?.textTheme?.dateTimePickerTextStyle,
          accessibleTextStyle,
          settings.textScaleFactor,
          settings.color,
        ),
      ),
    ),
    // other
    badgeTheme: theme.badgeTheme.copyWith(
      textStyle: _produceAccessibleTextStyle(
        theme.badgeTheme.textStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      textColor: Color(settings.color),
    ),
    bannerTheme: theme.bannerTheme.copyWith(
      contentTextStyle: _produceAccessibleTextStyle(
        theme.bannerTheme.contentTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    dropdownMenuTheme: theme.dropdownMenuTheme.copyWith(
      textStyle: _produceAccessibleTextStyle(
        theme.dropdownMenuTheme.textStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      inputDecorationTheme: _createAccessibleInputDecorationTheme(
        theme.dropdownMenuTheme.inputDecorationTheme,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
      extendedTextStyle: _produceAccessibleTextStyle(
        theme.floatingActionButtonTheme.extendedTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      foregroundColor: Color(settings.color),
    ),
    expansionTileTheme: theme.expansionTileTheme.copyWith(
      collapsedTextColor: Color(settings.color),
      textColor: Color(settings.color),
    ),
    searchViewTheme: theme.searchViewTheme.copyWith(
      headerTextStyle: _produceAccessibleTextStyle(
        theme.searchViewTheme.headerTextStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      headerHintStyle: _produceAccessibleTextStyle(
        theme.searchViewTheme.headerHintStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    searchBarTheme: theme.searchBarTheme.copyWith(
      textStyle: _produceAccessibleWidgetStatePropertyTextStyle(
        theme.searchBarTheme.textStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      hintStyle: _produceAccessibleWidgetStatePropertyTextStyle(
        theme.searchBarTheme.hintStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
    ),
    popupMenuTheme: theme.popupMenuTheme.copyWith(
      textStyle: _produceAccessibleTextStyle(
        theme.popupMenuTheme.textStyle,
        accessibleTextStyle,
        settings.textScaleFactor,
        settings.color,
      ),
      labelTextStyle: _produceAccessibleWidgetStatePropertyTextStyle(
        theme.popupMenuTheme.labelTextStyle,
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
  if (backgroundColor != null &&
      colorProfile.level == ColorSettings.defaultSettings.colorProfileLevel) {
    return theme.copyWith(
      dialogTheme: theme.dialogTheme.copyWith(
        backgroundColor: backgroundColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
    );
  }
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

WidgetStateProperty<TextStyle?>? _produceAccessibleWidgetStatePropertyTextStyle(
  WidgetStateProperty<TextStyle?>? widgetStatePropertyTextStyle,
  TextStyle textStyleAccessible,
  double textScaleFactor,
  int color,
) {
  final existingTextStyle = widgetStatePropertyTextStyle?.resolve({});
  final accessibleTextStyle = _produceAccessibleTextStyle(
    existingTextStyle ?? const TextStyle(),
    textStyleAccessible,
    textScaleFactor,
    color,
  );
  return accessibleTextStyle != null
      ? WidgetStatePropertyAll(accessibleTextStyle)
      : null;
}

TextTheme? _produceAccessibleTextTheme(
  TextTheme? textTheme,
  TextStyle accessibleTextStyle,
  double textScaleFactor,
  int color,
) =>
    textTheme?.copyWith(
      displayLarge: _produceAccessibleTextStyle(
        textTheme.displayLarge,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      displayMedium: _produceAccessibleTextStyle(
        textTheme.displayMedium,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      displaySmall: _produceAccessibleTextStyle(
        textTheme.displaySmall,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      headlineLarge: _produceAccessibleTextStyle(
        textTheme.headlineLarge,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      headlineMedium: _produceAccessibleTextStyle(
        textTheme.headlineMedium,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      headlineSmall: _produceAccessibleTextStyle(
        textTheme.headlineSmall,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      titleLarge: _produceAccessibleTextStyle(
        textTheme.titleLarge,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      titleMedium: _produceAccessibleTextStyle(
        textTheme.titleMedium,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      titleSmall: _produceAccessibleTextStyle(
        textTheme.titleSmall,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      labelLarge: _produceAccessibleTextStyle(
        textTheme.labelLarge,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      labelMedium: _produceAccessibleTextStyle(
        textTheme.labelMedium,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      labelSmall: _produceAccessibleTextStyle(
        textTheme.labelSmall,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      bodyLarge: _produceAccessibleTextStyle(
        textTheme.bodyLarge,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      bodyMedium: _produceAccessibleTextStyle(
        textTheme.bodyMedium,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
      bodySmall: _produceAccessibleTextStyle(
        textTheme.bodySmall,
        accessibleTextStyle,
        textScaleFactor,
        color,
      ),
    );

/// Create an accessible [TextStyle] using:
/// - [textStyleToConfigure] the [TextStyle] in which apply the
/// accessible settings;
/// - [textStyleAccessible] a [TextStyle] configured only with
/// a [TextSettings] instance;
/// - [textScaleFactor] the textScaleFactor property isn't part
/// of the [TextStyle] class, so it must be passed as a separate
/// parameter.
TextStyle? _produceAccessibleTextStyle(
  TextStyle? textStyleToConfigure,
  TextStyle textStyleAccessible,
  double? textScaleFactor,
  int textColor,
) {
  if (textStyleToConfigure == null) {
    return null;
  }
  double? fontSize;
  final textStyleToConfigureFontSize = textStyleToConfigure.fontSize;
  if (textStyleToConfigureFontSize != null) {
    fontSize = _textScaler(textScaleFactor).scale(textStyleToConfigureFontSize);
  }
  return textStyleToConfigure.copyWith(
    fontSize: fontSize,
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
}

/// Returns a [TextScaler] that scales the font size.
///
/// For example, if the [textScaleFactor] is 1.5, the
/// [TextScaler] will scale the font size incrementing
/// it by 50%.
TextScaler _textScaler(double? textScaleFactor) =>
    textScaleFactor != null && textScaleFactor > 1
        ? TextScaler.linear(textScaleFactor)
        : TextScaler.noScaling;

ButtonStyle? _createAccessibleButtonStyle(
  ButtonStyle? style,
  TextStyle textStyleAccessible,
  double? textScaleFactor,
  int textColor,
) {
  final existingTextStyle = style?.textStyle?.resolve({});
  final accessibleTextStyle = existingTextStyle != null
      ? _produceAccessibleTextStyle(
          existingTextStyle,
          textStyleAccessible,
          textScaleFactor,
          // Don't set color in textStyle, we override it in the foregroundColor
          LocalStorageDefaultValues.noColorSelected,
        )
      : null;

  return (style ?? const ButtonStyle()).copyWith(
    // Use foregroundColor for text color (overrides textStyle color)
    foregroundColor: textColor != LocalStorageDefaultValues.noColorSelected
        ? WidgetStatePropertyAll(Color(textColor))
        : null,
    // Only set textStyle if we have an existing one to avoid inherit conflicts
    textStyle: accessibleTextStyle != null
        ? WidgetStatePropertyAll(accessibleTextStyle)
        : null,
  );
}

InputDecorationTheme? _createAccessibleInputDecorationTheme(
  InputDecorationTheme? style,
  TextStyle textStyleAccessible,
  double? textScaleFactor,
  int textColor,
) {
  if (style == null) {
    return null;
  }
  return style.copyWith(
    labelStyle: _produceAccessibleTextStyle(
      style.labelStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    hintStyle: _produceAccessibleTextStyle(
      style.hintStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    helperStyle: _produceAccessibleTextStyle(
      style.helperStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    errorStyle: _produceAccessibleTextStyle(
      style.errorStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    floatingLabelStyle: _produceAccessibleTextStyle(
      style.floatingLabelStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    prefixStyle: _produceAccessibleTextStyle(
      style.prefixStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    suffixStyle: _produceAccessibleTextStyle(
      style.suffixStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    counterStyle: _produceAccessibleTextStyle(
      style.counterStyle,
      textStyleAccessible,
      textScaleFactor,
      textColor,
    ),
    iconColor: Color(textColor),
    prefixIconColor: Color(textColor),
    suffixIconColor: Color(textColor),
  );
}
