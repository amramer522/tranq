import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primary = Color(0xff284243);
  static const appName = "Tranquility";
  static const appSlogn = "Together Towards Tranquility";
  static const appDescription = "Empower your mental well-being with Tranquility, your trusted companion on the path to inner peace and resilience";
  static var appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:  AppBarTheme(
        color: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          color: Colors.black
        ),
        titleSpacing: 0,
        surfaceTintColor: Colors.transparent),
    useMaterial3: true,
    fontFamily: "inter",
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
      fixedSize: Size.fromHeight(60.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    )),
    dividerTheme: DividerThemeData(
      color: Colors.black.withOpacity(.20),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: primary, strokeAlign: BorderSide.strokeAlignInside),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      background: primary,
    ),
  );
}
