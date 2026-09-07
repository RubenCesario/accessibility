import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Signature of the [EffectsBuilder] builder.
typedef EffectsWidgetBuilder =
    Widget Function(
      BuildContext context, {
      required bool effectsEnabled,
      Widget? child,
    });

/// Rebuilds [builder] with whether effects and animations are enabled.
///
/// Resolves the effects mode against the OS reduce-motion signal, so a
/// change in the system settings rebuilds the subtree as well.
final class EffectsBuilder extends StatelessWidget {
  /// Creates a builder that reacts to the effects setting.
  const EffectsBuilder({required this.builder, this.child, super.key});

  /// Builds the subtree from the resolved effects flag.
  final EffectsWidgetBuilder builder;

  /// An effects-independent widget handed back to [builder].
  final Widget? child;

  @override
  Widget build(BuildContext context) => builder(
    context,
    effectsEnabled: AccessibilityScope.effectsEnabledOf(context),
    child: child,
  );
}
