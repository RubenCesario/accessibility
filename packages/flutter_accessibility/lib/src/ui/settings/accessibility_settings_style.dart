/// The visual style of the accessibility settings panels.
///
/// Both styles share the same state and configuration; only the
/// presentation differs.
enum AccessibilitySettingsStyle {
  /// List tiles, switches and sliders.
  standard,

  /// Tappable cards with explicit state and stepper cards for ranges.
  cards,
}
