import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const forbidden = [
  'package:flutter/material.dart',
  'package:flutter/cupertino.dart',
  'package:material_ui',
  'package:listen',
  'package:flutter_localizations',
];

void main() {
  test('lib builds on cupertino_ui only', () {
    final offenders = <String>[];
    final files = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));
    for (final file in files) {
      for (final line in file.readAsLinesSync()) {
        final trimmed = line.trim();
        final isDirective =
            trimmed.startsWith('import ') || trimmed.startsWith('export ');
        if (isDirective && forbidden.any(trimmed.contains)) {
          offenders.add('${file.path}: $trimmed');
        }
      }
    }
    expect(offenders, isEmpty);
  });
}
