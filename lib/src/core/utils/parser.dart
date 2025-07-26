import 'package:flutter/material.dart' show TextAlign, ThemeMode;

/// Parses a [String] to a [ThemeMode].
ThemeMode parseThemeMode(String key) => ThemeMode.values.firstWhere(
      (themeMode) => themeMode.name == key,
      orElse: () => ThemeMode.system,
    );

/// Parses a [String] to a [TextAlign].
TextAlign parseTextAlign(String key) => TextAlign.values.firstWhere(
      (textAlign) => textAlign.name == key,
      orElse: () => TextAlign.start,
    );
