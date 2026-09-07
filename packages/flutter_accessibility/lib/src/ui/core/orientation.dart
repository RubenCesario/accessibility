import 'package:flutter/widgets.dart';

/// The orientation derived from the media query size: landscape when the
/// width exceeds the height, portrait otherwise.
///
/// Unlike `MediaQuery.orientationOf`, this follows the actual window shape,
/// which matters on foldables and desktop windows.
Orientation orientationOf(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  return size.width > size.height
      ? Orientation.landscape
      : Orientation.portrait;
}
