/// The visual style used to render the accessibility settings panel.
///
/// Both styles share the exact same state and configuration; only the
/// presentation differs. They are fully accessible.
enum AccessibilitySettingsStyle {
  /// The default style: list tiles, switches and sliders.
  standard,

  /// A modern, tile/card based style: tappable cards with explicit state,
  /// a single theme-profile selector and stepper cards for ranges.
  cards,
}
