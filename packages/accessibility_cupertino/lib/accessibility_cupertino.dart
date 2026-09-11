/// Cupertino theme builder, routes and settings panel of the accessibility
/// package family, built on `cupertino_ui`.
///
/// Re-exports `package:flutter_accessibility` and
/// `AccessibilityLocalizations`.
library;

export 'package:accessibility_localizations/accessibility_localizations.dart'
    show AccessibilityLocalizations;
export 'package:flutter_accessibility/flutter_accessibility.dart';

export 'src/ui/routes/accessible_cupertino_page.dart'
    show AccessibleCupertinoPage;
export 'src/ui/routes/accessible_cupertino_page_route.dart'
    show AccessibleCupertinoPageRoute;
export 'src/ui/settings/widgets/components/cupertino_restore_settings_button.dart'
    show CupertinoRestoreSettingsButton;
export 'src/ui/settings/widgets/cupertino_accessibility_settings_panel.dart'
    show CupertinoAccessibilitySettingsPanel;
export 'src/ui/text/widgets/cupertino_read_more_text.dart'
    show CupertinoReadMoreText;
export 'src/ui/theme/accessible_cupertino_theme_builder.dart'
    show AccessibleCupertinoThemeBuilder, AccessibleCupertinoThemeWidgetBuilder;
export 'src/ui/theme/accessible_cupertino_theme_data.dart'
    show AccessibleCupertinoThemeData;
