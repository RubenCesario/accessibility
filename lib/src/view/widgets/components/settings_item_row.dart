import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/list.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:flutter/material.dart';

/// A row that shows a list of settings.
///
/// All setting will be the same size, without any
/// that goes to the next line.
final class SettingsItemRow extends StatelessWidget {
  /// The list of items to place in the row.
  final Iterable<SettingsItem> items;

  /// The spacing between the items.
  final double spacingBetweenItems;

  /// Creates an [SettingsItemRow] Widget.
  const SettingsItemRow({
    required this.items,
    this.spacingBetweenItems = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(PaddingSize.medium),
        child: Row(
          children: [
            ...items
                .map(
                  (item) => Expanded(
                    child: item,
                  ),
                )
                .toList()
                .withSeparatorBetweenWidgets(
                  separator: SizedBox(
                    width: spacingBetweenItems,
                  ),
                ),
          ],
        ),
      );
}
