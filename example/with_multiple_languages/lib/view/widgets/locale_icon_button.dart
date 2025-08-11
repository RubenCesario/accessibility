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

  @override
  Widget build(BuildContext context) => IconButton(
    style: IconButton.styleFrom(foregroundColor: context.colorScheme.onPrimary),
    icon: const Icon(
      Icons.emoji_flags_outlined,
      semanticLabel: 'Change language',
    ),
    onPressed: () async {
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
              entries:
                  allCountries.toList()
                    ..sort((a, b) => a.name.compareTo(b.name)),
              initialValue: currentCountry,
            ),
      );
      if (newCountry == null) {
        return;
      }
      localeInherited.locale.value = Locale(newCountry.languageCode);
    },
  );
}
