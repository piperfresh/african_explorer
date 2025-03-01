import 'package:african_explorer/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
        textTheme: textTheme(),
        brightness: Brightness.light,
        fontFamily: 'Inter');
  }

  static TextTheme textTheme() {
    return TextTheme(
        bodyLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 28.sp,
      color: AppColor.black,
    ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: AppColor.black,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
        color: AppColor.black,
      ),
    );
  }
}
