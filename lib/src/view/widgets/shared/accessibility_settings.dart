import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/models/config/accessibility_settings_style.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/accessibility_settings_group.dart';
import 'package:flutter/material.dart';

/// {@template AccessibilitySettings}
/// A list of accessibility settings items.
///
/// The list can be configured to show or hide
/// specific settings items.
///
/// {@endtemplate}
final class AccessibilitySettings extends StatelessWidget {
  /// {@macro AccessibilitySettings}
  ///
  /// Defaults to [AccessibilitySettingsConfiguration.recommended].
  const AccessibilitySettings({
    this.configuration = AccessibilitySettingsConfiguration.recommended,
    this.style = AccessibilitySettingsStyle.standard,
    super.key,
  });

  /// The configuration of the accessibility settings.
  final AccessibilitySettingsConfiguration configuration;

  /// The visual style used to render the settings panel.
  ///
  /// Defaults to [AccessibilitySettingsStyle.standard]. Both styles share the
  /// same state and configuration.
  final AccessibilitySettingsStyle style;

  @override
  Widget build(BuildContext context) =>
      AccessibilitySettingsConfigurationInherited(
        configuration: configuration,
        style: style,
        child: const AccessibilitySettingsGroup(),
      );
}
