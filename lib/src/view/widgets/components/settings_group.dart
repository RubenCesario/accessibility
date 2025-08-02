import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// This shows a section with an optional grouping title.
/// This section contains a list of settings of the application.
final class SettingsGroup extends StatelessWidget {
  /// The title of the settings group.
  final String? title;

  /// All the settings of this group.
  final Iterable<Widget> settings;

  /// A separator between the settings of this group.
  final Widget separatorBetweenWidgets;

  /// Creates an [SettingsGroup] Widget.
  const SettingsGroup({
    required this.settings,
    this.title,
    this.separatorBetweenWidgets = const Divider(),
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.only(bottom: 20),
        sliver: SliverMainAxisGroup(
          slivers: [
            if (title != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: AccessibleText(
                    title!,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            DecoratedSliver(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
              ),
              sliver: SliverList.separated(
                itemCount: settings.length,
                itemBuilder: (context, index) => settings.elementAt(index),
                separatorBuilder: (context, index) => separatorBetweenWidgets,
              ),
            ),
          ],
        ),
      );
}
