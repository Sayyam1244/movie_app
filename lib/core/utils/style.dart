import 'package:flutter/material.dart';

// Padding
EdgeInsets paddingSmall = EdgeInsets.all(10);
EdgeInsets paddingMedium = EdgeInsets.all(14);
EdgeInsets paddingDefault = EdgeInsets.all(20);
EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: 20);

// Spacing
double spacingExtraSmall = 4;
double spacingSmall = 8;
double spacingMedium = 12;
double spacingDefault = 16;
double spacingLarge = 24;
double spacingExtraLarge = 32;

double get radiusSmall => 8;
double get radiusDefault => 12;
double get radiusCircular => 32;

BorderRadius get borderRadiusSmall => BorderRadius.circular(radiusSmall);
BorderRadius get borderRadiusDefault => BorderRadius.circular(radiusDefault);
BorderRadius get borderRadiusCircular => BorderRadius.circular(radiusCircular);

// Text Styles (using Theme.of(context).textTheme)
TextStyle displayLarge(BuildContext context) =>
    Theme.of(context).textTheme.displayLarge!;
TextStyle displayMedium(BuildContext context) =>
    Theme.of(context).textTheme.displayMedium!;
TextStyle displaySmall(BuildContext context) =>
    Theme.of(context).textTheme.displaySmall!;
TextStyle headlineLarge(BuildContext context) =>
    Theme.of(context).textTheme.headlineLarge!;
TextStyle headlineMedium(BuildContext context) =>
    Theme.of(context).textTheme.headlineMedium!;
TextStyle headlineSmall(BuildContext context) =>
    Theme.of(context).textTheme.headlineSmall!;
TextStyle titleLarge(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!;
TextStyle titleMedium(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!;
TextStyle titleSmall(BuildContext context) =>
    Theme.of(context).textTheme.titleSmall!;
TextStyle bodyLarge(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!;
TextStyle bodyMedium(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!;
TextStyle bodySmall(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!;
TextStyle labelLarge(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge!;
TextStyle labelMedium(BuildContext context) =>
    Theme.of(context).textTheme.labelMedium!;
TextStyle labelSmall(BuildContext context) =>
    Theme.of(context).textTheme.labelSmall!;
