import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStylesManager {
  //! White
  static TextStyle white24Bold = TextStyle(
    color: ColorsManager.white,
    fontSize: 24.sp,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle white24Regular = TextStyle(
    color: ColorsManager.white,
    fontSize: 24.sp,
    fontWeight: FontWeightManager.regular,
  );

  //! Black
  static TextStyle black168Bold = TextStyle(
    color: ColorsManager.black,
    fontSize: 168.sp,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle black72Semibold = TextStyle(
    color: ColorsManager.black,
    fontSize: 72.sp,
    fontWeight: FontWeightManager.semiBold,
  );
  static TextStyle black24Bold = TextStyle(
    color: ColorsManager.black,
    fontSize: 24.sp,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle black24Regular = TextStyle(
    color: ColorsManager.black,
    fontSize: 24.sp,
    fontWeight: FontWeightManager.regular,
  );

  //! Dark Gray
  static TextStyle darkGray72Semibold = TextStyle(
    color: ColorsManager.darkGray,
    fontSize: 72.sp,
    fontWeight: FontWeightManager.semiBold,
  );

  //! Red
  static TextStyle red72Semibold = TextStyle(
    color: ColorsManager.red,
    fontSize: 72.sp,
    fontWeight: FontWeightManager.semiBold,
  );

  //! Colorless
  static TextStyle color18Bold(Color color) => TextStyle(
        color: color,
        fontSize: 18.sp,
        fontWeight: FontWeightManager.bold,
      );

  TextStylesManager._internal();
}

class FontWeightManager {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
