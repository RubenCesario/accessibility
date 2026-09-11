import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:test/test.dart';

void main() {
  group('ColorSettings', () {
    test('defaults override nothing', () {
      const settings = ColorSettings.defaults;
      expect(settings.backgroundColor, isNull);
      expect(settings.colorProfile, ColorProfileLevel.normal);
      expect(settings, ColorSettings.defaults);
      expect(settings.isDefault, isTrue);
    });

    test('is a value type', () {
      const a = ColorSettings(
        backgroundColor: 0xFFFFFFFF,
        colorProfile: ColorProfileLevel.monochrome,
      );
      const b = ColorSettings(
        backgroundColor: 0xFFFFFFFF,
        colorProfile: ColorProfileLevel.monochrome,
      );
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(ColorSettings.defaults));
      expect(a.isDefault, isFalse);
      expect(a.toString(), contains('monochrome'));
    });

    test('copyWith keeps, sets and clears', () {
      const original = ColorSettings(
        backgroundColor: 0xFFFFFFFF,
        colorProfile: ColorProfileLevel.highContrast,
      );
      expect(original.copyWith(), original);
      expect(
        original.copyWith(colorProfile: ColorProfileLevel.lowSaturation),
        const ColorSettings(
          backgroundColor: 0xFFFFFFFF,
          colorProfile: ColorProfileLevel.lowSaturation,
        ),
      );
      expect(
        original.copyWith(backgroundColor: null),
        const ColorSettings(colorProfile: ColorProfileLevel.highContrast),
      );
      expect(
        ColorSettings.defaults
            .copyWith(backgroundColor: 0xFF000000)
            .backgroundColor,
        0xFF000000,
      );
    });
  });
}
