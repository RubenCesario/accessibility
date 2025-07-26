import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// This is a single setting item. Each [SettingsItemListTileSwitch]
/// is responsible for one change in the state of the
/// application.
final class SettingsItemListTileSwitch extends StatelessWidget {
  /// The icon of the settings item.
  final IconData? icon;

  /// The title of the settings item.
  final String title;

  /// The subtitle of the settings item.
  final String subtitle;

  /// The Widget that manage the setting.
  final SettingsItem setting;

  /// Creates an [SettingsItemListTileSwitch] Widget.
  const SettingsItemListTileSwitch({
    required this.title,
    required this.subtitle,
    required this.setting,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: icon == null
              ? const EdgeInsets.only(top: PaddingSize.smaller)
              : EdgeInsets.zero,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(
                bottom: PaddingSize.small,
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: IconSize.medium,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                  Expanded(
                    child: AccessibleText(
                      title,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: AccessibleText(
              subtitle,
              style: context.textTheme.bodyMedium,
            ),
            trailing: setting,
          ),
        ),
      );
}
