import 'package:accessibility_cupertino/src/ui/theme/accessible_cupertino_theme_data.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Builds the app from the [CupertinoThemeData] of the current settings.
typedef AccessibleCupertinoThemeWidgetBuilder =
    Widget Function(BuildContext context, CupertinoThemeData theme);

/// Applies the accessibility settings to the app's theme.
///
/// Place it under an [AccessibilityScope] and above `CupertinoApp`; the
/// [builder] receives the theme with the settings applied and passes it
/// on. It rebuilds whenever the settings change, and applies the
/// high-contrast colour profile when the OS asks for more contrast: from
/// the media query when there is one above, otherwise from the platform's
/// accessibility features, which it observes.
final class AccessibleCupertinoThemeBuilder extends StatefulWidget {
  /// Creates the builder over [theme], `CupertinoThemeData()` by default.
  const AccessibleCupertinoThemeBuilder({
    required this.builder,
    this.theme,
    super.key,
  });

  /// Builds the app from the theme.
  final AccessibleCupertinoThemeWidgetBuilder builder;

  /// The app's theme, before the settings.
  final CupertinoThemeData? theme;

  @override
  State<AccessibleCupertinoThemeBuilder> createState() =>
      _AccessibleCupertinoThemeBuilderState();
}

class _AccessibleCupertinoThemeBuilderState
    extends State<AccessibleCupertinoThemeBuilder>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAccessibilityFeatures() => setState(() {});

  bool _highContrastOf(BuildContext context) =>
      MediaQuery.maybeHighContrastOf(context) ??
      View.of(context).platformDispatcher.accessibilityFeatures.highContrast;

  @override
  Widget build(BuildContext context) => widget.builder(
    context,
    AccessibleCupertinoThemeData.from(
      themeData: widget.theme ?? const CupertinoThemeData(),
      settings: AccessibilityScope.settingsOf(context),
      font: AccessibilityScope.of(context).activeFont,
      highContrast: _highContrastOf(context),
    ),
  );
}
