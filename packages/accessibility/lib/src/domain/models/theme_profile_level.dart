/// A preset of text, colour and effects settings.
enum ThemeProfileLevel {
  /// The default settings.
  none,

  /// No effects and low saturation, for users prone to seizures.
  seizureSafe,

  /// Bold, doubled text and high saturation, for low-vision users.
  visionImpaired,

  /// Slightly larger text, no effects and high saturation, for users with
  /// attention disorders.
  adhdFriendly,
}
