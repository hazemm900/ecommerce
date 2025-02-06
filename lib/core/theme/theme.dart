import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: const IconThemeData(color: MyColors.myMutedGold),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.sp)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.myMutedBlue,
      selectedItemColor: MyColors.myMutedGold,
      unselectedItemColor: Colors.white),
  textTheme: TextTheme(
    titleMedium: TextStyle(
        fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 36.sp, fontWeight: FontWeight.w700, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 24.sp, fontWeight: FontWeight.w800, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade500),
    bodySmall: TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.sp)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.myMutedBlue,
      selectedItemColor: MyColors.myMutedGold,
      unselectedItemColor: Colors.white),
  textTheme: TextTheme(
    titleMedium: TextStyle(
        fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: TextStyle(
        fontSize: 36.sp, fontWeight: FontWeight.w700, color: Colors.white),
    bodyLarge: TextStyle(
        fontSize: 24.sp, fontWeight: FontWeight.w800, color: Colors.white),
    bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade500),
    bodySmall: TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white),
    displayMedium: TextStyle(
        fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
  ),
);
