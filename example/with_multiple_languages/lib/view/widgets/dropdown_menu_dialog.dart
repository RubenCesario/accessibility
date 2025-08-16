import 'dart:collection' show UnmodifiableListView;

import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, TextInputFormatter;
import 'package:with_multiple_languages/interfaces/displayable.dart';

/// A dialog that opens in a filterable list of items the user can choose from.
class FilterableListDialog<T extends Displayable> extends StatefulWidget {
  /// Creates a [FilterableListDialog] Widget.
  const FilterableListDialog({
    required this.title,
    required this.entries,
    this.initialValue,
    super.key,
  });

  /// The possible candidates for the user to select.
  final Iterable<Displayable> entries;

  /// The initial value selected.
  final Displayable? initialValue;

  /// The title of the dialog.
  final String title;

  @override
  State<FilterableListDialog<Displayable>> createState() =>
      _FilterableListDialogState<Displayable>();
}

class _FilterableListDialogState<T extends Displayable>
    extends State<FilterableListDialog<T>> {
  late final TextEditingController _controller;
  final ValueNotifier<Iterable<Displayable>?> _filteredDropdownMenuEntries =
      ValueNotifier(null);

  UnmodifiableListView<Displayable> get _entriesToDisplay =>
      UnmodifiableListView(
        _filteredDropdownMenuEntries.value ?? widget.entries,
      );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue?.displayName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _filterEntries(String query) {
    if (query.isEmpty) {
      _filteredDropdownMenuEntries.value = null;
    } else {
      _filteredDropdownMenuEntries.value = widget.entries.where(
        _containsCondition(query),
      );
    }
  }

  bool Function(Displayable entry) _containsCondition(String query) =>
      (entry) => entry.displayName.toLowerCase().contains(query.toLowerCase());

  @override
  Widget build(BuildContext context) => Dialog.fullscreen(
    child: CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            PaddingSize.medium,
            PaddingSize.medium,
            PaddingSize.medium,
            PaddingSize.small,
          ),
          sliver: PinnedHeaderSliver(
            child: ColoredBox(
              color: context.colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(PaddingSize.medium),
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AccessibleText(
                            widget.title,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: context.colorScheme.onPrimary,
                            backgroundColor: context.colorScheme.primary,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const AccessibleText('Close Dialog'),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _controller,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                      ],
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Search a country',
                        prefixIcon: const Icon(
                          Icons.search,
                          semanticLabel: 'Search a country',
                        ),
                        prefixIconColor: context.colorScheme.onSurface,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _controller.clear();
                            _filterEntries(TextEditingValue.empty.text);
                          },
                          icon: const Icon(
                            Icons.clear,
                            semanticLabel: 'Clear text',
                          ),
                        ),
                        suffixIconColor: context.colorScheme.onSurface,
                      ),
                      onChanged: _filterEntries,
                      onSubmitted: (value) {
                        if (value.isEmpty) {
                          return;
                        }
                        final filteredEntries = _entriesToDisplay.where(
                          _containsCondition(value),
                        );
                        if (filteredEntries.isNotEmpty) {
                          Navigator.pop(context, filteredEntries.first);
                        }
                      },
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            PaddingSize.medium,
            PaddingSize.small,
            PaddingSize.medium,
            PaddingSize.medium,
          ),
          sliver: ListenableBuilder(
            listenable: _filteredDropdownMenuEntries,
            builder:
                (context, child) => SliverList.separated(
                  itemCount: _entriesToDisplay.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = _entriesToDisplay[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: AccessibleText(item.displayName),
                      trailing:
                          item == widget.initialValue
                              ? const Icon(
                                Icons.check,
                                semanticLabel: 'Current country selected',
                              )
                              : null,
                      onTap: () => Navigator.pop(context, item),
                    );
                  },
                ),
          ),
        ),
      ],
    ),
  );
}
