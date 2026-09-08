import 'package:accessibility/accessibility.dart';

/// The Andika font shipped by this package.
abstract final class AndikaFont {
  /// The font to register in the accessibility settings ViewModel.
  static const font = AccessibleFont(
    family: 'Andika',
    package: 'accessibility_font_andika',
  );
}
