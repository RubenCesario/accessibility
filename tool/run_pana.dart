// Runs pana on a temporary copy of a workspace package.
//
// pana cannot analyse a package that resolves through a pub workspace, and
// the unpublished `accessibility_testing` dev dependency would not resolve
// from pub.dev, so the copy drops `resolution: workspace` and that dev
// dependency before running `pana --exit-code-threshold 0` (every point
// must be kept).
//
// Usage: dart run tool/run_pana.dart packages/<name>
import 'dart:io';

/// Copies the package directory named in [args] into a temporary
/// directory with the workspace-only pubspec entries removed, then runs
/// pana on the copy with `--exit-code-threshold 0`, exiting with pana's
/// own exit code.
Future<void> main(List<String> args) async {
  if (args.length != 1) {
    stderr.writeln('Usage: dart run tool/run_pana.dart <package directory>');
    exit(64);
  }
  final source = Directory(args.single);
  if (!source.existsSync()) {
    stderr.writeln('No such directory: ${source.path}');
    exit(66);
  }
  final name = source.uri.pathSegments.lastWhere((s) => s.isNotEmpty);
  final temp = Directory.systemTemp.createTempSync('pana_');
  final copy = Directory('${temp.path}/$name');
  try {
    _copyTree(source, copy, skip: {'.dart_tool', 'build', 'coverage'});
    final pubspec = File('${copy.path}/pubspec.yaml');
    final lines = pubspec.readAsLinesSync().where(
      (line) =>
          line.trim() != 'resolution: workspace' &&
          !line.startsWith('  accessibility_testing:'),
    );
    pubspec.writeAsStringSync('${lines.join('\n')}\n');
    final options = File('${copy.path}/analysis_options.yaml');
    if (options.existsSync()) {
      options.deleteSync();
    }
    final result = await Process.start('dart', [
      'pub',
      'global',
      'run',
      'pana',
      '--no-warning',
      '--exit-code-threshold',
      '0',
      copy.path,
    ], mode: ProcessStartMode.inheritStdio);
    exit(await result.exitCode);
  } finally {
    temp.deleteSync(recursive: true);
  }
}

/// Recursively copies every file and directory under [from] into [to],
/// skipping any entry whose base name is in [skip].
void _copyTree(Directory from, Directory to, {required Set<String> skip}) {
  to.createSync(recursive: true);
  for (final entity in from.listSync()) {
    final base = entity.uri.pathSegments.lastWhere((s) => s.isNotEmpty);
    if (skip.contains(base)) {
      continue;
    }
    final target = '${to.path}/$base';
    if (entity is Directory) {
      _copyTree(entity, Directory(target), skip: skip);
    } else if (entity is File) {
      entity.copySync(target);
    }
  }
}
