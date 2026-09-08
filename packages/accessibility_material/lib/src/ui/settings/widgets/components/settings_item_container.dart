import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// Frames one setting, with an optional title tile above it.
final class SettingsItemContainer extends StatelessWidget {
  /// Creates the container around [child].
  const SettingsItemContainer({
    required this.child,
    this.title,
    this.widthFactor,
    super.key,
  });

  /// The setting.
  final Widget child;

  /// The title shown in a tile above the setting.
  final String? title;

  /// The fraction of the available width the setting takes.
  final double? widthFactor;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(kPanelRadius),
    child: Column(
      children: [
        if (title != null) ListTile(title: Text(title!)),
        Center(
          child: FractionallySizedBox(widthFactor: widthFactor, child: child),
        ),
      ],
    ),
  );
}
