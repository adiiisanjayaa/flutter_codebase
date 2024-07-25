import 'package:flutter/material.dart';

import 'themes.dart';

class AppStyles {
  AppStyles._();

  static TextStyle styleText({
    Color? color,
    required double size,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static const InputBorder grayUnderlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.grayInnerBorder,
      width: 1.0,
    ),
  );

  static const InputBorder greenUnderlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.green,
      width: 1.0,
    ),
  );

  static const InputBorder errorUnderlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.negative,
      width: 1.0,
    ),
  );

  static const InputBorder grayOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.grayMedium,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  static const InputBorder greenOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.green,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  static const InputBorder errorOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.negative,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
}
