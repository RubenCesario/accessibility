import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The title, subtitle and description of a theme profile.
typedef ThemeProfileStrings = ({
  String title,
  String subtitle,
  String description,
});

/// The localised strings of [level]; the `none` level has only a title.
ThemeProfileStrings themeProfileStrings(
  AccessibilityLocalizations l10n,
  ThemeProfileLevel level,
) => switch (level) {
  ThemeProfileLevel.none => (
    title: l10n.themeProfile(level.name),
    subtitle: '',
    description: '',
  ),
  ThemeProfileLevel.seizureSafe => (
    title: l10n.themeProfileSeizureSafeTitle,
    subtitle: l10n.themeProfileSeizureSafeSubtitle,
    description: l10n.themeProfileSeizureSafeDescription,
  ),
  ThemeProfileLevel.visionImpaired => (
    title: l10n.themeProfileVisionImpairedTitle,
    subtitle: l10n.themeProfileVisionImpairedSubtitle,
    description: l10n.themeProfileVisionImpairedDescription,
  ),
  ThemeProfileLevel.adhdFriendly => (
    title: l10n.themeProfileAdhdFriendlyTitle,
    subtitle: l10n.themeProfileAdhdFriendlySubtitle,
    description: l10n.themeProfileAdhdFriendlyDescription,
  ),
};
