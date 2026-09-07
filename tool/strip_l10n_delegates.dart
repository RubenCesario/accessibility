import 'dart:io';

const _import =
    "import 'package:flutter_localizations/flutter_localizations.dart';";
const _blockStart = '/// A list of this localizations delegate along with';

/// Removes the `flutter_localizations` import and the
/// `localizationsDelegates` list that `flutter gen-l10n` writes into the
/// generated localizations class, so the package exposes only its own
/// delegate and does not depend on the legacy Material and Cupertino
/// delegates.
///
/// Fails on stderr and leaves the file untouched, instead of writing a
/// silently-unstripped copy, when the import, the start of the delegate
/// block, or the end of that block cannot be found in the generated
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
  file.writeAsStringSync('${output.join('\n')}\n');
}
