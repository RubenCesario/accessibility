import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_switch.dart';
import 'package:accessibility_material/src/ui/text/widgets/read_more_text.dart';
import 'package:material_ui/material_ui.dart';

/// A switch setting followed by a collapsible description.
final class SettingsItemExpansionSwitch extends StatelessWidget {
  /// Creates the switch with its description.
  const SettingsItemExpansionSwitch({
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
      SettingsItemSwitch(
        title: title,
        subtitle: subtitle,
        value: value,
        onChanged: onChanged,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPanelPadding),
        child: ReadMoreText(text: description),
      ),
    ],
  );
}
