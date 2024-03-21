import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static const _urbanist = 'Montserrat';
  static TextStyle _createInterTextStyle({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.primaryTextColor,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: _urbanist,
      letterSpacing: letterSpacing,
    );
  }

  static TextTheme _createInterTextTheme({
    Color color = Colors.black,
  }) {
    return TextTheme(
      displayLarge: _createInterTextStyle(
        fontSize: 42.0,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      displayMedium: _createInterTextStyle(
          fontSize: 32.0, fontWeight: FontWeight.w600, color: color),
      displaySmall: _createInterTextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w500, color: color),
      headlineLarge: _createInterTextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w500, color: color),
      headlineMedium: _createInterTextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w400, color: color),
      headlineSmall: _createInterTextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: color),
      titleLarge: _createInterTextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: color),
      titleMedium: _createInterTextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: color),
      bodyLarge: _createInterTextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w400, color: color),
      bodyMedium: _createInterTextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w400, color: color),
      bodySmall: _createInterTextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: color),
      labelLarge: _createInterTextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.2,
      ),
      labelMedium: _createInterTextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.2,
      ),
      labelSmall: _createInterTextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.2,
      ),
    );
  }

  static OutlinedButtonThemeData createOutlinedButtonThemeData(
      Color foregroundColor) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        side: BorderSide.none,
        alignment: Alignment.center,
      ),
    );
  }

  static ElevatedButtonThemeData createElevatedButtonThemeData(
      Color backgroundColor, Color foregroundColor) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(.5.sw, 50.h)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: foregroundColor,
            fontFamily: _urbanist,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData createBottomNavigationBarThemeData(
    Color backgroundColor,
    Color selectedIconColor,
    Color unselectedLabelColor,
    Color selectedLabelColor,
  ) {
    return BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: selectedIconColor,
      ),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: TextStyle(
        color: unselectedLabelColor,
        fontFamily: _urbanist,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      selectedLabelStyle: TextStyle(
        color: selectedLabelColor,
        fontFamily: _urbanist,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      selectedItemColor: selectedIconColor,
    );
  }

  static IconThemeData createIconThemeData(Color color) {
    return IconThemeData(
      color: color,
    );
  }

  static ThemeData light({required bool material3}) {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        background: AppColors.primaryTextColor,
        primary: AppColors.greyColor.shade600,
        onPrimary: Colors.black, // header text color
        onSurface: AppColors.primaryTextColor, // body text color
      ),
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: AppColors.primaryTextColor,
        ),
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryColor,
      ),
      iconTheme: createIconThemeData(AppColors.whiteColor),
      scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
      textTheme: _createInterTextTheme(
        color: AppColors.primaryTextColor,
      ),
      chipTheme: ChipThemeData(
          backgroundColor: AppColors.primaryColor,
          selectedColor: AppColors.primaryColor,
          // secondarySelectedColor: AppColors.primaryColor,
          labelStyle: _createInterTextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          ),
          checkmarkColor: AppColors.whiteColor,
          secondaryLabelStyle: _createInterTextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          )),
      outlinedButtonTheme:
          createOutlinedButtonThemeData(AppColors.primaryColor),
      elevatedButtonTheme: createElevatedButtonThemeData(
          AppColors.primaryColor, AppColors.primaryBackgroundColor),
      bottomNavigationBarTheme: createBottomNavigationBarThemeData(
        AppColors.primaryBackgroundColor,
        AppColors.secondaryColor,
        AppColors.greyTextColor,
        AppColors.secondaryColor,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: AppColors.whiteColor,
      ),
    );
  }
}
