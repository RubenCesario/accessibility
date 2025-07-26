import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_sized_box.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart' show AppBar;
import 'package:flutter/widgets.dart' show BuildContext, MediaQuery;

/// The weight of the text scale factor used
/// to compute the new height.
const _kTextScaleFactorWeight = 0.9;

/// The weight of the line height used
/// to compute the new height.
const _kLineHeightWeight = 0.1;

/// An extension to make accessible height calculations.
extension AccessibleHeight on double {
  /// Compute a new height based on the accessible settings
  /// and the current device used.
  ///
  /// You can safely use this method if the Widget height depends
  /// only on [AccessibleText]s, otherwise consider using
  /// [AccessibleSizedBox.fromHeight].
  ///
  /// This method is useful for situations where the height
  /// of an element is fixed (e.g. an [AppBar]) and should
  /// be adjusted independently of the device used.
  ///
  /// The new height is computed by using the text scale factor and
  /// the current device height. Still, this may not be enough to
  /// show all the content of the Widget.
  /// In that case you have to provide an extraMultiplier.
  /// The extraMultipliers are applied only is some of the accessibility
  /// settings are enabled.
  double makeHeightAccessible(
    BuildContext context, {
    double extraPortraitMultiplier = 1,
    double extraLandscapeMultiplier = 1,
  }) {
    assert(
      extraPortraitMultiplier > 0 && extraLandscapeMultiplier > 0,
      'All extraMultipliers must be greater than 0',
    );
    assert(
      _kTextScaleFactorWeight + _kLineHeightWeight <= 1,
      'The max weight of the sum of accessibility elements must not be above 1',
    );
    final textSettings =
        AccessibilitySettingsInherited.of(context).textSettings.value;
    final textScaleFactor = textSettings.textScaleFactor;
    final lineHeight = textSettings.lineHeight;
    final currentDeviceHeight = MediaQuery.sizeOf(context).height;
    final currentDeviceWidth = MediaQuery.sizeOf(context).width;
    final textScaleMultiplier = textScaleFactor <= 1
        ? 1
        : textScaleFactor - (1 - _kTextScaleFactorWeight);
    final lineHeightMultiplier =
        lineHeight <= 1.5 ? 1 : lineHeight - (1 - _kLineHeightWeight);
    final currentExtraMultiplier =
        (textScaleMultiplier == 1 && lineHeightMultiplier == 1)
            ? 1
            : currentDeviceHeight > currentDeviceWidth
                ? extraPortraitMultiplier
                : extraLandscapeMultiplier;

    return this *
        textScaleMultiplier *
        lineHeightMultiplier *
        currentExtraMultiplier;
  }
}
