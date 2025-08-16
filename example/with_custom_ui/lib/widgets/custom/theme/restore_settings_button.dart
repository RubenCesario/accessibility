import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that restores all accessibility settings to their defaults.
class CustomRestoreSettingsButton extends StatelessWidget {
  /// Creates a [CustomRestoreSettingsButton].
  const CustomRestoreSettingsButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    style: const ButtonStyle(
      textStyle: WidgetStatePropertyAll<TextStyle?>(null),
    ),
    icon: const Icon(Icons.restore),
    label: const Text('Restore default settings'),
    onPressed: () async {
      AccessibilitySettingsInherited.of(context).restoreDefaultSettings();
      await SharedPreferencesInherited.of(context).restoreDefaultSettings();
    },
  );
}
