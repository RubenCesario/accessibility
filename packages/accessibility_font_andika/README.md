# accessibility_font_andika

The [Andika](https://software.sil.org/andika/) typeface, designed by SIL
for readability, packaged for the accessibility package family. The four
faces (regular, bold, italic, bold italic) ship unmodified under the SIL
Open Font License.

## Installation

```bash
flutter pub add accessibility_font_andika
```

## Usage

```dart
final viewModel = AccessibilitySettingsViewModel(
  repository: repository,
  accessibleFonts: const [AndikaFont.font],
);
```

The settings panels then offer the font, and the theme applies it when the
user enables it. Outside the family, the family name is
`AndikaFont.font.qualifiedFamily`.

## Licence

The four Andika faces are distributed under the
[SIL Open Font License 1.1](https://scripts.sil.org/OFL); the full text
ships with the package at `lib/fonts/OFL.txt`. The package's own Dart code
(`AndikaFont`) is MIT-licensed, see `LICENSE`.

## See also

- The family: <https://github.com/RubenCesario/accessibility#readme>
- Migrating from 1.x: <https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md>
