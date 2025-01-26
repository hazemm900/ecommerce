import 'package:flutter/material.dart';

import 'color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: MyColors.myMutedGold),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.myMutedBlue,
      selectedItemColor: MyColors.myMutedGold,
      unselectedItemColor: Colors.white),
  textTheme: TextTheme(
    titleMedium: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: const TextStyle(
        fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
    bodyLarge: const TextStyle(
        fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
    bodySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    displayMedium: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.myMutedBlue,
      selectedItemColor: MyColors.myMutedGold,
      unselectedItemColor: Colors.white),
  textTheme: TextTheme(
    titleMedium: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: const TextStyle(
        fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
    bodyLarge: const TextStyle(
        fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
    bodySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    displayMedium: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
  ),
);
