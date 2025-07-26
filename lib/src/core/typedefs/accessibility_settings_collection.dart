import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:flutter/material.dart' show ThemeMode;

/// {@template AccessibilitySettings}
/// A typedef that represents all accessibility settings.
/// {@endtemplate}
typedef AccessibilitySettingsCollection = ({
  ThemeMode themeMode,
  bool effectsAllowed,
  TextSettings textSettings,
  ColorSettings colorSettings,
});
