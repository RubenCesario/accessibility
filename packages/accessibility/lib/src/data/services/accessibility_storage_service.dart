import 'package:accessibility/src/domain/models/accessibility_settings.dart';

/// Persists [AccessibilitySettings] in an external store.
///
/// Implementations wrap one storage technology (shared preferences, a
/// database, a file) and hold no state of their own. The
/// `accessibility_shared_preferences` package ships one; the
/// `accessibility_test` package ships a fake.
abstract interface class AccessibilityStorageService {
  /// Returns the stored settings, or `null` when nothing has been stored.
  Future<AccessibilitySettings?> read();

  /// Stores [settings], replacing any previous value.
  Future<void> write(AccessibilitySettings settings);

  /// Removes the stored settings.
  Future<void> clear();
}
