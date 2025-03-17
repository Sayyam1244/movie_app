import 'package:movie_app/imports.dart';

DialogTheme dialogTheme(BuildContext context) => DialogTheme(
  shape: RoundedRectangleBorder(borderRadius: borderRadiusDefault),
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
);
