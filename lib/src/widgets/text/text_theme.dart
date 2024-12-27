import 'package:flutter/material.dart';

enum FLTextTheme {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
}

extension FLTextThemeExtension on FLTextTheme? {
  TextStyle? toTextStyle(BuildContext context) => switch (this) {
        FLTextTheme.displayLarge => Theme.of(context).textTheme.displayLarge,
        FLTextTheme.displayMedium => Theme.of(context).textTheme.displayMedium,
        FLTextTheme.displaySmall => Theme.of(context).textTheme.displaySmall,
        FLTextTheme.headlineLarge => Theme.of(context).textTheme.headlineLarge,
        FLTextTheme.headlineMedium => Theme.of(context).textTheme.headlineMedium,
        FLTextTheme.headlineSmall => Theme.of(context).textTheme.headlineSmall,
        FLTextTheme.titleLarge => Theme.of(context).textTheme.titleLarge,
        FLTextTheme.titleMedium => Theme.of(context).textTheme.titleMedium,
        FLTextTheme.titleSmall => Theme.of(context).textTheme.titleSmall,
        FLTextTheme.labelLarge => Theme.of(context).textTheme.labelLarge,
        FLTextTheme.labelMedium => Theme.of(context).textTheme.labelMedium,
        FLTextTheme.labelSmall => Theme.of(context).textTheme.labelSmall,
        FLTextTheme.bodyLarge => Theme.of(context).textTheme.bodyLarge,
        FLTextTheme.bodyMedium => Theme.of(context).textTheme.bodyMedium,
        FLTextTheme.bodySmall => Theme.of(context).textTheme.bodySmall,
        _ => null,
      };
}
