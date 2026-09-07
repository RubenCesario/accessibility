import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Signature of the [AccessibilitySettingsBuilder] builder.
typedef AccessibilitySettingsWidgetBuilder =
    Widget Function(
      BuildContext context,
      AccessibilitySettings settings,
      Widget? child,
    );

/// Rebuilds [builder] whenever the accessibility settings change.
///
/// [child] is passed through untouched, so a subtree that does not depend
/// on the settings is built once.
final class AccessibilitySettingsBuilder extends StatelessWidget {
  /// Creates a builder that reacts to settings changes.
  const AccessibilitySettingsBuilder({
    required this.builder,
    this.child,
    super.key,
  });

  /// Builds the subtree from the current settings.
  final AccessibilitySettingsWidgetBuilder builder;

  /// A settings-independent widget handed back to [builder].
  final Widget? child;

  @override
  Widget build(BuildContext context) =>
      builder(context, AccessibilityScope.settingsOf(context), child);
}
