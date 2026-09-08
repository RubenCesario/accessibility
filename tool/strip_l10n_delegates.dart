import 'dart:io';

const _import =
    "import 'package:flutter_localizations/flutter_localizations.dart';";
const _blockStart = '/// A list of this localizations delegate along with';
const _docStart = '/// Callers can lookup localized strings';
const _classStart = 'abstract class ';
const _docReplacement = [
  '/// The translations of the accessibility settings panels.',
  '///',
  "/// Add [delegate] to the app's `localizationsDelegates` and",
  '/// [supportedLocales] to its `supportedLocales`, then read the strings',
  '/// with [of].',
];

/// Removes the `flutter_localizations` import, the
/// `localizationsDelegates` list, and the generator's usage dartdoc that
/// `flutter gen-l10n` writes into the generated localizations class, so
/// the package exposes only its own delegate and does not point callers
/// at a member or a dependency it no longer has.
///
/// Fails on stderr and leaves the file untouched, instead of writing a
/// silently-unstripped copy, when the import, the start or end of the
/// delegate block, the start of the usage dartdoc, or the class
/// declaration that should follow it cannot be found in the generated
/// output — for example because a `flutter gen-l10n` upgrade changed its
/// output shape.
///
/// Usage: `dart tool/strip_l10n_delegates.dart <generated-file>`.
void main(List<String> arguments) {
  if (arguments.length != 1) {
    stderr.writeln(
      'Usage: dart tool/strip_l10n_delegates.dart <generated-file>',
    );
    exit(64);
  }
  final file = File(arguments[0]);
  if (!file.existsSync()) {
    stderr.writeln('No such file: ${arguments[0]}');
    exit(66);
  }
  final output = <String>[];
  var skipping = false;
  var stripped = false;
  var blockFound = false;
  var skippingDoc = false;
  var docFound = false;
  for (final line in file.readAsLinesSync()) {
    if (line == _import) {
      stripped = true;
      continue;
    }
    if (line.trimLeft().startsWith(_blockStart)) {
      skipping = true;
      blockFound = true;
    }
    if (skipping) {
      if (line.trim() == '];') {
        skipping = false;
      }
      continue;
    }
    if (line.trim().startsWith(_docStart)) {
      skippingDoc = true;
      docFound = true;
    }
    if (skippingDoc) {
      if (line.trim().startsWith(_classStart)) {
        skippingDoc = false;
        output.addAll(_docReplacement);
      } else {
        continue;
      }
    }
    output.add(line);
  }
  if (!stripped) {
    stderr.writeln('No flutter_localizations import found in ${file.path}.');
    exit(1);
  }
  if (!blockFound) {
    stderr.writeln('No localizationsDelegates block found in ${file.path}.');
    exit(1);
  }
  if (skipping) {
    stderr.writeln(
      'The localizationsDelegates block was still open at the end of '
      '${file.path}.',
    );
    exit(1);
  }
  if (!docFound) {
    stderr.writeln('No usage dartdoc found in ${file.path}.');
    exit(1);
  }
  if (skippingDoc) {
    stderr.writeln(
      'No class declaration found after the usage dartdoc in ${file.path}.',
    );
    exit(1);
  }
  file.writeAsStringSync('${output.join('\n')}\n');
}
