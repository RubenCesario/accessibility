import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';

/// Maps the core alignment setting to Flutter's [TextAlign].
extension TextAlignModeMapping on TextAlignMode {
  /// The [TextAlign] for this mode, or `null` for [TextAlignMode.none].
  TextAlign? toTextAlign() => switch (this) {
    TextAlignMode.none => null,
    TextAlignMode.start => TextAlign.start,
    TextAlignMode.end => TextAlign.end,
    TextAlignMode.left => TextAlign.left,
    TextAlignMode.right => TextAlign.right,
    TextAlignMode.center => TextAlign.center,
    TextAlignMode.justify => TextAlign.justify,
  };
}
