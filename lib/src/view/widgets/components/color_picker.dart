import 'package:accessibility/src/core/constants/colors.dart';
import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/core/extensions/colors.dart';
import 'package:accessibility/src/view/widgets/components/circle_color.dart';
import 'package:flutter/material.dart';

/// A Widget that shows a color picker to the user.
final class ColorPicker extends StatefulWidget {
  /// The list of colors to be shown to pick.
  ///
  /// Defaults to the common Material colors.
  final Iterable<ColorSwatch<int>> colors;

  /// The currently selected color value of the picker.
  final int? selectedColorValue;

  /// A callback that is called when the user selects a color.
  final ValueChanged<Color>? onShadeColorChange;

  /// A callback that is called when the user selects a main color.
  final ValueChanged<ColorSwatch<int>?>? onMainColorChange;

  /// If allowShades is set to false then only main colors
  /// will be shown and allowed to be selected.
  final bool allowPickingColorShades;

  /// Creates a [ColorPicker] Widget.
  ///
  /// If [allowPickingColorShades] is set to true, when the user
  /// choose a color, he must also pick a shade of that color.
  ///
  /// A shade of a color is one of its variant more dark or light.
  const ColorPicker({
    this.colors = kMaterialColors,
    this.selectedColorValue,
    this.onMainColorChange,
    this.onShadeColorChange,
    this.allowPickingColorShades = true,
    super.key,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  /// The currently selected shade color of the picker.
  Color? _selectedShadeColor;

  /// The currently selected main color of the picker.
  ColorSwatch<int>? _selectedMainColor;

  /// Whether the user are in the main color selection
  /// or in the shades one.
  bool _isMainColorSelection = true;

  /// Whether the color picker has a selected color.
  bool get _isColorSelected =>
      widget.selectedColorValue != null &&
      widget.selectedColorValue! != LocalStorageDefaultValues.noColorSelected;

  @override
  void initState() {
    super.initState();
    _initializeSelectedColor();
  }

  /// Initializes the selected color.
  ///
  /// The selected color will be test to check if its a main
  /// color or a shade of a main color.
  void _initializeSelectedColor() {
    if (!_isColorSelected) {
      _resetAllColors();
      return;
    }
    for (var i = 0; i < widget.colors.length; i++) {
      final mainColor = widget.colors.elementAt(i);
      final colorShadesList = mainColor.colorShades;
      for (var j = 0; j < colorShadesList.length; j++) {
        final shadeColor = colorShadesList[j];
        if (widget.selectedColorValue! != shadeColor.toARGB32()) {
          continue;
        }
        // shade color found
        setState(() {
          _selectedMainColor = mainColor;
          _selectedShadeColor = shadeColor;
        });
        return;
      }
    }
  }

  /// The callback when the main color is changed.
  void _onMainColorSelected(ColorSwatch<int> color) {
    setState(() {
      _selectedMainColor = color;
      _isMainColorSelection = false;
    });
    widget.onMainColorChange?.call(color);
  }

  /// The callback when the shade color is changed.
  void _onShadeColorSelected(Color color) {
    setState(() => _selectedShadeColor = color);
    widget.onShadeColorChange?.call(color);
  }

  /// Goes back to the main color selection.
  void _backToMainColors() {
    _selectedShadeColor = null;
    _isMainColorSelection = true;
  }

  /// Resets all the color choices.
  void _resetAllColors() {
    _selectedMainColor = null;
    _selectedShadeColor = null;
    _isMainColorSelection = true;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Wrap(
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 15,
          spacing: 15,
          children:
              (_isMainColorSelection || !widget.allowPickingColorShades) ||
                      (_selectedMainColor != null &&
                          _selectedMainColor!.colorShades.isEmpty)
                  ? [
                      // Build the main color list
                      if (_selectedMainColor != null)
                        InkWell(
                          child: Icon(
                            Icons.close,
                            semanticLabel: context.l10na.restore_main_color,
                            size: 38,
                          ),
                          onTap: () => setState(() {
                            _resetAllColors();
                            widget.onMainColorChange?.call(null);
                          }),
                        ),
                      for (final mainColor in widget.colors)
                        Semantics(
                          button: true,
                          label: context.l10na.change_text_color +
                              mainColor.semanticLabel(context),
                          child: CircleColor(
                            color: mainColor,
                            onColorSet: (_) => _onMainColorSelected(mainColor),
                            isSelected: _isColorSelected &&
                                _selectedMainColor != null &&
                                _selectedMainColor! == mainColor,
                            iconSelected: Icons.check,
                          ),
                        ),
                    ]
                  : [
                      // Build the shades color list
                      InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          semanticLabel: context.l10na.return_to_main_colors,
                          size: 38,
                        ),
                        onTap: () => setState(_backToMainColors),
                      ),
                      for (final shadeColor in _selectedMainColor!.colorShades)
                        Semantics(
                          button: true,
                          label: context.l10na.change_text_color_shade +
                              shadeColor
                                  .shadeNumberOfColorSwatch(_selectedMainColor!)
                                  .toString(),
                          child: CircleColor(
                            color: shadeColor,
                            onColorSet: _onShadeColorSelected,
                            isSelected: _isColorSelected &&
                                _selectedShadeColor != null &&
                                _selectedShadeColor! == shadeColor,
                            iconSelected: Icons.check,
                          ),
                        ),
                    ],
        ),
      );
}
