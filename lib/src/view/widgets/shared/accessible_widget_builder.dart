import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:flutter/material.dart';

/// {@template AccessibleWidgetBuilder}
/// A widget builder that displays a child based on the accessibility settings.
///
/// If the accessibility settings are enabled, the [accessibleChild] will be
/// displayed instead of the [child].
/// {@endtemplate}
final class AccessibleWidgetBuilder extends StatelessWidget {
  /// The child to show if none accessible settings are enabled.
  final Widget child;

  /// The child to show if accessible settings are enabled.
  final Widget? accessibleChild;

  /// Whether the [accessibleChild] should only be shown
  /// on landscape.
  final bool showAccessibleChildOnlyOnLandscape;

  /// {@macro AccessibleWidgetBuilder}
  const AccessibleWidgetBuilder({
    required this.child,
    this.accessibleChild,
    this.showAccessibleChildOnlyOnLandscape = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable:
            AccessibilitySettingsInherited.of(context).textSettings,
        builder: (_, textSettings, __) =>
            textSettings == TextSettings.defaultSettings
                ? child
                : showAccessibleChildOnlyOnLandscape &&
                        context.orientation == Orientation.portrait
                    ? child
                    : accessibleChild ?? child,
      );
}
