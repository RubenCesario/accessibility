import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/theme_profile_icons.dart';
import 'package:accessibility_material/src/ui/core/theme_profile_strings.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A theme profile as a card (cards style); the `none` card restores the
/// default profile.
final class ThemeProfileCard extends StatelessWidget {
  /// Creates the card for [level].
  const ThemeProfileCard({required this.level, super.key});

  /// The profile this card applies.
  final ThemeProfileLevel level;

  @override
  Widget build(BuildContext context) {
    final active = AccessibilityScope.settingsOf(context).matchingThemeProfile;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemCard(
      title: themeProfileStrings(context.l10n, level).title,
      icon: themeProfileIcon(level),
      isHighlighted: active == level,
      onTap: () => viewModel.applyThemeProfile(level),
    );
  }
}
