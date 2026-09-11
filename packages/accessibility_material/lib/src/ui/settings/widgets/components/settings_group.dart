import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// A titled, rounded group of settings, as a sliver.
final class SettingsGroup extends StatelessWidget {
  /// Creates a group of [settings], optionally titled.
  const SettingsGroup({
    required this.settings,
    this.title,
    this.separator = const Divider(height: 1),
    super.key,
  });

  /// The settings, in order.
  final List<Widget> settings;

  /// The header shown above the group.
  final String? title;

  /// The widget between two settings.
  final Widget separator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: kPanelPadding),
      sliver: SliverMainAxisGroup(
        slivers: [
          if (title != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Semantics(
                  header: true,
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(kPanelRadius),
            ),
            sliver: SliverList.separated(
              itemCount: settings.length,
              itemBuilder: (context, index) => settings[index],
              separatorBuilder: (context, index) => separator,
            ),
          ),
        ],
      ),
    );
  }
}
