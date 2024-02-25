import 'package:aizen/core/themes/themes.dart';
import 'package:flutter/material.dart';

class IdealAppTheme {
  static ThemeData primary() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        surfaceTint: Colors.white,
        outline: Colors.black26,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(Colors.white),
        checkColor: MaterialStateProperty.all<Color>(Colors.white),
        side: const BorderSide(
          color: Colors.black45,
          width: 1.5,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(Colors.black45),
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.black12,
      ),
      dialogTheme: DialogTheme(
        surfaceTintColor: Colors.white,
        shape: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.green60,
        selectionColor: AppColors.green40,
        selectionHandleColor: AppColors.green2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }
}
