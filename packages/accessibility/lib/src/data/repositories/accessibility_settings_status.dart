/// The outcome of the last load performed by the repository.
sealed class AccessibilitySettingsStatus {
  const AccessibilitySettingsStatus();
}

/// No load has been attempted yet.
final class AccessibilitySettingsIdle extends AccessibilitySettingsStatus {
  /// Creates the idle status.
  const AccessibilitySettingsIdle();
}

/// A load is in progress.
final class AccessibilitySettingsLoading extends AccessibilitySettingsStatus {
  /// Creates the loading status.
  const AccessibilitySettingsLoading();
}

/// The last load completed.
final class AccessibilitySettingsLoaded extends AccessibilitySettingsStatus {
  /// Creates the loaded status.
  const AccessibilitySettingsLoaded();
}

/// The last load failed; the settings in memory were kept.
final class AccessibilitySettingsLoadFailed
    extends AccessibilitySettingsStatus {
  /// Creates a failed status carrying the [error] and its [stackTrace].
  const AccessibilitySettingsLoadFailed(this.error, this.stackTrace);

  /// The exception thrown by the storage service.
  final Exception error;

  /// Where [error] was thrown.
  final StackTrace stackTrace;

  @override
  String toString() => 'AccessibilitySettingsLoadFailed($error)';
}
