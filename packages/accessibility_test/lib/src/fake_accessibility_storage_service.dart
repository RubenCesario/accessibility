import 'package:accessibility/accessibility.dart';

/// An in-memory [AccessibilityStorageService] that records its calls.
///
/// Set [readError], [writeError] or [clearError] to make the matching
/// method throw; the call is recorded before throwing.
final class FakeAccessibilityStorageService
    implements AccessibilityStorageService {
  /// Creates a fake holding [initial], which may be `null`.
  FakeAccessibilityStorageService({
    AccessibilitySettings? initial,
    this.readError,
    this.writeError,
    this.clearError,
  }) : _stored = initial;

  /// Thrown by [read] when non-null.
  Exception? readError;

  /// Thrown by [write] when non-null.
  Exception? writeError;

  /// Thrown by [clear] when non-null.
  Exception? clearError;

  AccessibilitySettings? _stored;

  final List<String> _calls = [];

  /// The value currently stored, or `null`.
  AccessibilitySettings? get stored => _stored;

  /// The names of the methods called so far, in order:
  /// `'read'`, `'write'`, `'clear'`.
  List<String> get calls => List.unmodifiable(_calls);

  @override
  Future<AccessibilitySettings?> read() async {
    _calls.add('read');
    final error = readError;
    if (error != null) {
      throw error;
    }
    return _stored;
  }

  @override
  Future<void> write(AccessibilitySettings settings) async {
    _calls.add('write');
    final error = writeError;
    if (error != null) {
      throw error;
    }
    _stored = settings;
  }

  @override
  Future<void> clear() async {
    _calls.add('clear');
    final error = clearError;
    if (error != null) {
      throw error;
    }
    _stored = null;
  }
}
