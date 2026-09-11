import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_switch_tile.dart';
import 'package:accessibility_cupertino/src/ui/text/widgets/cupertino_read_more_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A switch tile followed by a collapsible description.
final class SettingsExpansionSwitchTile extends StatelessWidget {
  /// Creates the switch with its description.
  const SettingsExpansionSwitchTile({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String subtitle;

  /// The long description, collapsed by default.
  final String description;

  /// Whether the switch is on.
  final bool value;

  /// Called with the new value.
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SettingsSwitchTile(
        title: title,
        subtitle: subtitle,
        value: value,
        onChanged: onChanged,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          kPanelPadding,
          0,
          kPanelPadding,
          kPanelPadding / 2,
        ),
        child: CupertinoReadMoreText(text: description),
      ),
    ],
  );
}
