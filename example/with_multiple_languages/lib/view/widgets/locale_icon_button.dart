import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:with_multiple_languages/constants/data/country.dart'
    show allCountries;
import 'package:with_multiple_languages/models/country.dart' show Country;
import 'package:with_multiple_languages/view/providers/locale_inherited.dart';
import 'package:with_multiple_languages/view/widgets/dropdown_menu_dialog.dart';

/// {@template LocaleIconButton}
/// A button that is used to change the locale of the application.
/// {@endtemplate}
class LocaleIconButton extends StatelessWidget {
  /// {@macro LocaleIconButton}
  const LocaleIconButton({super.key});

  /// {@template sortedCountries}
  /// A list of all countries sorted by name.
  ///
  /// This is computed only once for better performance.
  /// There is better way to store this list but it goes
  /// beyond the scope of this example.
  /// {@endtemplate}
  static final Iterable<Country> _sortedCountries =
      allCountries.toList()..sort((a, b) => a.name.compareTo(b.name));

  Future<void> _showDialogToChangeLocale(BuildContext context) async {
    final localeInherited = LocaleInherited.of(context);
    final currentLanguageCode = localeInherited.locale.value?.languageCode;
    final currentCountry =
        allCountries
            .where((country) => country.languageCode == currentLanguageCode)
            .firstOrNull;
    final newCountry = await showAdaptiveDialog<Country>(
      context: context,
      builder:
          (context) => FilterableListDialog<Country>(
            title: 'Change language',
            entries: _sortedCountries,
            initialValue: currentCountry,
          ),
    );
    if (newCountry == null) {
      return;
    }
    localeInherited.locale.value = Locale(
      newCountry.languageCode,
      newCountry.countryCode,
    );
  }

  @override
  Widget build(BuildContext context) => IconButton(
    style: IconButton.styleFrom(foregroundColor: context.colorScheme.onPrimary),
    icon: const Icon(
      Icons.emoji_flags_outlined,
      semanticLabel: 'Change language',
    ),
    onPressed: () async => _showDialogToChangeLocale(context),
  );

  @visibleForTesting
  /// {@macro sortedCountries}
  static Iterable<Country> get sortedCountries => _sortedCountries;
}
