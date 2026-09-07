import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/orientation.dart';
import 'package:flutter_accessibility/src/ui/layout/accessible_height.dart';

/// A [SizedBox] whose height follows the accessibility text settings.
final class AccessibleSizedBox extends StatelessWidget {
  /// Creates a box of [height] (or [heightInLandscape] in landscape) that
  /// grows with the text settings, see [AccessibleHeight].
  const AccessibleSizedBox.fromHeight({
    required this.height,
    this.heightInLandscape,
    this.child,
    this.width,
    double? extraHeightPortraitMultiplier,
    double? extraHeightLandscapeMultiplier,
    super.key,
  }) : extraHeightPortraitMultiplier = extraHeightPortraitMultiplier ?? 1,
       extraHeightLandscapeMultiplier = extraHeightLandscapeMultiplier ?? 1;

  /// The child of the box.
  final Widget? child;

  /// The width of the box.
  final double? width;

  /// The height before the accessibility adjustment.
  final double height;

  /// The height used in landscape, or `null` to use [height].
  final double? heightInLandscape;

  /// The extra multiplier applied in portrait when settings are active.
  final double extraHeightPortraitMultiplier;

  /// The extra multiplier applied in landscape when settings are active.
  final double extraHeightLandscapeMultiplier;

  @override
  Widget build(BuildContext context) {
    final landscapeHeight = heightInLandscape;
    final baseHeight =
        landscapeHeight != null &&
            orientationOf(context) == Orientation.landscape
        ? landscapeHeight
        : height;
    return SizedBox(
      width: width,
      height: baseHeight.makeHeightAccessible(
        context,
        extraPortraitMultiplier: extraHeightPortraitMultiplier,
        extraLandscapeMultiplier: extraHeightLandscapeMultiplier,
      ),
      child: child,
    );
  }
}
