import 'package:accessibility/src/core/constants/component_config.dart';
import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to manage the
/// letter spacing of all text of the application.
final class TextLetterSpacingSettingsItem extends SettingsItem {
  /// Creates an [TextLetterSpacingSettingsItem] Widget.
  const TextLetterSpacingSettingsItem({super.key});

  @override
  State<TextLetterSpacingSettingsItem> createState() =>
      _TextLetterSpacingSettingsItemState();
}

class _TextLetterSpacingSettingsItemState
    extends State<TextLetterSpacingSettingsItem> {
  final double _minSliderValue = kMinLetterSpacingSliderValue;
  final double _maxSliderValue = kMaxLetterSpacingSliderValue;
  final int _divisions = kSliderDivisions;
  late double _sliderValue;

  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  Future<void> _storeLetterSpacing(double newSetting) async =>
      _prefsInherited.storeLetterSpacingSetting(newSetting: newSetting);

  void _incrementSliderValue() {
    if (_sliderValue < _maxSliderValue) {
      _sliderValue += _sliderUnit;
    }
  }

  void _decrementSliderValue() {
    if (_sliderValue > _minSliderValue) {
      _sliderValue -= _sliderUnit;
    }
  }

  /// This method adjusts the slider value if it goes out of bounds.
  ///
  /// This can happen due to inaccuracies in double values and
  /// their associated calculations.
  void _putSliderValueInsideBoundaries() {
    if (_sliderValue < _minSliderValue) {
      _sliderValue = _minSliderValue;
    } else if (_sliderValue > _maxSliderValue) {
      _sliderValue = _maxSliderValue;
    }
  }

  double get _sliderUnit => (_maxSliderValue - _minSliderValue) / _divisions;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () async {
              _decrementSliderValue();
              _settingsInherited.updateLetterSpacingSetting(_sliderValue);
              await _storeLetterSpacing(_sliderValue);
            },
            icon: Icon(
              size: IconSize.large,
              semanticLabel: context.l10na.decrement_letter_spacing,
              Icons.remove,
            ),
          ),
          Flexible(
            child: ValueListenableBuilder<TextSettings>(
              valueListenable: _settingsInherited.textSettings,
              builder: (_, settings, __) {
                _sliderValue = settings.letterSpacing;
                _putSliderValueInsideBoundaries();
                return Semantics(
                  label: context.l10na.slider_letter_spacing,
                  slider: true,
                  child: SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 13,
                        disabledThumbRadius: 13,
                        elevation: 5,
                      ),
                    ),
                    child: Slider.adaptive(
                      activeColor: context.colorScheme.primary,
                      inactiveColor: Colors.grey.withValues(alpha: 0.2),
                      thumbColor: context.colorScheme.onPrimary,
                      value: _sliderValue,
                      onChanged: (value) {
                        _sliderValue = value;
                        _settingsInherited.updateLetterSpacingSetting(value);
                      },
                      onChangeEnd: (value) async {
                        await _storeLetterSpacing(value);
                      },
                      min: _minSliderValue,
                      max: _maxSliderValue,
                      divisions: _divisions,
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            onPressed: () async {
              _incrementSliderValue();
              _settingsInherited.updateLetterSpacingSetting(_sliderValue);
              await _storeLetterSpacing(_sliderValue);
            },
            icon: Icon(
              size: IconSize.large,
              semanticLabel: context.l10na.increment_letter_spacing,
              Icons.add,
            ),
          ),
        ],
      );
}
