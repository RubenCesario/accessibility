import 'package:meta/meta.dart';

/// A font family the app offers as an accessible alternative.
@immutable
final class AccessibleFont {
  /// Creates a font description.
  ///
  /// [package] is the pub package that bundles the font files, or `null`
  /// when the app bundles them itself.
  const AccessibleFont({required this.family, this.package});

  /// The font family name declared in the bundling pubspec.
  final String family;

  /// The pub package that bundles the font, if any.
  final String? package;

  /// The family name as Flutter expects it in a text style:
  /// `packages/<package>/<family>` when [package] is set, else [family].
  String get qualifiedFamily =>
      package == null ? family : 'packages/$package/$family';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessibleFont &&
          other.family == family &&
          other.package == package;

  @override
  int get hashCode => Object.hash(family, package);

  @override
  String toString() => 'AccessibleFont(family: $family, package: $package)';
}
