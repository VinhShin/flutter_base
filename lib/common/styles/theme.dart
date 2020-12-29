import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get MyTheme {
    return ThemeData(
        brightness: Brightness.light,
        splashColor: AppColors.primaryColor,
        primaryColorBrightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        fontFamily: 'Roboto',
        primaryIconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(color: AppColors.primaryColor),
        textTheme: TextTheme(
          button: TextStyle(
              color: AppColors.accentColor,
              fontFamily: 'Roboto',
              fontSize: 16.0)
        )
    );
  }
}
