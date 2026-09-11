import 'package:accessibility_material/accessibility_material.dart';
import 'package:material_ui/material_ui.dart';
import 'package:multiple_languages_example/locale/country.dart';
import 'package:multiple_languages_example/locale/locale_scope.dart';

/// An app-bar button that opens a searchable list of the languages and
/// sets the app locale.
final class LanguagePicker extends StatelessWidget {
  /// Creates the button.
  const LanguagePicker({super.key});

  /// The countries sorted by name.
  static final List<Country> sortedCountries = [...allCountries]
    ..sort((a, b) => a.name.compareTo(b.name));

  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: 'Language',
    icon: const Icon(Icons.language),
    onPressed: () async {
      final locale = LocaleScope.of(context);
      final picked = await showDialog<Country>(
        context: context,
        builder: (context) => _LanguageDialog(current: locale.value),
      );
      if (picked != null) {
        locale.value = picked.locale;
      }
    },
  );
}

class _LanguageDialog extends StatefulWidget {
  const _LanguageDialog({required this.current});

  final Locale? current;

  @override
  State<_LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<_LanguageDialog> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final matches = [
      for (final country in LanguagePicker.sortedCountries)
        if (country.name.toLowerCase().contains(_query.toLowerCase())) country,
    ];
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Search a language',
              border: InputBorder.none,
            ),
            onChanged: (value) => setState(() => _query = value),
          ),
          leading: const CloseButton(),
        ),
        body: ListView.builder(
          itemCount: matches.length,
          itemBuilder: (context, index) {
            final country = matches[index];
            final selected = country.locale == widget.current;
            return ListTile(
              title: AccessibleText(country.displayName),
              selected: selected,
              trailing: selected ? const Icon(Icons.check) : null,
              onTap: () => Navigator.of(context).pop(country),
            );
          },
        ),
      ),
    );
  }
}
