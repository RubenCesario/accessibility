import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:flutter/material.dart';

/// {@template EffectsSettingListenableBuilder}
/// A [ValueListenableBuilder] that listens to the effects allowed
///  setting changes.
/// {@endtemplate}
class EffectsSettingListenableBuilder extends StatefulWidget {
  /// A [ValueWidgetBuilder] which builds a widget depending on the
  /// effects mode setting changes.
  final ValueWidgetBuilder<bool> builder;

  /// A valueListenable-independent widget which is passed
  /// back to the [builder].
  ///
  /// This argument is optional and can be null if the entire widget subtree the
  /// [builder] builds depends on the value of the valueListenable. For
  /// example, in the case where the valueListenable is a [String] and the
  /// [builder] returns a [Text] widget with the current [String] value, there
  /// would be no useful [child].
  final Widget? child;

  /// {@macro EffectsSettingListenableBuilder}
  ///
  /// The value parameter of the [builder] is the current value of the
  /// [AccessibilitySettingsInherited.effectsAllowed] value and
  /// indicates whether the effects mode is enabled or disabled.
  ///
  /// Effects mode enabled (a **true** value) means that the subtree
  /// can use complex UI elements & animations.
  const EffectsSettingListenableBuilder({
    required this.builder,
    this.child,
    super.key,
  });

  @override
  State<EffectsSettingListenableBuilder> createState() =>
      _EffectsSettingListenableBuilderState();
}

class _EffectsSettingListenableBuilderState
    extends State<EffectsSettingListenableBuilder> {
  late AccessibilitySettingsInherited _settingsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _settingsInherited.effectsAllowed,
        builder: (context, effectsAllowed, child) => widget.builder(
          context,
          effectsAllowed,
          child,
        ),
        child: widget.child,
      );
}
