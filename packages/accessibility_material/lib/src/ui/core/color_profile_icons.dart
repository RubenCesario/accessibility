import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The icon of a colour profile, as in 1.x.
IconData colorProfileIcon(ColorProfileLevel level) => switch (level) {
  ColorProfileLevel.normal => Icons.brightness_medium,
  ColorProfileLevel.lowSaturation => Icons.brightness_low,
  ColorProfileLevel.highSaturation => Icons.brightness_high,
  ColorProfileLevel.monochrome => Icons.brightness_1_outlined,
  ColorProfileLevel.highContrast => Icons.brightness_1,
};
