import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// A container that shows a single setting.
///
/// This is useful when the [SettingsItem] is too complex to wrap
/// in another setting tile.
final class SettingsItemContainer extends StatelessWidget {
  /// The title of the settings item.
  final String? title;

  /// The settings to show in the container.
  final SettingsItem setting;

  /// A width factor to resize the [setting] accordingly.
  ///
  /// Values from:
  /// - 0.0: takes no space.
  /// - 1.0: takes as much space as possible.
  final double? widthFactor;

  /// Creates an [SettingsItemContainer] Widget.
  const SettingsItemContainer({
    required this.setting,
    this.title,
    this.widthFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: title != null
              ? Column(
                  children: [
                    ListTile(
                      title: AccessibleText(
                        title!,
                        style: context.textTheme.titleLarge,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: widthFactor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: PaddingSize.small,
                        ),
                        child: setting,
                      ),
                    ),
                  ],
                )
              : FractionallySizedBox(
                  widthFactor: widthFactor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: PaddingSize.small,
                    ),
                    child: setting,
                  ),
                ),
        ),
      );
}
