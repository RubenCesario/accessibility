import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// {@template CompleteSettingsPage}
/// A widget that is the complete settings page of your application.
/// {@endtemplate}
class CompleteSettingsPage extends StatefulWidget {
  /// {@macro CompleteSettingsPage}
  const CompleteSettingsPage({super.key});

  @override
  State<CompleteSettingsPage> createState() => _CompleteSettingsPageState();
}

class _CompleteSettingsPageState extends State<CompleteSettingsPage> {
  // Demo-only: lets you preview both UI styles side by side.
  // A real app picks ONE style and passes it once.
  AccessibilitySettingsStyle _style = AccessibilitySettingsStyle.standard;

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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SegmentedButton<AccessibilitySettingsStyle>(
            // The switcher sits on the primary-coloured AppBar, so use the
            // onPrimary/primary pair to keep the labels readable (WCAG 1.4.3).
            style: SegmentedButton.styleFrom(
              foregroundColor: context.colorScheme.onPrimary,
              selectedForegroundColor: context.colorScheme.primary,
              selectedBackgroundColor: context.colorScheme.onPrimary,
            ),
            segments: const [
              ButtonSegment(
                value: AccessibilitySettingsStyle.standard,
                label: Text('Standard'),
                icon: Icon(Icons.view_list),
              ),
              ButtonSegment(
                value: AccessibilitySettingsStyle.cards,
                label: Text('Cards'),
                icon: Icon(Icons.grid_view),
              ),
            ],
            selected: {_style},
            onSelectionChanged:
                (selection) => setState(() => _style = selection.first),
          ),
        ),
      ),
    ),
    body: AccessibilitySettings(
      style: _style,
      configuration: AccessibilitySettingsConfiguration.all
      // Example to add a callback after restoring the default settings
      .withOnRestoreSettingsCallback(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Settings restored to default values')),
        );
      }),
    ),
  );
}
