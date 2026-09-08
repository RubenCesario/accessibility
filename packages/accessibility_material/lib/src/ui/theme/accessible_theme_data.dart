import 'package:accessibility_material/src/ui/theme/accessible_page_transitions_theme.dart';
import 'package:accessibility_material/src/ui/theme/text_theme_normalization.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A [ThemeData] with the accessibility settings applied.
///
/// The transformation, moved from 1.x: the text theme is normalised over
/// [kMergeableEnglishLike2021]; the page transitions become an
/// [AccessiblePageTransitionsTheme] over the app's builders; the colour
/// settings set the page background and adjust every colour of the scheme
/// with the colour profile (never for [ColorProfileLevel.normal]); the text
/// settings are applied through [AccessibleTextStyle.applyTextSettings] to
/// every text style of the theme and of its component themes, and the text
/// colour to the component foregrounds. [AccessibleText] therefore applies
/// only alignment and colour.
extension type AccessibleThemeData._(ThemeData _themeData)
    implements ThemeData {
  /// Applies [settings] to [themeData].
  ///
  /// [font] is the registered font matching the settings' family, used to
  /// qualify the family with its package. [forceHighContrast] applies the
  /// high-contrast colour profile regardless of the settings, for the themes
  /// `MaterialApp` selects when the OS asks for more contrast.
  factory AccessibleThemeData.from({
    required ThemeData themeData,
    required AccessibilitySettings settings,
    AccessibleFont? font,
    bool forceHighContrast = false,
  }) {
    final normalized = themeData.copyWith(
      textTheme: kMergeableEnglishLike2021.merge(themeData.textTheme),
      primaryTextTheme: kMergeableEnglishLike2021.merge(
        themeData.primaryTextTheme,
      ),
    );
    final transitions = normalized.pageTransitionsTheme;
    final withTransitions = transitions is AccessiblePageTransitionsTheme
        ? normalized
        : normalized.copyWith(
            pageTransitionsTheme: AccessiblePageTransitionsTheme(
              builders: transitions.builders,
            ),
          );
    final colored = _applyColorSettings(
      withTransitions,
      settings.colorSettings,
      forceHighContrast: forceHighContrast,
    );
    return AccessibleThemeData._(
      _applyTextSettings(colored, settings.textSettings, font),
    );
  }
}

ThemeData _applyColorSettings(
  ThemeData theme,
  ColorSettings settings, {
  required bool forceHighContrast,
}) {
  final background = settings.backgroundColor;
  var result = theme;
  if (background != null) {
    final color = Color(background);
    result = result.copyWith(
      scaffoldBackgroundColor: color,
      dialogTheme: result.dialogTheme.copyWith(backgroundColor: color),
    );
  }
  final level = forceHighContrast
      ? ColorProfileLevel.highContrast
      : settings.colorProfile;
  if (level == ColorProfileLevel.normal) {
    return result;
  }
  final profile = ColorProfile.fromLevel(level);
  Color adjust(Color color) => color.withColorProfile(profile);
  final scheme = result.colorScheme;
  return result.copyWith(
    colorScheme: scheme.copyWith(
      primary: adjust(scheme.primary),
      onPrimary: adjust(scheme.onPrimary),
      primaryContainer: adjust(scheme.primaryContainer),
      onPrimaryContainer: adjust(scheme.onPrimaryContainer),
      primaryFixed: adjust(scheme.primaryFixed),
      primaryFixedDim: adjust(scheme.primaryFixedDim),
      onPrimaryFixed: adjust(scheme.onPrimaryFixed),
      onPrimaryFixedVariant: adjust(scheme.onPrimaryFixedVariant),
      secondary: adjust(scheme.secondary),
      onSecondary: adjust(scheme.onSecondary),
      secondaryContainer: adjust(scheme.secondaryContainer),
      onSecondaryContainer: adjust(scheme.onSecondaryContainer),
      secondaryFixed: adjust(scheme.secondaryFixed),
      secondaryFixedDim: adjust(scheme.secondaryFixedDim),
      onSecondaryFixed: adjust(scheme.onSecondaryFixed),
      onSecondaryFixedVariant: adjust(scheme.onSecondaryFixedVariant),
      tertiary: adjust(scheme.tertiary),
      onTertiary: adjust(scheme.onTertiary),
      tertiaryContainer: adjust(scheme.tertiaryContainer),
      onTertiaryContainer: adjust(scheme.onTertiaryContainer),
      tertiaryFixed: adjust(scheme.tertiaryFixed),
      tertiaryFixedDim: adjust(scheme.tertiaryFixedDim),
      onTertiaryFixed: adjust(scheme.onTertiaryFixed),
      onTertiaryFixedVariant: adjust(scheme.onTertiaryFixedVariant),
      error: adjust(scheme.error),
      onError: adjust(scheme.onError),
      errorContainer: adjust(scheme.errorContainer),
      onErrorContainer: adjust(scheme.onErrorContainer),
      surface: adjust(scheme.surface),
      onSurface: adjust(scheme.onSurface),
      surfaceDim: adjust(scheme.surfaceDim),
      surfaceBright: adjust(scheme.surfaceBright),
      surfaceContainerLowest: adjust(scheme.surfaceContainerLowest),
      surfaceContainerLow: adjust(scheme.surfaceContainerLow),
      surfaceContainer: adjust(scheme.surfaceContainer),
      surfaceContainerHigh: adjust(scheme.surfaceContainerHigh),
      surfaceContainerHighest: adjust(scheme.surfaceContainerHighest),
      onSurfaceVariant: adjust(scheme.onSurfaceVariant),
      outline: adjust(scheme.outline),
      outlineVariant: adjust(scheme.outlineVariant),
      shadow: adjust(scheme.shadow),
      scrim: adjust(scheme.scrim),
      inverseSurface: adjust(scheme.inverseSurface),
      onInverseSurface: adjust(scheme.onInverseSurface),
      inversePrimary: adjust(scheme.inversePrimary),
      surfaceTint: adjust(scheme.surfaceTint),
    ),
  );
}

