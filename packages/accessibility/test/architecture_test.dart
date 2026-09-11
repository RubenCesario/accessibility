import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('lib/ never imports Flutter or dart:ui', () {
    final offenders = <String>[];
    final files = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));
    for (final file in files) {
      for (final line in file.readAsLinesSync()) {
        final directive = line.trim();
        final isDirective =
            directive.startsWith('import ') || directive.startsWith('export ');
        if (isDirective &&
            (directive.contains("'package:flutter") ||
                directive.contains("'dart:ui"))) {
          offenders.add('${file.path}: $directive');
        }
      }
    }
    expect(offenders, isEmpty);
  });
}
