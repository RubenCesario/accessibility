import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Weight of the text scale factor in the height computation.
const _textScaleFactorWeight = 0.9;

/// Weight of the line height in the height computation.
const _lineHeightWeight = 0.1;

/// Height computations that follow the accessibility text settings.
extension AccessibleHeight on double {
  /// Returns this height adjusted for the text scale factor and line height.
  ///
  /// The multipliers grow with the scale factor above 1 and the line height
  /// above 1.5. When either applies, the height is also multiplied by
  /// [extraPortraitMultiplier] or [extraLandscapeMultiplier] depending on the
  /// window shape, for widgets whose fixed height must leave extra room.
  /// Registers a dependency on the settings and the media query.
  double makeHeightAccessible(
    BuildContext context, {
    double extraPortraitMultiplier = 1,
    double extraLandscapeMultiplier = 1,
  }) {
    assert(
      extraPortraitMultiplier > 0 && extraLandscapeMultiplier > 0,
      'All extra multipliers must be greater than 0',
    );
    final textSettings = AccessibilityScope.settingsOf(context).textSettings;
    final textScaleFactor = textSettings.textScaleFactor;
    final lineHeight = textSettings.lineHeight;
    final size = MediaQuery.sizeOf(context);
    final textScaleMultiplier = textScaleFactor <= 1
        ? 1.0
        : textScaleFactor - (1 - _textScaleFactorWeight);
    final lineHeightMultiplier = lineHeight == null || lineHeight <= 1.5
        ? 1.0
        : lineHeight - (1 - _lineHeightWeight);
    final extraMultiplier =
        textScaleMultiplier == 1 && lineHeightMultiplier == 1
        ? 1.0
        : size.height > size.width
        ? extraPortraitMultiplier
        : extraLandscapeMultiplier;
    return this * textScaleMultiplier * lineHeightMultiplier * extraMultiplier;
  }
}
