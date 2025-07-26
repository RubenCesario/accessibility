import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:flutter/material.dart';

/// {@template AccessibilitySettingsConfigurationInherited}
/// A provider of the accessibility settings configuration of the application.
///
/// It is used to provide the current accessibility settings
/// configuration of the application to its children.
/// {@endtemplate}
@immutable
final class AccessibilitySettingsConfigurationInherited
    extends InheritedWidget {
  /// {@macro AccessibilitySettingsConfigurationInherited}
  const AccessibilitySettingsConfigurationInherited({
    required super.child,
    required AccessibilitySettingsConfiguration configuration,
    super.key,
  }) : _configuration = configuration;

  final AccessibilitySettingsConfiguration _configuration;

  /// The configuration of the provider that manages
  /// all the accessibility settings configuration of the application.
  AccessibilitySettingsConfiguration get configuration => _configuration;

  /// Returns the closest [AccessibilitySettingsConfigurationInherited]
  /// instance that encloses the given context.
  static AccessibilitySettingsConfigurationInherited of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<
        AccessibilitySettingsConfigurationInherited>();
    assert(
      result != null,
      'No AccessibilitySettingsConfigurationInherited found in context',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(
    covariant AccessibilitySettingsConfigurationInherited oldWidget,
  ) =>
      _configuration != oldWidget._configuration;
}
