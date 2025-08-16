/// The `accessibility` package.
///
/// This package contains a set of settings
/// for the accessibility of an application.
library accessibility;

import 'package:flutter/foundation.dart' show visibleForTesting;

export 'package:accessibility/src/core/constants/colors.dart'
    show kMaterialAccentColors, kMaterialColors, kMaterialFullColors;
export 'package:accessibility/src/core/constants/sizes_config.dart'
    show IconSize, PaddingSize;
export 'package:accessibility/src/core/constants/storage_config.dart'
    show LocalStorageDefaultValues, LocalStorageKeys;
export 'package:accessibility/src/core/constants/text_theme_config.dart'
    show kTextThemeMergableEnglishLike2021;
export 'package:accessibility/src/core/extensions/accessible_theme_data.dart'
    show AccessibleThemeData;
export 'package:accessibility/src/core/extensions/build_context.dart'
    show BuildContextControls;
export 'package:accessibility/src/core/extensions/colors.dart'
    show ColorTransformation;
export 'package:accessibility/src/core/l10n/generated/app_localizations.dart'
    show AccessibilityLocalizations;
export 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart'
    show AccessibilitySettingsCollection;
export 'package:accessibility/src/core/utils/accessible_height.dart'
    show AccessibleHeight;
export 'package:accessibility/src/core/utils/shared_preferences.dart'
    show createSharedPreferencesWithCache;
export 'package:accessibility/src/models/config/accessibility_settings_configuration.dart'
    show AccessibilitySettingsConfiguration;
export 'package:accessibility/src/models/settings/color/color_profile.dart'
    show ColorProfileLevel;
export 'package:accessibility/src/models/settings/color/color_settings.dart'
    show ColorSettings;
export 'package:accessibility/src/models/settings/text/text_settings.dart'
    show TextSettings;
export 'package:accessibility/src/models/settings/theme/theme_profile.dart'
    show ThemeProfileLevel;
export 'package:accessibility/src/models/themes/app_themes.dart' show AppThemes;
export 'package:accessibility/src/services/shared_preferences_service.dart'
    show SharedPreferencesService;
export 'package:accessibility/src/services/shared_preferences_service_legacy.dart'
    show SharedPreferencesServiceLegacy;
export 'package:accessibility/src/services/shared_preferences_service_with_cache.dart'
    show SharedPreferencesServiceWithCache;
export 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart'
    show AccessibilitySettingsInherited;
export 'package:accessibility/src/view/providers/shared_preferences_inherited.dart'
    show SharedPreferencesInherited;
@visibleForTesting
export 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart'
    show AccessibilitySettingsViewModel;
export 'package:accessibility/src/view/widgets/components/restore_settings_button.dart'
    show RestoreSettingsButton;
export 'package:accessibility/src/view/widgets/components/settings_group.dart'
    show SettingsGroup;
export 'package:accessibility/src/view/widgets/shared/accessibility_initializer.dart'
    show AccessibilityInitializer;
export 'package:accessibility/src/view/widgets/shared/accessibility_settings.dart'
    show AccessibilitySettings;
export 'package:accessibility/src/view/widgets/shared/accessible_material_app.dart'
    show AccessibleMaterialApp;
export 'package:accessibility/src/view/widgets/shared/accessible_sized_box.dart'
    show AccessibleSizedBox;
export 'package:accessibility/src/view/widgets/shared/accessible_text.dart'
    show AccessibleText;
export 'package:accessibility/src/view/widgets/shared/accessible_widget_builder.dart'
    show AccessibleWidgetBuilder;
export 'package:accessibility/src/view/widgets/shared/effects_setting_listenable_builder.dart'
    show EffectsSettingListenableBuilder;
export 'package:accessibility/src/view/widgets/shared/read_more_text.dart'
    show ReadMoreText;
export 'package:accessibility/src/view/widgets/shared/read_more_text_button.dart'
    show ReadMoreTextButton;
export 'package:accessibility/src/view/widgets/shared/text_raw_magnifier.dart'
    show TextRawMagnifier;
export 'package:accessibility/src/view/widgets/shared/theme_settings_builder.dart'
    show ThemeSettingsBuilder;
