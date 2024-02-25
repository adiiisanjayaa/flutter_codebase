import 'package:aizen/core/themes/themes.dart';
import 'package:flutter/material.dart';

export 'text_input_field.dart';
export 'number_input_field.dart';
export 'multiple_choice_input_field.dart';
export 'email_input_field.dart';
export 'phone_input_field.dart';
export 'password_input_field.dart';
export 'search_input_field.dart';
export 'mask_input_field.dart';

enum CustomInputFieldBorderStyle {
  underlineBorder,
  outlineBorder,
}

double getTitleMargin(CustomInputFieldBorderStyle borderType) {
  switch (borderType) {
    case CustomInputFieldBorderStyle.underlineBorder:
      return 4;
    case CustomInputFieldBorderStyle.outlineBorder:
      return 10;
  }
}

EdgeInsets getAdditionalPaddingPrefixIcon(CustomInputFieldBorderStyle borderType) {
  switch (borderType) {
    case CustomInputFieldBorderStyle.underlineBorder:
      return const EdgeInsets.only(left: 0);
    case CustomInputFieldBorderStyle.outlineBorder:
      return const EdgeInsets.only(left: 16);
  }
}

EdgeInsets getAdditionalPaddingSuffixIcon(CustomInputFieldBorderStyle borderType) {
  switch (borderType) {
    case CustomInputFieldBorderStyle.underlineBorder:
      return const EdgeInsets.only(right: 0);
    case CustomInputFieldBorderStyle.outlineBorder:
      return const EdgeInsets.only(right: 16);
  }
}

EdgeInsets getContentPadding(CustomInputFieldBorderStyle borderType) {
  switch (borderType) {
    case CustomInputFieldBorderStyle.underlineBorder:
      return const EdgeInsets.symmetric(vertical: 8);
    case CustomInputFieldBorderStyle.outlineBorder:
      return const EdgeInsets.fromLTRB(16, 16, 8, 8);
  }
}

InputBorder getBorderStyle(CustomInputFieldBorderStyle borderType) {
  switch (borderType) {
    case CustomInputFieldBorderStyle.underlineBorder:
      return AppStyles.grayUnderlineInputBorder;
    case CustomInputFieldBorderStyle.outlineBorder:
      return AppStyles.grayOutlineInputBorder;
  }
}

InputBorder getFocusedBorderStyle(CustomInputFieldBorderStyle borderType) {
  switch (borderType) {
    case CustomInputFieldBorderStyle.underlineBorder:
      return AppStyles.greenUnderlineInputBorder;
    case CustomInputFieldBorderStyle.outlineBorder:
      return AppStyles.greenOutlineInputBorder;
  }
}

InputBorder getErrorBorderStyle(CustomInputFieldBorderStyle borderType) {
  switch (borderType) {
    case CustomInputFieldBorderStyle.underlineBorder:
      return AppStyles.errorUnderlineInputBorder;
    case CustomInputFieldBorderStyle.outlineBorder:
      return AppStyles.errorOutlineInputBorder;
  }
}
