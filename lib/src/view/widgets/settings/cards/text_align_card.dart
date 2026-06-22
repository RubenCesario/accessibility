import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/core/utils/parser.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';

/// A single card that controls text alignment with a segmented control,
/// replacing the three separate align cards.
///
/// Selecting a segment sets the alignment; tapping the active segment again
/// clears it back to the default. The segmented control gives all options at
/// once with proper mutually-exclusive semantics.
final class TextAlignCard extends SettingsItem {
  /// Creates a [TextAlignCard].
  const TextAlignCard({super.key});

  @override
  State<TextAlignCard> createState() => _TextAlignCardState();
}

class _TextAlignCardState extends State<TextAlignCard> {
  late AccessibilitySettingsInherited _settings;
  late SharedPreferencesInherited _prefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settings = AccessibilitySettingsInherited.of(context);
    _prefs = SharedPreferencesInherited.of(context);
  }

  TextAlign? _current(String mode) =>
      mode == LocalStorageDefaultValues.textAlignmentDefault
          ? null
          : parseTextAlign(mode);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settings.textSettings,
        builder: (_, settings, __) {
          final current = _current(settings.textAlignMode);
          return ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: kSettingsCardMinHeight),
            child: Card(
              color: context.colorScheme.surfaceContainerLow,
              surfaceTintColor: context.colorScheme.surfaceContainerLow,
              child: Padding(
                padding: const EdgeInsets.all(PaddingSize.medium),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: AccessibleText(
                          context.l10na.text_alignment,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: PaddingSize.small),
                      SegmentedButton<TextAlign>(
                        emptySelectionAllowed: true,
                        segments: [
                          ButtonSegment(
                            value: TextAlign.start,
                            icon: const Icon(
                              Icons.align_horizontal_left_outlined,
                            ),
                            tooltip: context.l10na.align_left,
                          ),
                          ButtonSegment(
                            value: TextAlign.center,
                            icon: const Icon(
                              Icons.align_horizontal_center_outlined,
                            ),
                            tooltip: context.l10na.align_center,
                          ),
                          ButtonSegment(
                            value: TextAlign.end,
                            icon: const Icon(
                              Icons.align_horizontal_right_outlined,
                            ),
                            tooltip: context.l10na.align_right,
                          ),
                        ],
                        selected: current == null ? <TextAlign>{} : {current},
                        onSelectionChanged: (selection) async {
                          final mode = selection.isEmpty
                              ? LocalStorageDefaultValues.textAlignmentDefault
                              : selection.first.name;
                          _settings.updateTextAlignSetting(mode);
                          await _prefs.storeTextAlignmentSetting(
                            newSetting: mode,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
}
