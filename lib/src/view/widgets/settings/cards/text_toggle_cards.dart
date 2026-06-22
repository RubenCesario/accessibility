import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:flutter/material.dart';

/// Card variant of the bold-text setting (align-card shape, single-tap toggle).
final class TextFontWeightCard extends SettingsItem {
  /// Creates a [TextFontWeightCard].
  const TextFontWeightCard({super.key});

  @override
  State<TextFontWeightCard> createState() => _TextFontWeightCardState();
}

class _TextFontWeightCardState extends State<TextFontWeightCard> {
  late AccessibilitySettingsInherited _settings;
  late SharedPreferencesInherited _prefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settings = AccessibilitySettingsInherited.of(context);
    _prefs = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settings.textSettings,
        builder: (_, settings, __) => SettingsItemCard(
          icon: Icons.format_bold,
          minHeight: kSettingsCardMinHeight,
          title: context.l10na.bold_text,
          isHighlighted: settings.isFontWeightBold,
          onTap: () async {
            final newValue = !settings.isFontWeightBold;
            _settings.updateFontWeightSetting(newSetting: newValue);
            await _prefs.storeTextFontWeightSetting(newSetting: newValue);
          },
        ),
      );
}

/// Card variant of the accessible-font setting.
final class TextFontFamilyCard extends SettingsItem {
  /// Creates a [TextFontFamilyCard].
  const TextFontFamilyCard({super.key});

  @override
  State<TextFontFamilyCard> createState() => _TextFontFamilyCardState();
}

class _TextFontFamilyCardState extends State<TextFontFamilyCard> {
  late AccessibilitySettingsInherited _settings;
  late SharedPreferencesInherited _prefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settings = AccessibilitySettingsInherited.of(context);
    _prefs = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settings.textSettings,
        builder: (_, settings, __) {
          final isEnabled = settings.isAccessibleFontEnabled;
          return SettingsItemCard(
            icon:
                isEnabled ? Icons.font_download : Icons.font_download_outlined,
            title: context.l10na.accessible_font,
            minHeight: kSettingsCardMinHeight,
            isHighlighted: isEnabled,
            onTap: () async {
              _settings.updateFontFamilySetting(useAccessibleFont: !isEnabled);
              await _prefs.storeTextFontFamilySetting(
                newSetting: _settings.textSettings.value.fontFamily,
              );
            },
          );
        },
      );
}
