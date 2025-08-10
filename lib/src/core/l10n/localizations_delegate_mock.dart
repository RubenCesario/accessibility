import 'dart:async';

import 'package:accessibility/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/widgets.dart' show Locale, LocalizationsDelegate;

/// A mock [LocalizationsDelegate] for [AccessibilityLocalizations].
@visibleForTesting
class AccessibilityLocalizationsDelegateMock
    extends LocalizationsDelegate<AccessibilityLocalizations> {
  /// Creates a mock [LocalizationsDelegate] for [AccessibilityLocalizations].
  const AccessibilityLocalizationsDelegateMock();

  @override
  Future<AccessibilityLocalizations> load(Locale locale) async =>
      lookupAccessibilityLocalizations(locale);

  @override
  bool isSupported(Locale locale) => AccessibilityLocalizations.supportedLocales
      .map((e) => e.languageCode)
      .toList()
      .contains(locale.languageCode);

  @override
  bool shouldReload(AccessibilityLocalizationsDelegateMock old) => false;
}
