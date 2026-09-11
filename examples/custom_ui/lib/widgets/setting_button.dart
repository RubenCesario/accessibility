import 'package:custom_ui_example/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A hand-made button: one labelled 48 dp tap target, highlighted when
/// [active], showing the setting's [title] and its current [value].
final class SettingButton extends StatelessWidget {
  /// Creates the button.
  const SettingButton({
    required this.title,
    required this.value,
    required this.onPressed,
    this.active = false,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The current value, spoken after the title.
  final String value;

  /// Called on tap.
  final VoidCallback onPressed;

  /// Whether the button is drawn with the accent colour.
  final bool active;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context, AccessibilityScope.settingsOf(context));
    final foreground = active ? palette.onAccent : palette.text;
    return Semantics(
      label: title,
      value: value,
      button: true,
      selected: active,
      onTap: onPressed,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: active ? palette.accent : palette.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccessibleText(
                title,
                textColor: foreground,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              AccessibleText(value, textColor: foreground),
            ],
          ),
        ),
      ),
    );
  }
}
