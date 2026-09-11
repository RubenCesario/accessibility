import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// Shorthand for the package's localised strings.
extension PanelLocalizations on BuildContext {
  /// The translations above this context.
  AccessibilityLocalizations get l10n => AccessibilityLocalizations.of(this);
}
