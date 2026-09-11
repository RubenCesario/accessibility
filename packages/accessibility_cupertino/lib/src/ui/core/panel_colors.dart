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
