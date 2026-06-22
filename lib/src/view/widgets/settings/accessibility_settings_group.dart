import 'dart:ui' show PointerDeviceKind;

import 'package:accessibility/accessibility.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_container.dart';
import 'package:accessibility/src/view/widgets/settings/cards/text_settings_card_group.dart';
import 'package:accessibility/src/view/widgets/settings/cards/theme_settings_card_group.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_pages_background_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_profile_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_text_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_settings_standard_group.dart';
import 'package:accessibility/src/view/widgets/settings/theme/theme_settings_standard_group.dart';
import 'package:flutter/material.dart';

/// {@template AccessibilitySettingsGroup}
/// A list of accessibility settings items.
///
/// The list can be configured to show or hide
/// specific settings items.
///
/// {@endtemplate}
final class AccessibilitySettingsGroup extends StatefulWidget {
  /// {@macro AccessibilitySettingsGroup}
  const AccessibilitySettingsGroup({
    super.key,
  });

  @override
  State<AccessibilitySettingsGroup> createState() =>
      _AccessibilitySettingsGroupState();
}

class _AccessibilitySettingsGroupState
    extends State<AccessibilitySettingsGroup> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          scrollBehavior: const ScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          restorationId: 'accessibility_settings_group',
          slivers: [
            if (context.a11yConfig.showThemeSettingsGroup)
              switch (context.a11yStyle) {
                AccessibilitySettingsStyle.standard =>
                  const ThemeSettingsStandardGroup(),
                AccessibilitySettingsStyle.cards =>
                  const ThemeSettingsCardGroup(),
              },
            if (context.a11yConfig.showColorSettingsGroup)
              SettingsGroup(
                title: context.l10na.color_adjustment,
                separatorBetweenWidgets: const SizedBox.shrink(),
                settings: [
                  if (context.a11yConfig.showColorProfileSetting)
                    const SettingsItemContainer(
                      widthFactor: 0.75,
                      setting: ColorProfileSettingsItem(),
                    ),
                  if (context.a11yConfig.showColorTextSetting)
                    SettingsItemContainer(
                      title: context.l10na.adjust_text_colors,
                      setting: const ColorTextSettingsItem(),
                    ),
                  if (context.a11yConfig.showColorPagesBackgroundSetting)
                    SettingsItemContainer(
                      title: context.l10na.adjust_background_colors,
                      setting: const ColorPagesBackgroundSettingsItem(),
                    ),
                ],
              ),
            if (context.a11yConfig.showTextSettingsGroup)
              switch (context.a11yStyle) {
                AccessibilitySettingsStyle.standard =>
                  const TextSettingsStandardGroup(),
                AccessibilitySettingsStyle.cards =>
                  const TextSettingsCardGroup(),
              },
            const SliverToBoxAdapter(
              child: RestoreSettingsButton(),
            ),
          ],
        ),
      );
}
