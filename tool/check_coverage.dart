import 'dart:io';

/// Fails when the line coverage of an LCOV file is below a minimum, or when
/// the report has no lines at all (an empty report is not 100% coverage).
///
/// Usage: `dart tool/check_coverage.dart <lcov.info> <minimum-percent>`.
void main(List<String> arguments) {
  if (arguments.length != 2) {
    stderr.writeln(
      'Usage: dart tool/check_coverage.dart <lcov.info> <minimum-percent>',
    );
    exit(64);
  }
  final file = File(arguments[0]);
  if (!file.existsSync()) {
    stderr.writeln('No such file: ${arguments[0]}');
    exit(66);
  }
  final minimum = double.parse(arguments[1]);
  var found = 0;
  var hit = 0;
  for (final line in file.readAsLinesSync()) {
    if (line.startsWith('LF:')) {
      found += int.parse(line.substring(3));
    } else if (line.startsWith('LH:')) {
      hit += int.parse(line.substring(3));
    }
  }
  if (found == 0) {
    stderr.writeln(
      'No lines found in ${arguments[0]}; refusing to pass an empty '
      'report.',
    );
    exit(1);
  }
  final percent = hit * 100 / found;
  stdout.writeln('Line coverage: ${percent.toStringAsFixed(2)}% ($hit/$found)');
  if (percent < minimum) {
    stderr.writeln('Coverage is below the minimum of $minimum%.');
    exit(1);
  }
}
