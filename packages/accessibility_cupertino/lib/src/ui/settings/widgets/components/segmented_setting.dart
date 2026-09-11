import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A setting with a few exclusive values as a sliding segmented control
/// under a title tile; every segment is a 44 dp tap target.
final class SegmentedSetting<T extends Object> extends StatelessWidget {
  /// Creates the setting.
  const SegmentedSetting({
    required this.title,
    required this.segments,
    required this.selected,
    required this.onSelected,
    this.icon,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The values and their labels, in order.
  final Map<T, String> segments;

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
      SettingsTile(title: title, icon: icon),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          kPanelPadding,
          0,
          kPanelPadding,
          kPanelPadding / 2,
        ),
        child: CupertinoSlidingSegmentedControl<T>(
          groupValue: selected,
          children: {
            for (final MapEntry(:key, :value) in segments.entries)
              key: SizedBox(
                height: kMinInteractiveDimensionCupertino,
                child: Center(child: Text(value, textAlign: TextAlign.center)),
              ),
          },
          onValueChanged: (value) {
            if (value != null) {
              onSelected(value);
            }
          },
        ),
      ),
    ],
  );
}