ThemeData _applyTextSettings(
  ThemeData theme,
  TextSettings text,
  AccessibleFont? font,
) {
  if (text.isDefault) {
    return theme;
  }
  final textKeepingColor = text.copyWith(color: null);
  final color = text.color == null ? null : Color(text.color!);
  final colorProperty = color == null ? null : WidgetStatePropertyAll(color);

  TextStyle? style(TextStyle? source) =>
      source?.applyTextSettings(text, font: font);
  TextStyle? styleKeepingColor(TextStyle? source) =>
      source?.applyTextSettings(textKeepingColor, font: font);
  WidgetStateProperty<TextStyle?> stateStyle(
    WidgetStateProperty<TextStyle?>? source,
  ) => WidgetStatePropertyAll(
    (source?.resolve({}) ?? const TextStyle()).applyTextSettings(
      text,
      font: font,
    ),
  );
  TextTheme? textTheme(TextTheme? source) => source?.copyWith(
    displayLarge: style(source.displayLarge),
    displayMedium: style(source.displayMedium),
    displaySmall: style(source.displaySmall),
    headlineLarge: style(source.headlineLarge),
    headlineMedium: style(source.headlineMedium),
    headlineSmall: style(source.headlineSmall),
    titleLarge: style(source.titleLarge),
    titleMedium: style(source.titleMedium),
    titleSmall: style(source.titleSmall),
    labelLarge: style(source.labelLarge),
    labelMedium: style(source.labelMedium),
    labelSmall: style(source.labelSmall),
    bodyLarge: style(source.bodyLarge),
    bodyMedium: style(source.bodyMedium),
    bodySmall: style(source.bodySmall),
  );
  // Buttons take the colour through foregroundColor, never through the
  // text style, which would be shadowed by it.
  ButtonStyle button(ButtonStyle? source) {
    final existing = source?.textStyle?.resolve({});
    return (source ?? const ButtonStyle()).copyWith(
      foregroundColor: colorProperty,
      textStyle: existing == null
          ? null
          : WidgetStatePropertyAll(
              existing.applyTextSettings(textKeepingColor, font: font),
            ),
    );
  }

  final input = theme.inputDecorationTheme;
  final cupertino = theme.cupertinoOverrideTheme;
  return theme.copyWith(
    textTheme: textTheme(theme.textTheme),
    primaryTextTheme: textTheme(theme.primaryTextTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: button(theme.elevatedButtonTheme.style),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: button(theme.outlinedButtonTheme.style),
    ),
    textButtonTheme: TextButtonThemeData(
      style: button(theme.textButtonTheme.style),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: button(theme.filledButtonTheme.style),
    ),
    segmentedButtonTheme: theme.segmentedButtonTheme.copyWith(
      style: button(theme.segmentedButtonTheme.style),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: button(theme.menuButtonTheme.style),
    ),
    toggleButtonsTheme: theme.toggleButtonsTheme.copyWith(
      textStyle: style(theme.toggleButtonsTheme.textStyle),
    ),
    appBarTheme: theme.appBarTheme.copyWith(
      titleTextStyle: style(theme.appBarTheme.titleTextStyle),
      toolbarTextStyle: style(theme.appBarTheme.toolbarTextStyle),
      foregroundColor: color,
    ),
    tabBarTheme: theme.tabBarTheme.copyWith(
      labelStyle: style(theme.tabBarTheme.labelStyle),
      unselectedLabelStyle: styleKeepingColor(
        theme.tabBarTheme.unselectedLabelStyle,
      ),
      labelColor: color,
      indicatorColor: color,
    ),
    inputDecorationTheme: input.copyWith(
      labelStyle: style(input.labelStyle),
      floatingLabelStyle: style(input.floatingLabelStyle),
      helperStyle: style(input.helperStyle),
      hintStyle: style(input.hintStyle),
      errorStyle: styleKeepingColor(input.errorStyle),
      prefixStyle: style(input.prefixStyle),
      suffixStyle: style(input.suffixStyle),
      counterStyle: style(input.counterStyle),
    ),
    listTileTheme: theme.listTileTheme.copyWith(
      titleTextStyle: style(theme.listTileTheme.titleTextStyle),
      subtitleTextStyle: style(theme.listTileTheme.subtitleTextStyle),
      leadingAndTrailingTextStyle: styleKeepingColor(
        theme.listTileTheme.leadingAndTrailingTextStyle,
      ),
      textColor: color,
    ),
    chipTheme: theme.chipTheme.copyWith(
      labelStyle: style(theme.chipTheme.labelStyle),
    ),
    dialogTheme: theme.dialogTheme.copyWith(
      titleTextStyle: style(theme.dialogTheme.titleTextStyle),
      contentTextStyle: style(theme.dialogTheme.contentTextStyle),
    ),
    snackBarTheme: theme.snackBarTheme.copyWith(
      contentTextStyle: style(theme.snackBarTheme.contentTextStyle),
    ),
    tooltipTheme: theme.tooltipTheme.copyWith(
      textStyle: style(theme.tooltipTheme.textStyle),
    ),
    bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
      selectedLabelStyle: style(
        theme.bottomNavigationBarTheme.selectedLabelStyle,
      ),
      unselectedLabelStyle: styleKeepingColor(
        theme.bottomNavigationBarTheme.unselectedLabelStyle,
      ),
      selectedItemColor: color,
    ),
    navigationBarTheme: theme.navigationBarTheme.copyWith(
      labelTextStyle: stateStyle(theme.navigationBarTheme.labelTextStyle),
    ),
    navigationDrawerTheme: theme.navigationDrawerTheme.copyWith(
      labelTextStyle: stateStyle(theme.navigationDrawerTheme.labelTextStyle),
    ),
    navigationRailTheme: theme.navigationRailTheme.copyWith(
      selectedLabelTextStyle: style(
        theme.navigationRailTheme.selectedLabelTextStyle,
      ),
      unselectedLabelTextStyle: styleKeepingColor(
        theme.navigationRailTheme.unselectedLabelTextStyle,
      ),
    ),
    dataTableTheme: theme.dataTableTheme.copyWith(
      dataTextStyle: style(theme.dataTableTheme.dataTextStyle),
      headingTextStyle: style(theme.dataTableTheme.headingTextStyle),
    ),
    datePickerTheme: theme.datePickerTheme.copyWith(
      headerHelpStyle: style(theme.datePickerTheme.headerHelpStyle),
      headerHeadlineStyle: style(theme.datePickerTheme.headerHeadlineStyle),
      weekdayStyle: style(theme.datePickerTheme.weekdayStyle),
      dayStyle: style(theme.datePickerTheme.dayStyle),
      yearStyle: style(theme.datePickerTheme.yearStyle),
      rangePickerHeaderHeadlineStyle: style(
        theme.datePickerTheme.rangePickerHeaderHeadlineStyle,
      ),
      rangePickerHeaderHelpStyle: style(
        theme.datePickerTheme.rangePickerHeaderHelpStyle,
      ),
      cancelButtonStyle: button(theme.datePickerTheme.cancelButtonStyle),
      confirmButtonStyle: button(theme.datePickerTheme.confirmButtonStyle),
      dayForegroundColor: colorProperty,
      yearForegroundColor: colorProperty,
      todayForegroundColor: colorProperty,
      headerForegroundColor: color,
      rangePickerHeaderForegroundColor: color,
    ),
    timePickerTheme: theme.timePickerTheme.copyWith(
      dialTextStyle: style(theme.timePickerTheme.dialTextStyle),
      helpTextStyle: style(theme.timePickerTheme.helpTextStyle),
      dayPeriodTextStyle: style(theme.timePickerTheme.dayPeriodTextStyle),
      hourMinuteTextStyle: style(theme.timePickerTheme.hourMinuteTextStyle),
      timeSelectorSeparatorTextStyle: stateStyle(
        theme.timePickerTheme.timeSelectorSeparatorTextStyle,
      ),
      cancelButtonStyle: button(theme.timePickerTheme.cancelButtonStyle),
      confirmButtonStyle: button(theme.timePickerTheme.confirmButtonStyle),
      dialTextColor: color,
      dayPeriodTextColor: color,
      hourMinuteTextColor: color,
    ),
    cupertinoOverrideTheme: cupertino?.copyWith(
      textTheme: cupertino.textTheme?.copyWith(
        textStyle: style(cupertino.textTheme?.textStyle),
        actionTextStyle: style(cupertino.textTheme?.actionTextStyle),
        actionSmallTextStyle: style(cupertino.textTheme?.actionSmallTextStyle),
        tabLabelTextStyle: style(cupertino.textTheme?.tabLabelTextStyle),
        navTitleTextStyle: style(cupertino.textTheme?.navTitleTextStyle),
        navLargeTitleTextStyle: style(
          cupertino.textTheme?.navLargeTitleTextStyle,
        ),
        navActionTextStyle: style(cupertino.textTheme?.navActionTextStyle),
        pickerTextStyle: style(cupertino.textTheme?.pickerTextStyle),
        dateTimePickerTextStyle: style(
          cupertino.textTheme?.dateTimePickerTextStyle,
        ),
      ),
    ),
    badgeTheme: theme.badgeTheme.copyWith(
      textStyle: style(theme.badgeTheme.textStyle),
      textColor: color,
    ),
    bannerTheme: theme.bannerTheme.copyWith(
      contentTextStyle: style(theme.bannerTheme.contentTextStyle),
    ),
    dropdownMenuTheme: theme.dropdownMenuTheme.copyWith(
      textStyle: style(theme.dropdownMenuTheme.textStyle),
    ),
    floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
      extendedTextStyle: style(
        theme.floatingActionButtonTheme.extendedTextStyle,
      ),
      foregroundColor: color,
    ),
    expansionTileTheme: theme.expansionTileTheme.copyWith(
      collapsedTextColor: color,
      textColor: color,
    ),
    searchViewTheme: theme.searchViewTheme.copyWith(
      headerTextStyle: style(theme.searchViewTheme.headerTextStyle),
      headerHintStyle: style(theme.searchViewTheme.headerHintStyle),
    ),
    searchBarTheme: theme.searchBarTheme.copyWith(
      textStyle: stateStyle(theme.searchBarTheme.textStyle),
      hintStyle: stateStyle(theme.searchBarTheme.hintStyle),
    ),
    popupMenuTheme: theme.popupMenuTheme.copyWith(
      textStyle: style(theme.popupMenuTheme.textStyle),
      labelTextStyle: stateStyle(theme.popupMenuTheme.labelTextStyle),
    ),
  );
}
