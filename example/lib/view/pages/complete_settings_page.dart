import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// {@template CompleteSettingsPage}
/// A widget that is the complete settings page of your application.
/// {@endtemplate}
class CompleteSettingsPage extends StatelessWidget {
  /// {@macro CompleteSettingsPage}
  const CompleteSettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(color: context.colorScheme.onPrimary),
      title: AccessibleText(
        'Complete Settings',
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
      backgroundColor: context.colorScheme.primary,
    ),
    body: SafeArea(
      child: AccessibilitySettings(
        configuration: AccessibilitySettingsConfiguration.all
        // Example to add a callback after restoring the default settings
        .withOnRestoreSettingsCallback(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Settings restored to default values'),
            ),
          );
        }),
      ),
    ),
  );
}
