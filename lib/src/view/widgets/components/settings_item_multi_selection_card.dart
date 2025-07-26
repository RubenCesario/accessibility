import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// This is a single setting item.
///
/// A [SettingsItemMultiSelectionCard] contains different state
/// of a setting, with the possibility to switch between them.
final class SettingsItemMultiSelectionCard extends StatefulWidget {
  /// The number of possible selections.
  final int selections;

  /// The index firstly selected.
  final int startingSelectionsIndex;

  /// The title of the settings item.
  final String title;

  /// The icon of the settings item.
  final IconData? icon;

  /// The Widget that manage the setting.
  final VoidCallback? onTap;

  /// Whether the card is highlighted.
  final bool isHighlighted;

  /// Creates an [SettingsItemMultiSelectionCard] Widget.
  const SettingsItemMultiSelectionCard({
    required this.selections,
    required this.title,
    this.startingSelectionsIndex = 0,
    this.onTap,
    this.icon,
    this.isHighlighted = false,
    super.key,
  });

  @override
  State<SettingsItemMultiSelectionCard> createState() =>
      _SettingsItemMultiSelectionCardState();
}

class _SettingsItemMultiSelectionCardState
    extends State<SettingsItemMultiSelectionCard> {
  late int _selectionsLength;

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectionsLength = widget.selections;
    _selectedIndex = widget.startingSelectionsIndex;
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          widget.onTap?.call();
          setState(() {
            _selectedIndex = (_selectedIndex + 1) % _selectionsLength;
          });
        },
        child: Card(
          color: context.colorScheme.surfaceContainerLow,
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
                    widget.icon,
                    color: widget.isHighlighted
                        ? context.colorScheme.onPrimary
                        : null,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Flexible(
                    child: ExcludeSemantics(
                      child: AccessibleText(
                        widget.title,
                        style: context.textTheme.titleLarge,
                        textColor: widget.isHighlighted
                            ? context.colorScheme.onPrimary
                            : null,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      for (int i = 0; i < _selectionsLength; i++) ...[
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                              color: i == _selectedIndex
                                  ? context.colorScheme.primary
                                  : Colors.grey.withValues(alpha: 0.2),
                              border: Border.all(
                                color: i == _selectedIndex
                                    ? context.colorScheme.primary
                                    : Colors.grey.withValues(alpha: 0.2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
