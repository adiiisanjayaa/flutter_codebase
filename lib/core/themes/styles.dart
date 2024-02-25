import 'package:flutter/material.dart';

import 'themes.dart';

class AppStyles {
  AppStyles._();

  static TextStyle styleTextBody36({
    Color? colorText,
    double? size = 36,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody34({
    Color? colorText,
    double? size = 34,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody32({
    Color? colorText,
    double? size = 32,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody30({
    Color? colorText,
    double? size = 30,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody28({
    Color? colorText,
    double? size = 28,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody26({
    Color? colorText,
    double? size = 26,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody24({
    Color? colorText,
    double? size = 24,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody20({
    Color? colorText,
    double? size = 20,
    FontWeight? fontWeight,
    double? height = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody18({
    Color? colorText,
    double? size = 18,
    double? height = 1,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody16({
    Color? colorText,
    double? size = 16,
    double? height = 1,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody14({
    Color? colorText,
    double? size = 14,
    double? height = 1,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody12({
    Color? colorText,
    double? size = 12,
    double? height = 1,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody10({
    Color? colorText,
    double? size = 10,
    double? height = 1,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: FontFamily.MavenPro,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
        letterSpacing: letterSpacing,
      );

  static TextStyle styleTextBody10OpenSans({Color? colorText, double? size = 10, FontWeight? fontWeight, double? height = 1, TextDecoration? decoration}) => TextStyle(
        fontFamily: FontFamily.OpenSans,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody12OpenSans({Color? colorText, double? size = 12, FontWeight? fontWeight, double? height = 1, TextDecoration? decoration}) => TextStyle(
        fontFamily: FontFamily.OpenSans,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody14OpenSans({Color? colorText, double? size = 14, FontWeight? fontWeight, double? height = 1, FontStyle? fontStyle, TextDecoration? decoration}) => TextStyle(
        fontFamily: FontFamily.OpenSans,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        fontStyle: fontStyle,
        decoration: decoration,
      );

  static TextStyle styleTextBody16OpenSans({Color? colorText, double? size = 16, FontWeight? fontWeight, double? height = 1, TextDecoration? decoration}) => TextStyle(
        fontFamily: FontFamily.OpenSans,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static TextStyle styleTextBody18OpenSans({Color? colorText, double? size = 18, FontWeight? fontWeight, double? height = 1, TextDecoration? decoration}) => TextStyle(
        fontFamily: FontFamily.OpenSans,
        color: colorText,
        fontWeight: fontWeight,
        fontSize: size,
        height: height,
        decoration: decoration,
      );

  static LinearGradient aquaGradient() => const LinearGradient(colors: AppColors.colorGradient, begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static LinearGradient categoryGradientUnselectedWhite() => const LinearGradient(colors: AppColors.colorGradient, begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static InputDecoration inputDecorationFloating(String floatingLabel, String hint, {Widget? suffixIcon}) => InputDecoration(
        labelText: floatingLabel,
        alignLabelWithHint: true,
        labelStyle: AppStyles.styleTextBody16(fontWeight: FontWeight.w700, colorText: AppColors.grayDark),
        floatingLabelStyle: AppStyles.styleTextBody18(fontWeight: FontWeight.w400, colorText: AppColors.grayDark),
        counterText: "",
        hintText: hint,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayInnerBorder, width: 1.0),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayInnerBorder, width: 1.0),
        ),
        suffixIcon: suffixIcon,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textBlack, width: 1.0),
        ),
      );

  static LinearGradient bgSliverHome() => const LinearGradient(colors: [AppColors.colorBackgroundInbox, AppColors.colorBackgroundInbox], begin: Alignment.centerLeft, end: Alignment.centerRight);

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
