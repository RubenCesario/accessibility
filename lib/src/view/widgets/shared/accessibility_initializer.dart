import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart';
import 'package:flutter/material.dart';

/// {@template flutter.widgets.AccessibilityInitializer}
/// This widget is the root of your application.
///
/// It is used to initialize the accessibility settings
/// of the application.
/// {@endtemplate}
final class AccessibilityInitializer extends StatelessWidget {
  /// {@macro flutter.widgets.AccessibilityInitializer}
  const AccessibilityInitializer({
    required this.child,
    required this.sharedPreferencesService,
    required this.accessibilitySettingsCollection,
    super.key,
  });

  /// The service used to store and retrieve accessibility settings
  /// in the local storage.
  final SharedPreferencesService sharedPreferencesService;

  /// The accessibility settings collection
  /// that will be provided to the child.
  final AccessibilitySettingsCollection accessibilitySettingsCollection;

  /// The child widget from which the accessibility
  /// settings will be provided.
  final Widget child;

  @override
  Widget build(BuildContext context) => SharedPreferencesInherited(
        sharedPreferencesService: sharedPreferencesService,
        child: AccessibilitySettingsInherited(
          viewModel: AccessibilitySettingsViewModel
              .fromAccessibilitySettingsCollection(
            accessibilitySettingsCollection: accessibilitySettingsCollection,
          ),
          child: child,
        ),
      );
}
