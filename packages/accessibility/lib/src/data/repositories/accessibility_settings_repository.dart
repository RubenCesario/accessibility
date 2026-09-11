import 'package:accessibility/src/data/repositories/accessibility_settings_status.dart';
import 'package:accessibility/src/data/services/accessibility_storage_service.dart';
import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:listen/listen.dart';

/// The single source of truth for the [AccessibilitySettings] of an app.
///
/// Holds the current settings in memory, exposes them as a listenable, and
/// persists them through an optional [AccessibilityStorageService]. Create
/// one per app, call [load] before the first frame, and pass it to the
/// view model of the UI layer.
final class AccessibilitySettingsRepository {
  /// Creates a repository.
  ///
  /// Without a service nothing is persisted. [initial] is the value held
  /// until [load] replaces it.
  AccessibilitySettingsRepository({
    this._service,
    AccessibilitySettings initial = AccessibilitySettings.defaults,
  }) : _settings = ValueNotifier(initial),
       _status = ValueNotifier(const AccessibilitySettingsIdle());

  final AccessibilityStorageService? _service;
  final ValueNotifier<AccessibilitySettings> _settings;
  final ValueNotifier<AccessibilitySettingsStatus> _status;

  /// Counts [save] and [clear] calls so that a [load] that was already in
  /// flight can tell that a newer user choice must win.
  int _mutations = 0;

  /// The current settings. Notifies when the value changes.
  ValueListenable<AccessibilitySettings> get settings => _settings;

  /// The outcome of the last [load]. Notifies when it changes.
  ValueListenable<AccessibilitySettingsStatus> get status => _status;

  /// Reads the stored settings from the service.
  ///
  /// Never throws. A stored value replaces [settings]; `null` keeps the
  /// current value; an [Exception] keeps the current value and sets
  /// [status] to [AccessibilitySettingsLoadFailed]. A [save] or [clear]
  /// performed while the read is in flight wins over the read value.
  Future<void> load() async {
    final service = _service;
    if (service == null) {
      _status.value = const AccessibilitySettingsLoaded();
      return;
    }
    _status.value = const AccessibilitySettingsLoading();
    final mutationsBefore = _mutations;
    try {
      final stored = await service.read();
      if (stored != null && mutationsBefore == _mutations) {
        _settings.value = stored;
      }
      _status.value = const AccessibilitySettingsLoaded();
    } on Exception catch (error, stackTrace) {
      _status.value = AccessibilitySettingsLoadFailed(error, stackTrace);
    }
  }

  /// Replaces the settings, notifies, then writes them to the service.
  ///
  /// The returned future completes when the write completes; a write error
  /// propagates to the caller while the in-memory value stays updated.
  Future<void> save(AccessibilitySettings settings) async {
    _mutations++;
    _settings.value = settings;
    final service = _service;
    if (service != null) {
      await service.write(settings);
    }
  }

  /// Restores [AccessibilitySettings.defaults], notifies, then clears the
  /// service. Errors propagate like in [save].
  Future<void> clear() async {
    _mutations++;
    _settings.value = AccessibilitySettings.defaults;
    final service = _service;
    if (service != null) {
      await service.clear();
    }
  }

  /// Releases the listenables. The repository must not be used afterwards.
  void dispose() {
    _settings.dispose();
    _status.dispose();
  }
}
