import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

Map<String, Object?> readArb(File file) =>
    jsonDecode(file.readAsStringSync()) as Map<String, Object?>;

Set<String> messageKeys(Map<String, Object?> arb) =>
    arb.keys.where((key) => !key.startsWith('@')).toSet();

void main() {
  final directory = Directory('lib/l10n');
  final files = directory
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.arb'))
      .toList();
  final template = readArb(File('lib/l10n/app_en.arb'));
  final templateKeys = messageKeys(template);

  test('there are 81 ARB files and the template has 79 messages', () {
    expect(files, hasLength(81));
    expect(templateKeys, hasLength(79));
  });

  test('every key is lowerCamelCase', () {
    final pattern = RegExp(r'^[a-z][a-zA-Z0-9]*$');
    for (final key in templateKeys) {
      expect(pattern.hasMatch(key), isTrue, reason: key);
    }
  });

  test('every ARB declares its locale and has exactly the template keys', () {
    for (final file in files) {
      final name = file.uri.pathSegments.last;
      final locale = name.substring('app_'.length, name.length - '.arb'.length);
      final arb = readArb(file);
      expect(arb['@@locale'], locale, reason: name);
      expect(messageKeys(arb), templateKeys, reason: name);
    }
  });

  test('the untranslated report is empty', () {
    final report = File('untranslated_messages.json').readAsStringSync();
    expect(jsonDecode(report), isEmpty);
  });
}
