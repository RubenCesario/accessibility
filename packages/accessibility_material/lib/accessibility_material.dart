/// Material theme builder and settings panel of the accessibility package
/// family, built on `material_ui`.
///
/// Re-exports `package:flutter_accessibility` and
/// `AccessibilityLocalizations`.
library;

export 'package:accessibility_localizations/accessibility_localizations.dart'
    show AccessibilityLocalizations;
export 'package:flutter_accessibility/flutter_accessibility.dart';

export 'src/ui/theme/accessible_page_transitions_theme.dart'
    show AccessiblePageTransitionsTheme;
export 'src/ui/theme/accessible_theme_data.dart' show AccessibleThemeData;
