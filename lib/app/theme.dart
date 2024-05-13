import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromRGBO(9, 11, 42, 1),
  primaryColor: const Color.fromRGBO(248, 5, 175, 1),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: Color.fromRGBO(248, 5, 175, 1),
    brightness: Brightness.dark,
    barBackgroundColor: Color.fromRGBO(9, 11, 42, 1),
    textTheme: CupertinoTextThemeData(
      navTitleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      navActionTextStyle: TextStyle(color: Color.fromRGBO(248, 5, 175, 1)),
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: const Color.fromRGBO(184, 168, 211, 1),
      fontWeight: FontWeight.w400,
      fontSize: 20.sp,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 34.sp,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30.sp,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24.sp,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 17.sp,
    ),
  ),
);

const surfaceColor = Color.fromRGBO(67, 65, 137, 1);
const tileColor = Color.fromRGBO(41, 46, 79, 1);
const superTileColor = Color.fromRGBO(125, 119, 233, 1);
