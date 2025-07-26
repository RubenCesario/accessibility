import 'package:accessibility/src/core/constants/text_theme_config.dart';
import 'package:flutter/material.dart';

/// {@template AppThemes}
/// Defines a set of themes for the application.
///
/// Here are helpful-to-know words you'll see in the names of color roles:
///
/// - *Primary, Secondary, Tertiary*: accent color roles used to emphasize or
/// de-emphasize foreground elements.
/// - *Surface*: a role used for backgrounds and large,
/// low-emphasis areas of the screen.
/// - *Container*: roles used as a fill color for foreground elements like
/// buttons. They should not be used for text or icons.
/// - *On*: roles starting with this term indicate a color for text or icons on
/// top of its paired parent color. For example, on primary is used for text
/// and icons against the primary fill color.
/// - *Variant*: roles ending with this term offer a lower emphasis alternative
/// to its non-variant pair. For example, outline variant is a less emphasized
/// version of the outline color.
///
/// `---------------------- PRIMARY ----------------------`
///
/// Use primary roles for the most prominent components across the UI,
/// such as the FAB, high-emphasis buttons, and active states. Roles:
/// - Primary: high-emphasis fills, texts, and icons against surface;
/// - On primary: text and icons against primary;
/// - Primary container: standout fill color against surface,
/// for key components like FAB;
/// - On primary container: text and icons against primary container.
///
/// **Common Widgets**:
/// - for primary: high-emphasis [Text], [FilledButton], [OutlinedButton],
/// [ElevatedButton],
/// [TextButton], [IconButton], [Checkbox], [Radio], [Switch], [Slider];
/// - for primary container: [FloatingActionButton], [DatePickerDialog].
///
/// `---------------------- SECONDARY ----------------------`
///
/// Use secondary roles for less prominent components
/// in the UI such as filter chips. Roles:
/// - Secondary: less prominent fills, text, and icons against surface;
/// - On secondary: text and icons against secondary;
/// - Secondary container: less prominent fill color against surface,
/// for recessive components like tonal buttons;
/// - On secondary container: text and icons against secondary container.
///
/// **Common Widgets**:
/// - for secondary: [Text] less prominent, [IconButton], [Icon], [Chip],
/// [ElevatedButton],
/// - for secondary container: tonal [ElevatedButton].
///
/// `---------------------- TERTIARY ----------------------`
///
/// Use tertiary roles for contrasting accents that balance primary and
/// secondary colors or bring heightened attention to an element such as
/// an input field. Roles:
/// - Tertiary: complementary fills, text, and icons against surface;
/// - On tertiary: text and icons against tertiary;
/// - Tertiary container: complementary container color against surface,
/// for components like input fields;
/// - On tertiary container: text and icons against tertiary container.
/// Note: the tertiary color roles can be applied at the designer's discretion.
/// They're intended to support broader color expression.
///
/// **Common Widgets**:
/// - for tertiary: [Text] special, [IconButton], [Icon];
/// - for tertiary container: [Container], [TextField], [FormField].
///
/// `---------------------- ERROR ----------------------`
///
/// Use error roles to communicate error states, such as an incorrect
/// password entered into a text field. Roles:
/// - Error: attention-grabbing color against surface for fills,
/// icons, and text, indicating urgency;
/// - On error: text and icons against error;
/// - Error container: attention-grabbing fill color against surface;
/// - On error container: text and icons against error container.
///
/// **Common Widgets**:
/// Every error purpose [Widget] should be accompanied by an error color.
///
/// `---------------------- SURFACE ----------------------`
///
/// Use surface roles for more neutral backgrounds, and container colors
/// for components like cards, sheets, and dialogs.
///
/// There are three surface roles:
/// - Surface: default color for backgrounds;
/// - On surface: text and icons against any surface color;
/// - On surface variant: lower-emphasis color for text and
/// icons against any surface color.
///
/// There are also five surface container roles named based on their
/// level of emphasis:
/// - Surface container lowest: lowest-emphasis container color;
/// - Surface container low: low-emphasis container color;
/// - Surface container: default container color;
/// - Surface container high: high-emphasis container color;
/// - Surface container highest: highest-emphasis container color;
/// - Surface container is the default role, but the others are
/// especially helpful for creating hierarchy and nested containers
/// in layouts for expanded screens.
///
/// The most common combination of surface roles uses surface for
/// a background area and surface container for a navigation area.
/// By default, neutral-colored components such as navigation bars,
/// menus, or dialogs are mapped to specific surface container roles.
///
/// **Common Widgets**:
/// - for surface: [Scaffold], [Container], all backgrounds;
/// - for On Surface: [Text].
/// The On Surface color must be the default color of all [Text];
/// - for surface container low: [ElevatedButton], [Card];
/// - for surface container: [AppBar], [Drawer], [NavigationRail],
/// [BottomNavigationBar], [NavigationDrawer].
/// - for surface container high: [FloatingActionButton.extended],
/// [BottomSheet], [Dialog].
/// - for surface container highest: [TextField] background,
/// [Switch].
///
/// There are two add-on surface roles (see 'Fixed Accent & Add on'
/// before continue this chapter):
/// - Surface dim: dimmest surface color in light and dark themes;
/// - Surface bright: brightest surface color in light and dark themes.
/// While the default surface color automatically inverts between light
/// and dark themes (it’s a light color in light theme and it flips to a
/// dark color in dark theme), the surface bright and surface dim colors
/// invert in a slightly different way. More precisely, they keep their
/// relative brightness across both light and dark theme.
///
/// For example, in an interface using the default surface role, the mapped
/// area is the brightest in light theme and the dimmest in dark theme.
/// In an interface using the surface bright role, the mapped area is the
/// brightest in both light and dark theme.
///
/// `---------------------- INVERSE ----------------------`
///
/// Inverse roles are applied selectively to components to achieve colors
/// that are the reverse of those in the surrounding UI, creating a
/// contrasting effect. Roles:
/// - Inverse surface: background fills for elements which
/// contrast against surface;
/// - Inverse on surface: text and icons against inverse surface;
/// - Inverse primary: actionable elements, such as text buttons,
/// against inverse surface.
///
/// **Common Widgets**:
/// - Inverse surface: [SnackBar] background;
/// - Inverse on surface: [SnackBar] text;
/// - Inverse primary: [SnackBar] text button.
///
/// `---------------------- OUTLINE ----------------------`
///
/// There are two outline colors to be used against surface:
/// - Outline: important boundaries, such as a text field outline;
/// - Outline variant: decorative elements, such as dividers.
///
/// **Common Widgets**:
/// - Outline: [Container] border, [Chip] border, [SegmentedButton] border,
/// [TextField] outline;
/// - Outline variant: [Divider], [Card] border;
///
/// `---------------------- ADD ON COLOR ROLES ----------------------`
///
/// Most products won't need to use these add-on color roles.
/// However, some products require the greater flexibility and control
/// that add-on roles provide. If you aren't sure whether your product
/// should use the add-on roles, it probably shouldn't and you can ignore them.
///
/// **Primary fixed, secondary fixed, and tertiary fixed** are fill colors used
/// against surface. These colors maintain the same tone in light and dark
/// themes, as opposed to regular container colors, which change in tone
/// between these themes. The fixed color role may be used instead of the
/// equivalent container role in situations where such fixed behavior
/// is desired.
///
/// **The primary fixed dim, secondary fixed dim, and tertiary fixed dim** roles
/// provide a stronger, more emphasized tone relative to the equivalent fixed
/// color. They may be used where a deeper color but the same fixed
/// behavior is desired.
///
/// On fixed colors are used for text and icons which sit on top of the
/// corresponding Fixed color. For example, on primary fixed is used for text
/// and icons against the primary fixed color. The same usage applies for the
/// equivalent secondary and tertiary colors.
///
/// On fixed variant colors are used for text and icons needing lower emphasis
/// against the corresponding fixed color. For example, on primary fixed variant
/// is used for low emphasis text and icons against the primary fixed color.
/// The same usage applies for the equivalent secondary and tertiary colors.
///
/// For more informations about color:
/// - https://m3.material.io/styles/color/roles
/// - https://m3.material.io/styles/color/static/baseline#b5a485b5-ee5f-4890-b7a2-ead284121e37
///
/// Material Theme Editor:
/// - https://material-foundation.github.io/material-theme-builder/
/// {@endtemplate}
@immutable
final class AppThemes {
  /// {@macro AppThemes}
  const AppThemes({
    required this.lightTheme,
    required this.darkTheme,
    required this.lightHighContrastTheme,
    required this.darkHighContrastTheme,
    this.lightMediumContrastTheme,
    this.darkMediumContrastTheme,
    this.textTheme,
  });

