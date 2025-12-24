import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/core/utils/shared_preferences.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:accessibility/src/services/shared_preferences_service_no_op.dart';
import 'package:accessibility/src/services/shared_preferences_service_with_cache.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A record containing the initialized accessibility components.
typedef _InitializedComponents = ({
  SharedPreferencesService service,
  AccessibilitySettingsCollection settings,
});

/// {@template flutter.widgets.AccessibilityInitializer}
/// This widget is the root of your application.
///
/// It is used to initialize the accessibility settings
/// of the application.
///
/// There are two ways to use this widget:
///
/// 1. **Sync initialization**: Pass the sharedPreferencesService and
///    accessibilitySettingsCollection that you've already initialized
///    before calling `runApp()`.
///
/// Example using sync initialization:
///
/// ```dart
/// void main() async {
///   final sharedPrefs = await createSharedPreferencesWithCache();
///   final sharedPrefsService = SharedPreferencesServiceWithCache(sharedPrefs);
///   final localStorageSettings =
///       await sharedPrefsService.getLocalStorageAccessibilitySettings();
///   final appThemes = AppThemes(
///     lightTheme: ThemeData.light(),
///     darkTheme: ThemeData.dark(),
///   );
///   runApp(
///     AccessibilityInitializer(
///       sharedPreferencesService: sharedPrefsService,
///       accessibilitySettingsCollection: localStorageSettings,
///       child: MyApp(appThemes: appThemes),
///     ),
///   );
/// }
/// ```
///
/// 2. **Async initialization**: Use AccessibilityInitializer.async
///    which handles all initialization internally and shows a loading widget
///    while waiting.
///
/// Example using async initialization:
///
/// ```dart
/// void main() {
///   runApp(
///     AccessibilityInitializer.async(
///       child: MyApp(),
///     ),
///   );
/// }
/// ```
/// {@endtemplate}
final class AccessibilityInitializer extends StatelessWidget {
  /// {@macro flutter.widgets.AccessibilityInitializer}
  ///
  /// Use this constructor when you've already initialized the
  /// [sharedPreferencesService] and [accessibilitySettingsCollection]
  /// before calling `runApp()`.
  const AccessibilityInitializer({
    required this.child,
    required SharedPreferencesService sharedPreferencesService,
    required AccessibilitySettingsCollection accessibilitySettingsCollection,
    super.key,
  })  : _sharedPreferencesService = sharedPreferencesService,
        _accessibilitySettingsCollection = accessibilitySettingsCollection,
        _isAsync = false,
        _loadingBuilder = null,
        _cacheOptions = null;

  /// Creates an [AccessibilityInitializer] that handles all async
  /// initialization internally.
  ///
  /// This constructor eliminates the need to await initialization before
  /// calling `runApp()`. Instead, it shows a loading widget while
  /// initializing.
  ///
  /// - [child]: The widget to display after initialization completes.
  /// - [loadingBuilder]: Optional builder for a custom loading widget.
  ///   Defaults to a centered [CircularProgressIndicator].
  /// - [cacheOptions]: Optional [SharedPreferencesWithCacheOptions] for
  ///   configuring the shared preferences cache.
  ///
  /// Example:
  /// ```dart
  /// void main() {
  ///   runApp(
  ///     AccessibilityInitializer.async(
  ///       loadingBuilder: (context) => const SplashScreen(),
  ///       child: MyApp(),
  ///     ),
  ///   );
  /// }
  /// ```
  const AccessibilityInitializer.async({
    required this.child,
    WidgetBuilder? loadingBuilder,
    SharedPreferencesWithCacheOptions? cacheOptions,
    super.key,
  })  : _sharedPreferencesService = null,
        _accessibilitySettingsCollection = null,
        _isAsync = true,
        _loadingBuilder = loadingBuilder,
        _cacheOptions = cacheOptions;

  /// The service used to store and retrieve accessibility settings
  /// in the local storage.
  ///
  /// Only used when not in async mode.
  final SharedPreferencesService? _sharedPreferencesService;

  /// The accessibility settings collection
  /// that will be provided to the child.
  ///
  /// Only used when not in async mode.
  final AccessibilitySettingsCollection? _accessibilitySettingsCollection;

  /// Whether this initializer uses async initialization.
  final bool _isAsync;

  /// Optional builder for a custom loading widget.
  final WidgetBuilder? _loadingBuilder;

  /// Optional cache options for shared preferences.
  final SharedPreferencesWithCacheOptions? _cacheOptions;

  /// The child widget from which the accessibility
  /// settings will be provided.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (_isAsync) {
      return _AsyncAccessibilityInitializer(
        loadingBuilder: _loadingBuilder,
        cacheOptions: _cacheOptions,
        child: child,
      );
    }

    return SharedPreferencesInherited(
      sharedPreferencesService: _sharedPreferencesService!,
      child: AccessibilitySettingsInherited(
        viewModel:
            AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
          accessibilitySettingsCollection: _accessibilitySettingsCollection!,
        ),
        child: child,
      ),
    );
  }
}

/// Internal stateful widget that handles async initialization.
class _AsyncAccessibilityInitializer extends StatefulWidget {
  const _AsyncAccessibilityInitializer({
    required this.child,
    this.loadingBuilder,
    this.cacheOptions,
  });

  final Widget child;
  final WidgetBuilder? loadingBuilder;
  final SharedPreferencesWithCacheOptions? cacheOptions;

  @override
  State<_AsyncAccessibilityInitializer> createState() =>
      _AsyncAccessibilityInitializerState();
}

class _AsyncAccessibilityInitializerState
    extends State<_AsyncAccessibilityInitializer> {
  late Future<_InitializedComponents> _initFuture;
  late _InitializedComponents _components;

  @override
  void initState() {
    super.initState();
    _components = (
      service: const SharedPreferencesServiceNoOp(),
      settings: a11yDefaultSettings
    );
    _initFuture = _initialize();
  }

  Future<_InitializedComponents> _initialize() async {
    final sharedPrefs = await createSharedPreferencesWithCache(
      cacheOptions: widget.cacheOptions,
    );
    final service = SharedPreferencesServiceWithCache(sharedPrefs);
    final settings = await service.getLocalStorageAccessibilitySettings();
    return (service: service, settings: settings);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<_InitializedComponents>(
        future: _initFuture,
        builder: (context, snapshot) {
          if (widget.loadingBuilder case final loadingWidgetBuilder?
              when snapshot.connectionState == ConnectionState.waiting) {
            return loadingWidgetBuilder.call(context);
          }
          if (snapshot.data case final components?) {
            _components = components;
          }
          return SharedPreferencesInherited(
            sharedPreferencesService: _components.service,
            child: AccessibilitySettingsInherited(
              viewModel: AccessibilitySettingsViewModel
                  .fromAccessibilitySettingsCollection(
                accessibilitySettingsCollection: _components.settings,
              ),
              child: widget.child,
            ),
          );
        },
      );
}
