import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The icon of a colour profile.
IconData colorProfileIcon(ColorProfileLevel level) => switch (level) {
  ColorProfileLevel.normal => CupertinoIcons.paintbrush,
  ColorProfileLevel.lowSaturation => CupertinoIcons.circle,
  ColorProfileLevel.highSaturation => CupertinoIcons.circle_fill,
  ColorProfileLevel.monochrome => CupertinoIcons.circle_lefthalf_fill,
  ColorProfileLevel.highContrast => CupertinoIcons.sun_max,
};
