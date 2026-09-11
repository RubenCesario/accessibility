import 'package:custom_ui_example/widgets/setting_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The hand-made settings screen: every setting is a [SettingButton] that
/// cycles or steps its value through the ViewModel.
final class SettingsScreen extends StatelessWidget {
  /// Creates the screen.
  const SettingsScreen({super.key});

  static const _colors = <int?>[null, 0xFFB3261E, 0xFF1B5E20, 0xFF0D47A1];

  static const _backgrounds = <int?>[null, 0xFFFFF8E1, 0xFFE3F2FD, 0xFF000000];

  static T _next<T>(List<T> values, T current) =>
      values[(values.indexOf(current) + 1) % values.length];

  static String _number(double? value, String unset) =>
      value == null ? unset : value.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    final settings = AccessibilityScope.settingsOf(context);
    final viewModel = AccessibilityScope.of(context);
    final text = settings.textSettings;
    final color = settings.colorSettings;
    final buttons = [
      SettingButton(
        title: 'Theme mode',
        value: settings.themeMode.name,
        active: settings.themeMode != AccessibilityThemeMode.system,
        onPressed: () => viewModel.setThemeMode(
          _next(AccessibilityThemeMode.values, settings.themeMode),
        ),
      ),
      SettingButton(
        title: 'Effects',
        value: settings.effectsMode.name,
        active: settings.effectsMode != EffectsMode.system,
        onPressed: () => viewModel.setEffectsMode(
          _next(EffectsMode.values, settings.effectsMode),
        ),
      ),
      SettingButton(
        title: 'Text scale',
        value: text.textScaleFactor.toStringAsFixed(2),
        active: text.textScaleFactor != 1,
        onPressed: () => viewModel.setTextScaleFactor(
          text.textScaleFactor >= 2 ? 1 : text.textScaleFactor + 0.25,
        ),
      ),
      SettingButton(
        title: 'Line height',
        value: _number(text.lineHeight, 'default'),
        active: text.lineHeight != null,
        onPressed: () => viewModel.setLineHeight(switch (text.lineHeight) {
          null => 1.5,
          >= 2 => null,
          final height => height + 0.25,
        }),
      ),
      SettingButton(
        title: 'Letter spacing',
        value: _number(text.letterSpacing, 'default'),
        active: text.letterSpacing != null,
        onPressed: () =>
            viewModel.setLetterSpacing(switch (text.letterSpacing) {
              null => 0.5,
              >= 1 => null,
              final spacing => spacing + 0.25,
            }),
      ),
      SettingButton(
        title: 'Word spacing',
        value: _number(text.wordSpacing, 'default'),
        active: text.wordSpacing != null,
        onPressed: () => viewModel.setWordSpacing(switch (text.wordSpacing) {
          null => 1,
          >= 3 => null,
          final spacing => spacing + 1,
        }),
      ),
      SettingButton(
        title: 'Bold text',
        value: text.isBold ? 'on' : 'off',
        active: text.isBold,
        onPressed: () => viewModel.setBold(value: !text.isBold),
      ),
      SettingButton(
        title: 'Text alignment',
        value: text.textAlign.name,
        active: text.textAlign != TextAlignMode.none,
        onPressed: () =>
            viewModel.setTextAlign(_next(TextAlignMode.values, text.textAlign)),
      ),
      SettingButton(
        title: 'Text colour',
        value: text.color == null
            ? 'default'
            : '#${text.color!.toRadixString(16)}',
        active: text.color != null,
        onPressed: () => viewModel.setTextColor(_next(_colors, text.color)),
      ),
      SettingButton(
        title: 'Background colour',
        value: color.backgroundColor == null
            ? 'default'
            : '#${color.backgroundColor!.toRadixString(16)}',
        active: color.backgroundColor != null,
        onPressed: () => viewModel.setBackgroundColor(
          _next(_backgrounds, color.backgroundColor),
        ),
      ),
      SettingButton(
        title: 'Colour profile',
        value: color.colorProfile.name,
        active: color.colorProfile != ColorProfileLevel.normal,
        onPressed: viewModel.nextColorProfile,
      ),
      SettingButton(
        title: 'Restore defaults',
        value: settings.isDefault ? 'nothing to restore' : 'tap to restore',
        onPressed: viewModel.restoreDefaults,
      ),
    ];
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const AccessibleText(
            'Accessibility settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const AccessibleText(
            'Every button below is hand-made on package:flutter/widgets.dart '
            'and talks to the flutter_accessibility ViewModel. The whole '
            'screen, this text included, follows the settings.',
          ),
          const SizedBox(height: 16),
          EffectsBuilder(
            builder: (context, {required effectsEnabled, child}) =>
                AccessibleText(
                  effectsEnabled
                      ? 'Effects are enabled.'
                      : 'Effects are disabled: the app would skip its '
                            'animations.',
                ),
          ),
          const SizedBox(height: 16),
          Wrap(spacing: 12, runSpacing: 12, children: buttons),
        ],
      ),
    );
  }
}
