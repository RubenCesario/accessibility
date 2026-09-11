import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A switch setting as a tile; the whole row toggles it.
final class SettingsSwitchTile extends StatelessWidget {
  /// Creates the switch tile.
  const SettingsSwitchTile({
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
  Widget build(BuildContext context) => MergeSemantics(
    child: SettingsTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      trailing: CupertinoSwitch(value: value, onChanged: onChanged),
      onTap: () => onChanged(!value),
    ),
  );
}
