import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/effects_setting_listenable_builder.dart';
import 'package:flutter/material.dart';

/// {@template ThemeSettingsBuilder}
/// This widget is used to provide the theme configuration
/// of the application.
///
/// It is used to provide the theme configuration
/// of the application.
/// {@endtemplate}
final class ThemeSettingsBuilder extends StatefulWidget {
  /// The builder that provides the theme configuration
  /// of the application to the child.
  final Widget Function(
    BuildContext,
    ThemeMode,
    ColorSettings,
    TextSettings, {
    required bool effectsEnabled,
  }) builder;

  /// {@macro ThemeSettingsBuilder}
  const ThemeSettingsBuilder({
    required this.builder,
    super.key,
  });

  @override
  State<ThemeSettingsBuilder> createState() => _ThemeSettingsBuilderState();
}

class _ThemeSettingsBuilderState extends State<ThemeSettingsBuilder> {
  late AccessibilitySettingsInherited _settingsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
        valueListenable: _settingsInherited.themeMode,
        builder: (_, themeMode, __) => ValueListenableBuilder<ColorSettings>(
          valueListenable: _settingsInherited.colorSettings,
          builder: (_, colorSettings, __) => EffectsSettingListenableBuilder(
            builder: (_, effectsEnabled, __) =>
                ValueListenableBuilder<TextSettings>(
              valueListenable: _settingsInherited.textSettings,
              builder: (_, textSettings, __) => widget.builder(
                context,
                themeMode,
                colorSettings,
                textSettings,
                effectsEnabled: effectsEnabled,
              ),
            ),
          ),
        ),
      );
}
