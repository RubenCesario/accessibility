import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// This is a single setting item. Each [SettingsItemCard]
/// is responsible for one change in the state of the
/// application.
final class SettingsItemCard extends StatelessWidget {
  /// The title of the settings item.
  final String title;

  /// The icon of the settings item.
  final IconData? icon;

  /// The Widget that manage the setting.
  final VoidCallback? onTap;

  /// Whether the card is highlighted.
  final bool isHighlighted;

  /// Creates an [SettingsItemCard] Widget.
  const SettingsItemCard({
    required this.title,
    this.onTap,
    this.icon,
    this.isHighlighted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Semantics(
        label: title,
        button: true,
        child: InkWell(
          onTap: onTap,
          child: Card(
            color: isHighlighted
                ? context.colorScheme.primary
                : context.colorScheme.surfaceContainerLow,
            surfaceTintColor: context.colorScheme.surfaceContainerLow,
            shadowColor: context.colorScheme.surfaceContainerLow,
            child: Padding(
              padding: const EdgeInsets.all(PaddingSize.medium),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icon,
                      color:
                          isHighlighted ? context.colorScheme.onPrimary : null,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      child: ExcludeSemantics(
                        child: AccessibleText(
                          title,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge,
                          textColor: isHighlighted
                              ? context.colorScheme.onPrimary
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