  /// The light theme of this set of themes.
  final ThemeData lightTheme;

  /// The dark theme of this set of themes.
  final ThemeData darkTheme;

  /// The high contrast light theme of this set of themes.
  final ThemeData lightHighContrastTheme;

  /// The high contrast dark theme of this set of themes.
  final ThemeData darkHighContrastTheme;

  /// The medium contrast light theme of this set of themes.
  final ThemeData? lightMediumContrastTheme;

  /// The medium contrast dark theme of this set of themes.
  final ThemeData? darkMediumContrastTheme;

  /// The text theme of this set of themes.
  ///
  /// Defaults to a mergable [Typography.englishLike2021].
  final TextTheme? textTheme;

  /// Creates an [AppThemes] instance from a set of
  /// [ColorScheme]s.
  ///
  /// For the [TextTheme] a mergable [Typography.englishLike2021]
  /// text theme is used as base.
  ///
  /// {@macro AppThemes}
  factory AppThemes.fromColorSchemes({
    required ColorScheme lightColorScheme,
    required ColorScheme darkColorScheme,
    required ColorScheme highContrastLightColorScheme,
    required ColorScheme highContrastDarkColorScheme,
    ColorScheme? lightMediumContrastColorScheme,
    ColorScheme? darkMediumContrastColorScheme,
    TextTheme? textTheme,
  }) =>
      AppThemes(
        lightTheme: ThemeData.from(
          colorScheme: lightColorScheme,
          textTheme: textTheme ?? kTextThemeMergableEnglishLike2021,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.from(
          colorScheme: darkColorScheme,
          textTheme: textTheme ?? kTextThemeMergableEnglishLike2021,
          useMaterial3: true,
        ),
        lightHighContrastTheme: ThemeData.from(
          colorScheme: highContrastLightColorScheme,
          textTheme: textTheme ?? kTextThemeMergableEnglishLike2021,
          useMaterial3: true,
        ),
        darkHighContrastTheme: ThemeData.from(
          colorScheme: highContrastDarkColorScheme,
          textTheme: textTheme ?? kTextThemeMergableEnglishLike2021,
          useMaterial3: true,
        ),
        lightMediumContrastTheme: ThemeData.from(
          colorScheme: lightMediumContrastColorScheme ?? lightColorScheme,
          textTheme: textTheme ?? kTextThemeMergableEnglishLike2021,
          useMaterial3: true,
        ),
        darkMediumContrastTheme: ThemeData.from(
          colorScheme: darkMediumContrastColorScheme ?? darkColorScheme,
          textTheme: textTheme ?? kTextThemeMergableEnglishLike2021,
          useMaterial3: true,
        ),
      );

  /// Creates a copy of this [AppThemes] instance but with
  /// the given fields replaced with the new values.
  AppThemes copyWith({
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    ThemeData? lightMediumContrastTheme,
    ThemeData? darkMediumContrastTheme,
    ThemeData? lightHighContrastTheme,
    ThemeData? darkHighContrastTheme,
    TextTheme? textTheme,
  }) =>
      AppThemes(
        lightTheme: lightTheme ?? this.lightTheme,
        darkTheme: darkTheme ?? this.darkTheme,
        lightMediumContrastTheme:
            lightMediumContrastTheme ?? this.lightMediumContrastTheme,
        darkMediumContrastTheme:
            darkMediumContrastTheme ?? this.darkMediumContrastTheme,
        lightHighContrastTheme:
            lightHighContrastTheme ?? this.lightHighContrastTheme,
        darkHighContrastTheme:
            darkHighContrastTheme ?? this.darkHighContrastTheme,
        textTheme: textTheme ?? this.textTheme,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is AppThemes &&
        other.lightTheme == lightTheme &&
        other.darkTheme == darkTheme &&
        other.lightMediumContrastTheme == lightMediumContrastTheme &&
        other.darkMediumContrastTheme == darkMediumContrastTheme &&
        other.lightHighContrastTheme == lightHighContrastTheme &&
        other.darkHighContrastTheme == darkHighContrastTheme &&
        other.textTheme == textTheme;
  }

  @override
  int get hashCode =>
      lightTheme.hashCode ^
      darkTheme.hashCode ^
      lightMediumContrastTheme.hashCode ^
      darkMediumContrastTheme.hashCode ^
      lightHighContrastTheme.hashCode ^
      darkHighContrastTheme.hashCode ^
      textTheme.hashCode;

  @override
  String toString() => 'AppThemes(lightTheme: $lightTheme, '
      'darkTheme: $darkTheme, '
      'lightMediumContrastTheme: $lightMediumContrastTheme, '
      'darkMediumContrastTheme: $darkMediumContrastTheme, '
      'lightHighContrastTheme: $lightHighContrastTheme, '
      'darkHighContrastTheme: $darkHighContrastTheme, '
      'textTheme: $textTheme)';
}
