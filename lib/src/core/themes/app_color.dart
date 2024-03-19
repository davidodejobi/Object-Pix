import 'package:flutter/material.dart';

class AppColors {
  static const int secondaryColorValue = 0xFF3300CC;
  static const int primaryColorValue = 0xFF131212;
  static const int tertiaryColorValue = 0xFF4FBF67;
  //? Brand Colors
  static MaterialColor primaryColor = const MaterialColor(
    primaryColorValue,
    <int, Color>{
      800: Color(0xFF0E4E72),
      500: Color(primaryColorValue),
      300: Color(0xff222121),
      50: Color(0x4C44A9E2),
    },
  );

  static MaterialColor secondaryColor = const MaterialColor(
    secondaryColorValue,
    <int, Color>{
      500: Color(secondaryColorValue),
      100: Color(0xFFC0B0EF),
      50: Color(0xFFEBE6FA),
    },
  );
  static MaterialColor tertiaryColor = const MaterialColor(
    tertiaryColorValue,
    <int, Color>{
      800: Color(0xFF004225),
      500: Color(tertiaryColorValue),
      300: Color(0xFFD9F9E0),
      200: Color(0xFFE5ECE9),
      100: Color(0xFFF0FDF4),
      50: Color(0xFFE5F4D9),
    },
  );

  //? Utility Colors
  static const Color primaryTextColor = Color(0xFF131212);
  static const Color secondaryTextColor = Color(0xFF343333);
  // static const Color greyTextColor = Color(0xFF797979);
  static MaterialColor greyTextColor = const MaterialColor(
    0xFF797979,
    <int, Color>{
      50: Color(0xFF575758),
      100: Color(0xFF575758),
      200: Color(0xFFC1C1C1),
      300: Color(0xFF575758),
      400: Color(0xFF575758),
      500: Color(0xFF797979),
      600: Color(0xFFC1C1C1),
      700: Color(0xFF575758),
      800: Color(0xFF4F4E4E),
      900: Color(0xFF575758),
    },
  );
  static const Color mildBlackColor = Color(0xFF403F3F);
  static const Color primaryBackgroundColor = Color(0xFFFFFFFF);
  static const Color secondaryBackgroundColor = Color(0xFFFBFBFB);
  static const Color tertiaryBackgroundColor = Color(0xFFfafafa);
  static const Color tealBlue = Color(0xFF0E4372);

  //? Accent Colors
  static const Color accentColorOne = Color(0xFF8DB41D);

  //? Semantic Colors
  static MaterialColor semanticSuccessColor = const MaterialColor(
    0xFF0ECC00,
    <int, Color>{
      50: Color(0xFFE7FAE6),
      100: Color(0xFFB4EFB0),
      200: Color(0xFF90E88A),
      300: Color(0xFF5EDD54),
      400: Color(0xFF3ED633),
      500: Color(0xFF0ECC00),
      600: Color(0xFF0DBA00),
      700: Color(0xFF0A9100),
      800: Color(0xFF087000),
      900: Color(0xFF065600),
    },
  );
  static const Color semanticCautionColor = Color(0xFFFFB44F);
  static MaterialColor semanticFailedColor = const MaterialColor(
    0xFFCC0011,
    <int, Color>{
      50: Color(0xFFFAE6E7),
      100: Color(0xFFEFB0B5),
      200: Color(0xFFE88A92),
      300: Color(0xFFDD5460),
      400: Color(0xFFD63341),
      500: Color(0xFFCC0011),
      600: Color(0xFFBA000F),
      700: Color(0xFF91000C),
      800: Color(0xFF700009),
      900: Color(0xFF560007),
    },
  );

  //? Custom Colors
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color dividerColor = Color(0xFFDFDFDF);
  static MaterialColor greyColor = const MaterialColor(
    0xFFF5F5F5,
    <int, Color>{
      50: Color(0xFF575758),
      100: Color(0xFF575758),
      200: Color(0xFFC1C1C1),
      300: Color(0xFF575758),
      400: Color(0xFF575758),
      500: Color(0xFFF5F5F5),
      600: Color(0xFFC1C1C1),
      700: Color(0xFFA6A5A5),
      800: Color(0xFF575758),
      900: Color(0xFF575758),
    },
  );
}
