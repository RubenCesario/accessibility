import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Provides the panel's configuration and style to its items.
final class PanelScope extends InheritedWidget {
  /// Creates the scope.
  const PanelScope({
    required this.configuration,
    required this.style,
    required super.child,
    super.key,
  });

  /// Which settings the panel shows and the colours it offers.
  final AccessibilitySettingsConfiguration configuration;

  /// The visual style of the panel.
  final AccessibilitySettingsStyle style;

  /// The scope above [context]; asserts when there is none.
  static PanelScope of(BuildContext context) {
    final scope = maybeOf(context);
    assert(
      scope != null,
      'No CupertinoAccessibilitySettingsPanel above this widget',
    );
    return scope!;
  }

  /// The scope above [context], or `null` outside a panel.
  static PanelScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PanelScope>();

  @override
  bool updateShouldNotify(PanelScope oldWidget) =>
      configuration != oldWidget.configuration || style != oldWidget.style;
}
