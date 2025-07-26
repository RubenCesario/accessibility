import 'dart:async' show Timer;

import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// {@template RestoreSettingsButton}
/// A button that restores the default accessibility
/// settings of the application.
/// {@endtemplate}
final class RestoreSettingsButton extends StatelessWidget {
  /// The callback after restoring the default accessibility settings.
  ///
  /// Useful to show some informative message to the user.
  final VoidCallback? onRestoreSettings;

  /// The style of the button.
  ///
  /// Defaults to [ElevatedButton.styleFrom]
  /// with a rounded rectangle shape.
  final ButtonStyle? style;

  /// The style of the text.
  ///
  /// Defaults to [TextTheme.titleLarge]
  /// with a bold font weight.
  final TextStyle? textStyle;

  /// {@macro RestoreSettingsButton}
  const RestoreSettingsButton({
    this.onRestoreSettings,
    this.style,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: context.colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.all(
            PaddingSize.medium,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              child: ElevatedButton(
                style: style ??
                    ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context.colorScheme.onPrimary,
                      padding: const EdgeInsets.all(PaddingSize.large),
                    ),
                onPressed: () async {
                  AccessibilitySettingsInherited.of(context)
                      .restoreDefaultSettings();
                  await SharedPreferencesInherited.of(context)
                      .restoreDefaultSettings()
                      .then((_) {
                    if (context.mounted) {
                      // We need a delay to show the message
                      // after we ensure the restore is done.
                      // Without the timer the message text may
                      // be shown with the previous settings.
                      // (i.e. in dark mode if previously enabled)
                      Timer(
                        const Duration(milliseconds: 300),
                        () async => onRestoreSettings?.call(),
                      );
                    }
                  });
                },
                child: AccessibleText(
                  context.l10na.restore_settings,
                  style: textStyle ??
                      context.textTheme.titleLarge!.copyWith(
                        color: context.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ),
      );
}
