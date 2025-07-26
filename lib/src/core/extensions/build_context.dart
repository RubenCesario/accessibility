import 'package:accessibility/src/core/l10n/generated/app_localizations.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:flutter/material.dart';

/// Adds a set of utility methods on [BuildContext].
extension BuildContextControls on BuildContext {
  /// Check wherever the application is on dark mode or not.
  ///
  /// The ThemeMode of an application may be [ThemeMode.system],
  /// [ThemeMode.dark] and [ThemeMode.light]. However the [ThemeMode.system]
  /// can be either dark or light based on the local configuration of the
  /// device of the user.
  ///
  /// A [ThemeData] object created with the **ThemeData.from()**
  /// constructor has an official way to know if the theme is on
  /// dark mode, checking the brightness property of its
  /// colorScheme property.
  bool get isDarkMode => Theme.maybeBrightnessOf(this) == Brightness.dark;

  /// Returns the [AccessibilityLocalizations] instance with localized strings.
  ///
  /// This reduces the boilerplate code needed
  /// to localize the text in the app.
  ///
  /// Rather than writing...
  ///
  /// ```dart
  /// final text = AppLocalizations.of(context).appTitle;
  /// ```
  ///
  /// ... you should use this shorter syntax:
  ///
  /// ```dart
  /// final text = context.l10na.appTitle;
  /// ```
  AccessibilityLocalizations get l10na => AccessibilityLocalizations.of(this);

  /// Returns the current [Orientation] instance of the context.
  ///
  /// The MediaQuery.of(context).orientation does not count special
  /// condition such as foldable device, multiple screens, etc.
  Orientation get orientation {
    final deviceSize = MediaQuery.sizeOf(this);
    return deviceSize.width > deviceSize.height
        ? Orientation.landscape
        : Orientation.portrait;
  }

  /// Returns the current [ColorScheme] instance of the context.
  ///
  /// This reduces the boilerplate code needed
  /// to obtain the current color scheme.
  ///
  /// Rather than writing...
  ///
  /// ```dart
  /// final color = Theme.of(context).colorScheme.primaryColor;
  /// ```
  ///
  /// ... you should use this shorter syntax:
  ///
  /// ```dart
  /// final color = context.colorScheme.primaryColor;
  /// ```
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the current [TextTheme] instance of the context.
  ///
  /// This reduces the boilerplate code needed
  /// to obtain the current text theme.
  ///
  /// Rather than writing...
  ///
  /// ```dart
  /// final color = Theme.of(context).textTheme.bodyMedium;
  /// ```
  ///
  /// ... you should use this shorter syntax:
  ///
  /// ```dart
  /// final color = context.textTheme.bodyMedium;
  /// ```
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Whether the user is using an accessibility service like
  /// TalkBack or VoiceOver to interact with the application.
  bool get isAccessibleNavigationEnabled =>
      MediaQuery.accessibleNavigationOf(this);

  /// Returns the current [AccessibilitySettingsConfiguration]
  /// instance of the context.
  AccessibilitySettingsConfiguration get a11yConfig =>
      AccessibilitySettingsConfigurationInherited.of(this).configuration;
}
