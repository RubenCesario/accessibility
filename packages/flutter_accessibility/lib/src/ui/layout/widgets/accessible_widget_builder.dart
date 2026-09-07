import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/orientation.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Shows [accessibleChild] instead of [child] when text settings are active.
final class AccessibleWidgetBuilder extends StatelessWidget {
  /// Creates the builder.
  const AccessibleWidgetBuilder({
    required this.child,
    this.accessibleChild,
    this.showAccessibleChildOnlyOnLandscape = false,
    super.key,
  });

  /// The widget shown when the text settings are the defaults.
  final Widget child;

  /// The widget shown when any text setting is active; `null` shows [child].
  final Widget? accessibleChild;

  /// Whether [accessibleChild] is shown only in landscape.
  final bool showAccessibleChildOnlyOnLandscape;

  @override
  Widget build(BuildContext context) {
    final textSettings = AccessibilityScope.settingsOf(context).textSettings;
    if (textSettings.isDefault) {
      return child;
    }
    if (showAccessibleChildOnlyOnLandscape &&
        orientationOf(context) == Orientation.portrait) {
      return child;
    }
    return accessibleChild ?? child;
  }
}
