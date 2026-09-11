import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The icon of a theme profile.
IconData themeProfileIcon(ThemeProfileLevel level) => switch (level) {
  ThemeProfileLevel.none => CupertinoIcons.arrow_counterclockwise,
  ThemeProfileLevel.seizureSafe => CupertinoIcons.bolt_slash,
  ThemeProfileLevel.visionImpaired => CupertinoIcons.eye,
  ThemeProfileLevel.adhdFriendly => CupertinoIcons.sparkles,
};
