import 'package:cupertino_ui/cupertino_ui.dart';

/// A 44 dp icon button that is one labelled tap target.
final class SettingsIconButton extends StatelessWidget {
  /// Creates the button.
  const SettingsIconButton({
    required this.icon,
    required this.label,
    this.onPressed,
    super.key,
  });

  /// The icon drawn in the button.
  final IconData icon;

  /// The spoken label.
  final String label;

  /// Called on tap; `null` disables the button.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    label: label,
    button: true,
    enabled: onPressed != null,
    onTap: onPressed,
    excludeSemantics: true,
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: const Size.square(kMinInteractiveDimensionCupertino),
      onPressed: onPressed,
      child: Icon(icon),
    ),
  );
}
