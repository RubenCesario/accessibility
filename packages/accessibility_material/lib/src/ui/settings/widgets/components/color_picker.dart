import 'package:accessibility_material/src/ui/core/color_semantics.dart';
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/circle_color.dart';
import 'package:material_ui/material_ui.dart';

/// Picks a colour among [colors], optionally down to a shade.
///
/// Shows the main colours; tapping one selects it and, when
/// [allowPickingShades] is true, opens its shades. A close button clears
/// the selection; a back button returns to the main colours. Reports the
/// ARGB value through [onColorSelected] (`null` when cleared).
final class ColorPicker extends StatefulWidget {
  /// Creates the picker.
  const ColorPicker({
    required this.colors,
    required this.onColorSelected,
    required this.changeLabel,
    required this.changeShadeLabel,
    this.selectedColorValue,
    this.allowPickingShades = true,
    super.key,
  });

  /// The swatches offered.
  final Iterable<ColorSwatch<int>> colors;

  /// The selected ARGB value, or `null`.
  final int? selectedColorValue;

  /// Called with the selected ARGB value, or `null` when cleared.
  final ValueChanged<int?> onColorSelected;

  /// The spoken prefix of a main colour, e.g. "Change the text colour to:".
  final String changeLabel;

  /// The spoken prefix of a shade.
  final String changeShadeLabel;

  /// Whether tapping a main colour opens its shades.
  final bool allowPickingShades;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  ColorSwatch<int>? _openSwatch;

  ColorSwatch<int>? get _selectedSwatch {
    final value = widget.selectedColorValue;
    if (value == null) {
      return null;
    }
    for (final swatch in widget.colors) {
      if (swatch.toARGB32() == value ||
          swatch.shades.any((shade) => shade.toARGB32() == value)) {
        return swatch;
      }
    }
    return null;
  }

  void _selectMain(ColorSwatch<int> swatch) {
    widget.onColorSelected(swatch.toARGB32());
    if (widget.allowPickingShades) {
      setState(() => _openSwatch = swatch);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final open = _openSwatch;
    final selected = _selectedSwatch;
    final value = widget.selectedColorValue;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          if (open != null)
            IconButton(
              tooltip: l10n.returnToMainColors,
              icon: const Icon(Icons.arrow_back),
              onPressed: () => setState(() => _openSwatch = null),
            )
          else if (selected != null)
            IconButton(
              tooltip: l10n.restoreMainColor,
              icon: const Icon(Icons.close),
              onPressed: () => widget.onColorSelected(null),
            ),
          if (open != null)
            for (final shade in open.shades)
              CircleColor(
                color: shade,
                label:
                    '${widget.changeShadeLabel} '
                    '${shade.shadeNumberIn(open)}',
                isSelected: shade.toARGB32() == value,
                onTap: () => widget.onColorSelected(shade.toARGB32()),
              )
          else
            for (final swatch in widget.colors)
              CircleColor(
                color: swatch,
                label: '${widget.changeLabel} ${swatch.semanticLabel(l10n)}',
                isSelected: swatch == selected,
                onTap: () => _selectMain(swatch),
              ),
        ],
      ),
    );
  }
}
