import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/core/utils/accessible_height.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:flutter/material.dart';

/// Displays a [SizedBox] with an height that depends
/// on the accessibility settings.
final class AccessibleSizedBox extends StatefulWidget {
  /// Creates an [AccessibleSizedBox] Widget with an height
  /// that depends on the accessibility settings.
  const AccessibleSizedBox.fromHeight({
    required this.height,
    this.heightInLandscape,
    this.child,
    this.width,
    double? extraHeightPortraitMultiplier,
    double? extraHeightLandscapeMultiplier,
    super.key,
  })  : extraHeightPortraitMultiplier = extraHeightPortraitMultiplier ?? 1,
        extraHeightLandscapeMultiplier = extraHeightLandscapeMultiplier ?? 1;

  /// The child to show.
  final Widget? child;

  /// The width of the [SizedBox].
  final double? width;

  /// The height of the [SizedBox] before
  /// computing the accessible settings modifier.
  final double height;

  /// The height of the [SizedBox] in landscape mode.
  /// If null, [height] is used instead.
  final double? heightInLandscape;

  /// The extra multiplier for the portrait height layout.
  final double extraHeightPortraitMultiplier;

  /// The extra multiplier for the landscape height layout.
  final double extraHeightLandscapeMultiplier;

  @override
  State<AccessibleSizedBox> createState() => _AccessibleSizedBoxState();
}

class _AccessibleSizedBoxState extends State<AccessibleSizedBox> {
  late AccessibilitySettingsInherited _settingsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: _settingsInherited.textSettings,
        builder: (_, ___) => SizedBox(
          width: widget.width,
          height: (widget.heightInLandscape != null &&
                      context.orientation == Orientation.landscape
                  ? widget.heightInLandscape!
                  : widget.height)
              .makeHeightAccessible(
            context,
            extraPortraitMultiplier: widget.extraHeightPortraitMultiplier,
            extraLandscapeMultiplier: widget.extraHeightLandscapeMultiplier,
          ),
          child: widget.child,
        ),
      );
}
