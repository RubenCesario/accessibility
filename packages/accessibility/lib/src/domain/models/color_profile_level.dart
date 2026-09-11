/// The colour transformation applied to the whole theme.
enum ColorProfileLevel {
  /// No transformation.
  normal,

  /// Halve the saturation.
  lowSaturation,

  /// Double the saturation.
  highSaturation,

  /// Remove all saturation.
  monochrome,

  /// Push lightness towards the extremes.
  highContrast,
}
