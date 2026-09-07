import 'dart:convert';

import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:test/test.dart';

void main() {
  const everythingSet = AccessibilitySettings(
    themeMode: AccessibilityThemeMode.dark,
    effectsMode: EffectsMode.disabled,
    textSettings: TextSettings(
      lineHeight: 1.5,
      wordSpacing: 2,
      letterSpacing: 0.5,
      textScaleFactor: 1.5,
      isBold: true,
      textAlign: TextAlignMode.justify,
      color: 0xFF112233,
      fontFamily: 'Andika',
    ),
    colorSettings: ColorSettings(
      backgroundColor: 0xFFFFFFF0,
      colorProfile: ColorProfileLevel.monochrome,
    ),
  );

  group('AccessibilitySettings JSON', () {
    test('toJson uses field names and enum names', () {
      expect(everythingSet.toJson(), {
        'themeMode': 'dark',
        'effectsMode': 'disabled',
        'textSettings': {
          'lineHeight': 1.5,
          'wordSpacing': 2.0,
          'letterSpacing': 0.5,
          'textScaleFactor': 1.5,
          'isBold': true,
          'textAlign': 'justify',
          'color': 0xFF112233,
          'fontFamily': 'Andika',
        },
        'colorSettings': {
          'backgroundColor': 0xFFFFFFF0,
          'colorProfile': 'monochrome',
        },
      });
    });

    test('defaults serialise with nulls for unset values', () {
      final json = AccessibilitySettings.defaults.toJson();
      expect(json['themeMode'], 'system');
      expect(
        (json['textSettings']! as Map<String, Object?>)['lineHeight'],
        isNull,
      );
      expect(
        (json['colorSettings']! as Map<String, Object?>)['backgroundColor'],
        isNull,
      );
    });

    test('round trips through dart:convert', () {
      final encoded = jsonEncode(everythingSet.toJson());
      final decoded = jsonDecode(encoded) as Map<String, Object?>;
      expect(AccessibilitySettings.fromJson(decoded), everythingSet);
      final defaultsDecoded =
          jsonDecode(jsonEncode(AccessibilitySettings.defaults.toJson()))
              as Map<String, Object?>;
      expect(
        AccessibilitySettings.fromJson(defaultsDecoded),
        AccessibilitySettings.defaults,
      );
    });

    test('fromJson falls back to defaults for missing keys', () {
      expect(
        AccessibilitySettings.fromJson(const {}),
        AccessibilitySettings.defaults,
      );
      expect(
        AccessibilitySettings.fromJson(const {'themeMode': 'light'}),
        const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
      );
    });

    test('fromJson falls back to defaults for unknown enum names', () {
      final settings = AccessibilitySettings.fromJson(const {
        'themeMode': 'sepia',
        'effectsMode': 'maybe',
        'textSettings': {'textAlign': 'diagonal'},
        'colorSettings': {'colorProfile': 'neon'},
      });
      expect(settings, AccessibilitySettings.defaults);
    });

    test('fromJson treats wrong types as missing', () {
      final settings = AccessibilitySettings.fromJson(const {
        'themeMode': 3,
        'textSettings': 'not a map',
        'colorSettings': {'backgroundColor': 'red'},
      });
      expect(settings, AccessibilitySettings.defaults);
    });

    test('fromJson reads integral doubles written by other platforms', () {
      final settings = AccessibilitySettings.fromJson(const {
        'textSettings': {'lineHeight': 2, 'textScaleFactor': 2},
      });
      expect(settings.textSettings.lineHeight, 2.0);
      expect(settings.textSettings.textScaleFactor, 2.0);
    });

    test('fromJson accepts a Map<dynamic, dynamic> for nested objects', () {
      final settings = AccessibilitySettings.fromJson(const {
        'textSettings': <dynamic, dynamic>{'textScaleFactor': 2},
      });
      expect(settings.textSettings.textScaleFactor, 2.0);
    });
  });
}
