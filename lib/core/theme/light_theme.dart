import 'package:movie_app/imports.dart';

import 'src/appbar_theme.dart';
import 'src/input_decoration_theme.dart';
import 'src/text_theme.dart';
import 'src/dialog_theme.dart';

ThemeData light(BuildContext context) => ThemeData(
  fontFamily: 'Poppins',
  useMaterial3: true,
  brightness: Brightness.light,
  sliderTheme: SliderThemeData(
    trackHeight: 1.0,
    activeTrackColor: primaryColor,
    thumbColor: primaryColor,
    overlayColor: primaryColor.withOpacity(0.3),
    valueIndicatorColor: primaryColor,
    valueIndicatorTextStyle: bodySmall(context).copyWith(color: textColorBlack),
  ),
  colorScheme: ColorScheme.fromSeed(
    primary: primaryColor,
    seedColor: primaryColor,
    onPrimaryContainer: containerColorLight,
    onPrimary: textColorWhite,
    surface: backgroundColorLight,
    onSurface: textColorBlack,
    error: redColor,
  ).copyWith(
    //
  ),
  textTheme: textThemeLight(context),
  appBarTheme: appBarThemeLight(context),
  inputDecorationTheme: inputDecorationThemeLight(context),
  dialogTheme: dialogTheme(context),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      side: BorderSide(color: blueColor),
      shape: RoundedRectangleBorder(borderRadius: borderRadiusSmall),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: blueColor,
    shadowColor: Colors.transparent,
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    labelStyle: bodySmall(context).copyWith(color: textColorWhite),
    secondaryLabelStyle: bodySmall(context).copyWith(color: textColorWhite),
    brightness: Brightness.light,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),

      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadiusSmall),
    ),
  ),
);
