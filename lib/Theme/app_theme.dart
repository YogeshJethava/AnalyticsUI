import 'package:flutter/material.dart';

import '../Constants/color_constant.dart';

class AppTheme{

  static ThemeData lightTheme() {
    return ThemeData(
        colorScheme:  const ColorScheme(
            primary: ColorConstants.primaryColor,
            onPrimary: Colors.white,
            brightness: Brightness.light,
            secondary: Colors.cyan,
            surface: Colors.white,
            onSurface: ColorConstants.primaryColor,
            background: Colors.white,
            onBackground: ColorConstants.primaryColor,
            onError: Colors.red,
            onSecondary: Colors.red,
            error: Colors.red),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorConstants.appBarColor,
          foregroundColor: Colors.black,
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorConstants.black),
          actionsIconTheme: IconThemeData(
            color: ColorConstants.black,
          ),
        ),
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        primaryColor: ColorConstants.primaryColor,
        iconTheme: const IconThemeData(color: ColorConstants.black),);
  }

}