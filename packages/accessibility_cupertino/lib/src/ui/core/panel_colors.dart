import 'package:cupertino_ui/cupertino_ui.dart';

/// The colour of secondary text (subtitles, additional info) in the panel.
///
/// Cupertino's `secondaryLabel` is 60 % translucent and misses the 4.5:1
/// contrast the guidelines ask for on small text; this opaque pair keeps
/// the hierarchy and passes in both brightnesses.
const CupertinoDynamicColor kPanelSecondaryTextColor =
    CupertinoDynamicColor.withBrightness(
      debugLabel: 'panelSecondaryText',
      color: Color(0xFF636366),
      darkColor: Color(0xFFAEAEB2),
    );

/// The fill colour of `CupertinoRestoreSettingsButton`.
///
/// The theme's default `primaryColor` (`CupertinoColors.systemBlue`) only
/// reaches a 4.0:1 contrast against the button's white text, short of the
/// 4.5:1 the guidelines ask for on 17 px text; this darker blue passes with
/// the same hue. The button's text is always white, so one flat colour
/// (not a [CupertinoDynamicColor]) covers both brightnesses.
const Color kPanelAccentColor = Color(0xFF0060DF);

/// The colour of `CupertinoReadMoreText`'s toggle (text and icon), drawn
/// over the page's own background rather than a fill of its own.
///
/// The theme's default `primaryColor` only reaches a 4.0:1 contrast in
/// light mode (systemBlue on white) and a 3.6:1 contrast in dark mode
/// (systemBlue's dark variant on black), both short of the 4.5:1 the
/// guidelines ask for; unlike the fill above, a foreground colour must
/// invert with brightness to stay readable, so this is a dynamic pair.
const CupertinoDynamicColor kPanelAccentTextColor =
    CupertinoDynamicColor.withBrightness(
      debugLabel: 'panelAccentText',
      color: Color(0xFF0060DF),
      darkColor: Color(0xFF409CFF),
    );
