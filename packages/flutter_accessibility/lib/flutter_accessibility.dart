/// Flutter widgets layer of the accessibility package family.
///
/// Provides the [AccessibilitySettingsViewModel], the [AccessibilityScope]
/// that exposes it to the widget tree, builders that react to changes, and
/// accessible widgets, all built on `package:flutter/widgets.dart` only.
/// Re-exports `package:accessibility`.
library;

import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

export 'package:accessibility/accessibility.dart';

export 'src/ui/core/accessible_color.dart' show AccessibleColor;
export 'src/ui/core/accessible_text_style.dart' show AccessibleTextStyle;
export 'src/ui/layout/accessible_height.dart' show AccessibleHeight;
export 'src/ui/layout/widgets/accessible_sized_box.dart'
    show AccessibleSizedBox;
export 'src/ui/layout/widgets/accessible_widget_builder.dart'
    show AccessibleWidgetBuilder;
export 'src/ui/settings/accessibility_settings_configuration.dart'
    show AccessibilitySettingsConfiguration;
export 'src/ui/settings/accessibility_settings_style.dart'
    show AccessibilitySettingsStyle;
export 'src/ui/settings/view_model/accessibility_settings_view_model.dart'
    show AccessibilitySettingsViewModel;
export 'src/ui/settings/widgets/accessibility_scope.dart'
    show AccessibilityScope;
export 'src/ui/settings/widgets/accessibility_settings_builder.dart'
    show AccessibilitySettingsBuilder, AccessibilitySettingsWidgetBuilder;
export 'src/ui/settings/widgets/effects_builder.dart'
    show EffectsBuilder, EffectsWidgetBuilder;
export 'src/ui/text/widgets/accessible_text.dart' show AccessibleText;
export 'src/ui/text/widgets/collapsible_text.dart'
    show CollapsibleText, CollapsibleToggleBuilder;
export 'src/ui/text/widgets/text_raw_magnifier.dart' show TextRawMagnifier;
