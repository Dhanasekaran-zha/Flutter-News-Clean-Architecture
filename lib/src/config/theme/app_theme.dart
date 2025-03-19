import 'package:flutter/material.dart';
import 'package:news_clean_architecture/src/constants/app_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppFontFamily.OUTFIT,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.red,
    elevation: 100,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: AppFontFamily.OUTFIT,
      fontSize: AppFontSize.XXL,
      fontWeight: AppFontWeight.SEMI_BOLD,
    ),
  );
}
