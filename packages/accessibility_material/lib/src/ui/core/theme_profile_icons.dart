import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The icon of a theme profile, as in 1.x.
IconData themeProfileIcon(ThemeProfileLevel level) => switch (level) {
  ThemeProfileLevel.none => Icons.restart_alt,
  ThemeProfileLevel.seizureSafe => Icons.flash_off,
  ThemeProfileLevel.visionImpaired => Icons.visibility,
  ThemeProfileLevel.adhdFriendly => Icons.center_focus_strong,
};
