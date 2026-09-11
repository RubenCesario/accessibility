import 'package:cupertino_ui/cupertino_ui.dart';

/// The colour of secondary text (subtitles, additional info) in the panel.
///
/// Cupertino's `secondaryLabel` is 60 % translucent and misses the 4.5:1
/// contrast the guidelines ask for on small text; this opaque pair keeps
/// the hierarchy and passes in both brightnesses.
///
/// Resolve it with [panelSecondaryTextColor] before handing it to a
/// `TextStyle`: `Text` paints an unresolved [CupertinoDynamicColor]'s
/// `color` slot whatever the brightness.
const CupertinoDynamicColor kPanelSecondaryTextColor =
    CupertinoDynamicColor.withBrightness(
      debugLabel: 'panelSecondaryText',
      color: Color(0xFF636366),
      darkColor: Color(0xFFAEAEB2),
    );

/// [kPanelSecondaryTextColor] resolved against [context].
Color panelSecondaryTextColor(BuildContext context) =>
    CupertinoDynamicColor.resolve(kPanelSecondaryTextColor, context);

/// The panel's accent, resolved against [context].
///
/// Used for the restore button's fill, the read-more toggle, the retry
/// button and the check marks. It is the theme's own `primaryColor`, so it
/// follows the colour profile (`AccessibleCupertinoThemeData` adjusts every
/// variant of it), promoted to its high-contrast variants: the plain
/// `systemBlue` reaches only 4.0:1 against white in light mode and 3.6:1
/// against black in dark mode, short of the 4.5:1 the guidelines ask for,
/// while the high-contrast variants (#0040DD and #409CFF for the default
/// theme) pass in both.
///
/// The raw theme data is read through [InheritedCupertinoTheme] because
/// `CupertinoTheme.of` already resolves, which would collapse the eight
/// slots to one colour before they can be swapped. Depending on it keeps
/// the caller rebuilding when the theme changes. A `primaryColor` that is
/// a plain [Color] carries no variants and is returned as is.
Color panelAccentColor(BuildContext context) {
  final primary =
      context
          .dependOnInheritedWidgetOfExactType<InheritedCupertinoTheme>()
          ?.theme
          .data
          .primaryColor ??
      const CupertinoThemeData().primaryColor;
  if (primary is! CupertinoDynamicColor) {
    return primary;
  }
  return CupertinoDynamicColor(
    color: primary.highContrastColor,
    darkColor: primary.darkHighContrastColor,
    highContrastColor: primary.highContrastColor,
    darkHighContrastColor: primary.darkHighContrastColor,
    elevatedColor: primary.highContrastElevatedColor,
    darkElevatedColor: primary.darkHighContrastElevatedColor,
    highContrastElevatedColor: primary.highContrastElevatedColor,
    darkHighContrastElevatedColor: primary.darkHighContrastElevatedColor,
  ).resolveFrom(context);
}
