import 'package:flutter/material.dart';

/// The configuration of the text theme of the application.
///
/// The font sizes, weights, and letter spacings match the
/// 2021 Material Design 3 specification.
/// * Docs: https://m3.material.io/styles/typography/type-scale-tokens
/// * Schema: https://lh3.googleusercontent.com/Yvngs5mQSjXa_9T4X3JDucO62c5hdZHPDa7qeRH6DsJQvGr_q7EBrTkhkPiQd9OeR1v_Uk38Cjd9nUpP3nevDyHpKWuXSfQ1Gq78bOnBN7sr=s0
///
/// This theme is equal to [Typography.englishLike2021],
/// with the following override:
/// - the 'inherit' property set to true to permits the correct behavior of
/// copywith() & merge() with other TextStyles() objects. With
/// 'inherit' set to false, the copywith() & merge() methods
/// works only if the other TextStyles() objects have all
/// their properties set. If two TextStyles() objects have
/// different 'inherit' properties, unspecified fields in both
/// TextStyles() objects may observe abrupt value changes as a result of the
/// change of the 'inherit' property during the operation, causing "jump"s in
/// the transition.
/// In general, TextStyle.lerp only works well when both TextStyles have the
/// same "inherit" value, and specify the same fields.
const kTextThemeMergableEnglishLike2021 = TextTheme(
  displayLarge: TextStyle(
    debugLabel: 'englishLike displayLarge 2021',
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  displayMedium: TextStyle(
    debugLabel: 'englishLike displayMedium 2021',
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  displaySmall: TextStyle(
    debugLabel: 'englishLike displaySmall 2021',
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  headlineLarge: TextStyle(
    debugLabel: 'englishLike headlineLarge 2021',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  headlineMedium: TextStyle(
    debugLabel: 'englishLike headlineMedium 2021',
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.29,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  headlineSmall: TextStyle(
    debugLabel: 'englishLike headlineSmall 2021',
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  titleLarge: TextStyle(
    debugLabel: 'englishLike titleLarge 2021',
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.27,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  titleMedium: TextStyle(
    debugLabel: 'englishLike titleMedium 2021',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  titleSmall: TextStyle(
    debugLabel: 'englishLike titleSmall 2021',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  labelLarge: TextStyle(
    debugLabel: 'englishLike labelLarge 2021',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  labelMedium: TextStyle(
    debugLabel: 'englishLike labelMedium 2021',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  labelSmall: TextStyle(
    debugLabel: 'englishLike labelSmall 2021',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  bodyLarge: TextStyle(
    debugLabel: 'englishLike bodyLarge 2021',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  bodyMedium: TextStyle(
    debugLabel: 'englishLike bodyMedium 2021',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  bodySmall: TextStyle(
    debugLabel: 'englishLike bodySmall 2021',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
);
