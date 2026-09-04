/// Pure Dart core of the accessibility package family.
///
/// Contains the settings models, the settings repository and the storage
/// service contract. UI, persistence, translations and fonts live in
/// sibling packages.
library;

export 'src/data/repositories/accessibility_settings_status.dart'
    show
        AccessibilitySettingsIdle,
        AccessibilitySettingsLoadFailed,
        AccessibilitySettingsLoaded,
        AccessibilitySettingsLoading,
        AccessibilitySettingsStatus;
export 'src/data/services/accessibility_storage_service.dart'
    show AccessibilityStorageService;
export 'src/domain/models/accessibility_settings.dart'
    show AccessibilitySettings;
export 'src/domain/models/accessibility_theme_mode.dart'
    show AccessibilityThemeMode;
export 'src/domain/models/accessible_font.dart' show AccessibleFont;
export 'src/domain/models/color_profile.dart' show ColorProfile;
export 'src/domain/models/color_profile_level.dart' show ColorProfileLevel;
export 'src/domain/models/color_settings.dart' show ColorSettings;
export 'src/domain/models/effects_mode.dart' show EffectsMode;
export 'src/domain/models/text_align_mode.dart' show TextAlignMode;
export 'src/domain/models/text_settings.dart' show TextSettings;
export 'src/domain/models/theme_profile.dart' show ThemeProfile;
export 'src/domain/models/theme_profile_level.dart' show ThemeProfileLevel;
