import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// {@template RecommendedSettingsPage}
/// A widget that is the recommended settings page of your application.
/// {@endtemplate}
class RecommendedSettingsPage extends StatelessWidget {
  /// {@macro RecommendedSettingsPage}
  const RecommendedSettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(color: context.colorScheme.onPrimary),
      title: AccessibleText(
        'Recommended Settings',
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
      backgroundColor: context.colorScheme.primary,
    ),
    body: const SafeArea(child: AccessibilitySettings()),
  );
}
