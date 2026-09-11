import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const forbidden = [
  "'package:flutter/material.dart'",
  "'package:flutter/cupertino.dart'",
  "'package:material_ui",
  "'package:cupertino_ui",
  "'package:listen",
];

void main() {
  test('lib/ imports neither a design system nor package:listen', () {
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
        if (isDirective && forbidden.any(directive.contains)) {
          offenders.add('${file.path}: $directive');
        }
      }
    }
    expect(offenders, isEmpty);
  });
}
