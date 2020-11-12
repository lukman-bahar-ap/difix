import 'package:flutter/material.dart';
import 'base_colors.dart';

class BaseFont {
  BaseFont._();
  static const String montserrat_Bold = 'MontserratBold';
  static const String montserrat_Reg = 'Montserrat';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: montserrat_Reg,
    fontWeight: FontWeight.normal,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: montserrat_Bold,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: montserrat_Bold,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: montserrat_Reg,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: textColor,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: montserrat_Bold,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: textColor,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: montserrat_Reg,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: textColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: montserrat_Bold,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
  static const TextStyle caption_second = TextStyle(
    fontFamily: montserrat_Reg,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: textColor,
  );
}