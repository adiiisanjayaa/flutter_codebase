import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppColorsTheme {
  // Define color constants
  static const Color scaffoldBackgroundLight = Color(0xFFF5F5F5);
  static const Color scaffoldBackgroundDark = Color(0xFF303030);

  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textPrimaryDark = Color(0xFFE0E0E0);

  static const Color buttonBackgroundLight = Color(0xFF6200EE);
  static const Color buttonBackgroundDark = Color(0xFFBB86FC);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColorsTheme.scaffoldBackgroundLight,
      textTheme: TextTheme(
        titleLarge: AppStyles.styleText(size: 40.sp, color: AppColorsTheme.textPrimaryLight),
        titleMedium: AppStyles.styleText(size: 35.sp, color: AppColorsTheme.textPrimaryLight),
        titleSmall: AppStyles.styleText(size: 30.sp, color: AppColorsTheme.textPrimaryLight),
        bodyLarge: AppStyles.styleText(size: 25.sp, color: AppColorsTheme.textPrimaryLight),
        bodyMedium: AppStyles.styleText(size: 20.sp, color: AppColorsTheme.textPrimaryLight),
        bodySmall: AppStyles.styleText(size: 15.sp, color: AppColorsTheme.textPrimaryLight),
      ),
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
        cursorColor: Colors.green,
        selectionColor: Colors.greenAccent,
        selectionHandleColor: Colors.lightGreen,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsTheme.buttonBackgroundLight, // Corrected parameter
          foregroundColor: Colors.white, // Button text color
        ),
      ),
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: AppColorsTheme.scaffoldBackgroundDark,
      textTheme: TextTheme(
        titleLarge: AppStyles.styleText(size: 40.sp, color: AppColorsTheme.textPrimaryDark),
        titleMedium: AppStyles.styleText(size: 35.sp, color: AppColorsTheme.textPrimaryDark),
        titleSmall: AppStyles.styleText(size: 30.sp, color: AppColorsTheme.textPrimaryDark),
        bodyLarge: AppStyles.styleText(size: 25.sp, color: AppColorsTheme.textPrimaryDark),
        bodyMedium: AppStyles.styleText(size: 20.sp, color: AppColorsTheme.textPrimaryDark),
        bodySmall: AppStyles.styleText(size: 15.sp, color: AppColorsTheme.textPrimaryDark),
      ),
      colorScheme: const ColorScheme.dark(
        surfaceTint: Colors.black,
        outline: Colors.white30,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(Colors.black),
        checkColor: MaterialStateProperty.all<Color>(Colors.white),
        side: const BorderSide(
          color: Colors.white30,
          width: 1.5,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.white30,
      ),
      dialogTheme: DialogTheme(
        surfaceTintColor: Colors.black,
        shape: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.green,
        selectionColor: Colors.greenAccent,
        selectionHandleColor: Colors.lightGreen,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsTheme.buttonBackgroundDark, // Corrected parameter
          foregroundColor: Colors.black, // Button text color
        ),
      ),
      brightness: Brightness.dark,
      useMaterial3: true,
    );
  }
}
