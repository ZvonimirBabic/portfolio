import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: PortfolioAppColors.black),
  scaffoldBackgroundColor: PortfolioAppColors.white,
  dividerColor: PortfolioAppColors.black.withOpacity(0.5),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        PortfolioAppColors.white,
      ),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: PortfolioAppColors.white),
  scaffoldBackgroundColor: PortfolioAppColors.black,
  dividerColor: PortfolioAppColors.white.withOpacity(0.5),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        PortfolioAppColors.black,
      ),
    ),
  ),
);
