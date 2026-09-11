import 'package:material_ui/material_ui.dart';

/// A switch setting as a list tile.
final class SettingsItemSwitch extends StatelessWidget {
  /// Creates the switch tile.
  const SettingsItemSwitch({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.icon,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String subtitle;

  /// Whether the switch is on.
  final bool value;

  /// Called with the new value.
  final ValueChanged<bool> onChanged;

  /// The icon before the name.
  final IconData? icon;

  @override
  Widget build(BuildContext context) => SwitchListTile.adaptive(
    secondary: icon == null ? null : Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    value: value,
    onChanged: onChanged,
  );
}
