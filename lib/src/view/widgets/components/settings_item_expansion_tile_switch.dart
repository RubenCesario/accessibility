import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:accessibility/src/view/widgets/shared/read_more_text_button.dart';
import 'package:flutter/material.dart';

/// This is a single setting item. Each [SettingsItemExpansionTileSwitch]
/// is responsible for one change in the state of the
/// application.
final class SettingsItemExpansionTileSwitch extends StatelessWidget {
  /// The title of the settings item.
  final String title;

  /// The subtitle of the settings item.
  final String subtitle;

  /// The text to show when the tile is expanded.
  final String expansionDescription;

  /// The Widget that manage the setting.
  final SettingsItem setting;

  /// Creates an [SettingsItemExpansionTileSwitch] Widget.
  const SettingsItemExpansionTileSwitch({
    required this.title,
    required this.subtitle,
    required this.expansionDescription,
    required this.setting,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.only(top: PaddingSize.smaller),
              child: ListTile(
                title: AccessibleText(
                  title,
                  style: context.textTheme.titleLarge,
                ),
                subtitle: AccessibleText(
                  subtitle,
                  style: context.textTheme.bodyMedium,
                ),
                trailing: setting,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSize.medium,
            ),
            child: ReadMoreTextButton(
              text: expansionDescription,
            ),
          ),
        ],
      );
}
