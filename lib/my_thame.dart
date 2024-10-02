import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';

class MyThemeData {
  static final ThemeData liteModeApp = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.blackColor, showUnselectedLabels: true),
    canvasColor: AppColor.primaryLight_Color,
    primaryColor: AppColor.primaryLight_Color,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColor.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Color(0xff242424),
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: Color(0xff242424),
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  static final ThemeData darkModeApp = ThemeData(
    primaryColor: AppColor.primaryDark_Color,
    canvasColor: AppColor.primaryDark_Color,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.yellowColor, showUnselectedLabels: true),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColor.yellowColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
