import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// A setting with three exclusive values as a segmented button.
final class TriStateSetting<T> extends StatelessWidget {
  /// Creates the setting.
  const TriStateSetting({
    required this.title,
    required this.segments,
    required this.selected,
    required this.onSelected,
    this.icon,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The three segments, each with a label and a tooltip.
  final List<ButtonSegment<T>> segments;

  /// The current value.
  final T selected;

  /// Called with the tapped value.
  final ValueChanged<T> onSelected;

  /// The icon before the name.
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ListTile(leading: icon == null ? null : Icon(icon), title: Text(title)),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          kPanelPadding,
          0,
          kPanelPadding,
          kPanelPadding / 2,
        ),
        child: SegmentedButton<T>(
          segments: segments,
          selected: {selected},
          showSelectedIcon: false,
          onSelectionChanged: (selection) => onSelected(selection.single),
        ),
      ),
    ],
  );
}
