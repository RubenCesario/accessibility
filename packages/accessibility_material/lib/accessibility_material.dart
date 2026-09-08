/// Material theme builder and settings panel of the accessibility package
/// family, built on `material_ui`.
///
/// Re-exports `package:flutter_accessibility` and
/// `AccessibilityLocalizations`.
library;

export 'package:accessibility_localizations/accessibility_localizations.dart'
    show AccessibilityLocalizations;
export 'package:flutter_accessibility/flutter_accessibility.dart';

export 'src/ui/settings/widgets/accessibility_settings_panel.dart'
    show AccessibilitySettingsPanel;
export 'src/ui/settings/widgets/components/restore_settings_button.dart'
    show RestoreSettingsButton;
export 'src/ui/text/widgets/read_more_text.dart' show ReadMoreText;
export 'src/ui/theme/accessible_page_transitions_theme.dart'
    show AccessiblePageTransitionsTheme;
export 'src/ui/theme/accessible_theme_builder.dart'
    show
        AccessibleThemeBuilder,
        AccessibleThemes,
        AccessibleThemesWidgetBuilder;
export 'src/ui/theme/accessible_theme_data.dart' show AccessibleThemeData;
