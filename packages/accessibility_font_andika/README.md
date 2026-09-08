# accessibility_font_andika

The [Andika](https://software.sil.org/andika/) typeface, designed by SIL
for readability, packaged for the accessibility package family. The four
faces (regular, bold, italic, bold italic) ship unmodified under the SIL
Open Font License.

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
