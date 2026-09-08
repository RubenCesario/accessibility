import 'dart:convert';
import 'dart:io';

import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('the constant names the packaged family', () {
    expect(AndikaFont.font.family, 'Andika');
    expect(AndikaFont.font.package, 'accessibility_font_andika');
    expect(
      AndikaFont.font.qualifiedFamily,
      'packages/accessibility_font_andika/Andika',
    );
  });

  test('the four faces are declared and bundled', () async {
    final manifest =
        jsonDecode(await rootBundle.loadString('FontManifest.json'))
            as List<Object?>;
    final entry = manifest.cast<Map<String, Object?>>().singleWhere(
      (family) => (family['family']! as String).endsWith('Andika'),
    );
    final fonts = (entry['fonts']! as List<Object?>)
        .cast<Map<String, Object?>>();
    expect(fonts, hasLength(4));
    for (final font in fonts) {
      final asset = font['asset']! as String;
      final data = await rootBundle.load(asset);
      expect(data.lengthInBytes, greaterThan(0), reason: asset);
    }
  });

  test('the Open Font License ships with the fonts', () {
    final licence = File('lib/fonts/OFL.txt').readAsStringSync();
    expect(licence, contains('SIL OPEN FONT LICENSE'));
    expect(licence, contains('Reserved Font Names "Andika"'));
  });
}
